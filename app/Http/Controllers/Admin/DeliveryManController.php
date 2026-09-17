<?php

namespace App\Http\Controllers\Admin;


use File;
use Image;
use App\Models\DeliveryMan;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\DeliveryManWithdraw;
use Illuminate\Support\Facades\Log;
use Modules\Order\App\Models\Order;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Modules\GlobalSetting\App\Models\GlobalSetting;

class DeliveryManController extends Controller
{
    public function deliveryman_index(){
        $deliverymans = DeliveryMan::all();
        return view('admin.deliveryman.index', compact('deliverymans'));
    }
    public function deliveryman_show($id){

        $deliveryman=DeliveryMan::findOrFail($id);
        $withdraw_list = DeliveryManWithdraw::where('deliveryman_id', $id)->get();
        $withdraw_without_reject_list = DeliveryManWithdraw::where('deliveryman_id', $id)->where('status', '!=','rejected')->get();

        $complete = (float) Order::where('delivery_man_id', $id)->where('payment_status', 'success')->where('order_request', 3)->sum('delivery_charge');
        $cancel = (float) Order::where('delivery_man_id', $id)->where('payment_status', 'success')->where('order_request', 4)->sum('delivery_charge');

        $total_income = $complete + $cancel;
        $commission_type = GlobalSetting::where('key', 'commission_type')->value('value');
        $Commission_per_delivery = (float) (GlobalSetting::where('key', 'Commission_per_delivery')->value('value') ?? 0);
        $total_commission = 0.00;
        $net_income = $total_income;
        if($commission_type == 'commission'){
            $total_commission = ($Commission_per_delivery / 100) * $total_income;
            $net_income = $total_income - $total_commission;
        }

        $total_withdraw_amount = (float) $withdraw_without_reject_list->sum('total_amount');

        $current_balance = $net_income - $total_withdraw_amount;

        $pending_withdraw = (float) DeliveryManWithdraw::where('deliveryman_id', $id)->where('status', 'pending')->sum('total_amount');

        $orders=Order::where('delivery_man_id', $id)->get();

        return view('admin.deliveryman.show', [
            'withdraw_list' => $withdraw_list,
            'total_income' => $total_income,
            'total_commission' => $total_commission,
            'net_income' => $net_income,
            'current_balance' => $current_balance,
            'total_withdraw_amount' => $total_withdraw_amount,
            'pending_withdraw' => $pending_withdraw,
            'deliveryman' => $deliveryman,
            'orders' => $orders,
        ]);

    }

    public function order_show($id){
        $deliverymans=DeliveryMan::latest()->get();
        $order = Order::findOrFail($id);
        return view('admin.deliveryman.order_show', compact('order','deliverymans'));
    }

    public function create(){
        return view('admin.deliveryman.create');
    }

    public function deliveryman_store(Request $request){
        $request->validate([
            'fname' => 'required|string|max:255',
            'email' => 'required|email|unique:delivery_men,email',
            'password' => 'required|string|min:4',
            'phone' => 'required|string|max:255',
        ], [
            'fname.required' => trans('translate.First name is required'),
            'email.required' => trans('translate.Email is required'),
            'email.email' => trans('translate.Invalid email format'),
            'email.unique' => trans('translate.Email already exists'),
            'password.required' => trans('translate.Password is required'),
            'password.min' => trans('translate.Password must be at least 4 characters'),
            'phone.required' => trans('translate.Phone is required'),
        ]);

        $deliveryman = new DeliveryMan();
        $deliveryman->fname = $request->fname;
        $deliveryman->lname = $request->lname ?? '';
        $deliveryman->status = $request->has('status') ? (int)$request->status : 1;
        $deliveryman->man_type = $request->man_type ?? 'delivery_man';
        $deliveryman->email = $request->email;
        $deliveryman->password = Hash::make($request->password);
        $deliveryman->phone = $request->phone;
        $deliveryman->is_email_verified = 1;
        $deliveryman->verified_at = now();

        if ($request->hasFile('man_image')) {
            try {
                $user_image = $request->file('man_image');
                $extension = $user_image->getClientOriginalExtension();
                $image_name = Str::slug($request->fname) . date('-Y-m-d-h-i-s-') . rand(999, 9999) . '.' . $extension;

                $image_path = 'uploads/custom-images/' . $image_name;

                // Ensure the directory exists
                $directory = public_path('uploads/custom-images');
                if (!is_dir($directory)) {
                    mkdir($directory, 0775, true);
                }

                // Save the image
                Image::make($user_image)->save(public_path($image_path));

                // Save the image path in DB
                $deliveryman->man_image = $image_path;
            } catch (\Exception $e) {
                Log::error('Image upload failed: ' . $e->getMessage());
            }
        }

        $deliveryman->save();

        $notification = ['message' => trans('translate.Deliveryman created successfully'), 'alert-type' => 'success'];
        return redirect()->route('admin.deliveryman-index')->with($notification);
    }

    public function deliveryman_edit($id)
    {
        $deliveryman = DeliveryMan::findOrFail($id);
        return view('admin.deliveryman.edit', compact('deliveryman'));
    }


    public function deliveryman_update(Request $request, $id)
    {
        $deliveryman = DeliveryMan::findOrFail($id);

        $request->validate([
            'fname' => 'required|string|max:255',
            'email' => 'required|email|unique:delivery_men,email,' . $id,
            'password' => 'nullable|string|min:4',
            'phone' => 'required|string|max:255',
        ], [
            'fname.required' => trans('translate.First name is required'),
            'email.required' => trans('translate.Email is required'),
            'email.email' => trans('translate.Invalid email format'),
            'email.unique' => trans('translate.Email already exists'),
            'phone.required' => trans('translate.Phone is required'),
        ]);

        $deliveryman->fname = $request->fname;
        $deliveryman->lname = $request->lname ?? $deliveryman->lname;
        $deliveryman->email = $request->email;
        $deliveryman->idn_type = $request->idn_type;
        $deliveryman->idn_num = $request->idn_num;
        $deliveryman->man_type = $request->man_type ?? $deliveryman->man_type;
        $deliveryman->phone = $request->phone;
        if ($request->has('status')) {
            $deliveryman->status = (int)$request->status;
        }
        if ($request->filled('password')) {
            $deliveryman->password = Hash::make($request->password);
        }

        if ($request->hasFile('man_image')) {
            try {
                $user_image = $request->file('man_image');
                $extension = $user_image->getClientOriginalExtension();
                $image_name = Str::slug($request->fname) . date('-Y-m-d-h-i-s-') . rand(999, 9999) . '.' . $extension;

                $image_path = 'uploads/custom-images/' . $image_name;

                // Check if the directory exists, if not create it
                $directory = public_path('uploads/custom-images');
                if (!is_dir($directory)) {
                    mkdir($directory, 0775, true);
                }

                // Save image to the public path
                Image::make($user_image)->save(public_path($image_path)); // Save the image

                // Update the deliveryman image path
                $deliveryman->man_image = $image_path;
            } catch (\Exception $e) {
                Log::error('Image upload failed: ' . $e->getMessage());
            }
        }

        $deliveryman->save(); // Save the updated deliveryman data

        $notification = ['message' => trans('translate.Deliveryman updated successfully'), 'alert-type' => 'success'];
        return redirect()->route('admin.deliveryman-index')->with($notification);
    }

    public function deliveryman_pending(){
        $deliverymans = DeliveryMan::where('status', '!=', 1)->orWhereNull('status')->get();
        return view('admin.deliveryman.pending', compact('deliverymans'));
    }

    public function deliveryman_delete($id){

        $deliveryman = DeliveryMan::findOrFail($id);

        $order_qty = Order::where('delivery_man_id', $id)->count();

        if($order_qty > 0){
            $notification = trans('translate.You can not delete this deliveryman, multiple orders available under this deliveryman');
            $notification = array('message'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }

        $deliveryman->delete();

        $notification = trans('translate.Deleted Successfully');
        $notification = array('message'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function deliveryman_status($id){
        $deliveryman = DeliveryMan::findOrFail($id);
        $deliveryman->status = $deliveryman->status == 1 ? 0 : 1;
        $deliveryman->save();

        $notification = trans('translate.Deliveryman status changed successfully');
        $notification = array('message'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }
}
