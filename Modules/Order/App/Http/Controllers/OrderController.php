<?php

namespace Modules\Order\App\Http\Controllers;

use Exception;
use App\Models\User;
use App\Models\AppNotification;
use App\Models\DeliveryMan;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Mail\NewOrderConfirmation;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\Log;
use Modules\Order\App\Models\Order;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use Illuminate\Http\RedirectResponse;
use Illuminate\Contracts\View\Factory;
use Illuminate\Foundation\Application;
use Modules\Order\App\Models\OrderItem;
use Modules\Product\App\Models\Product;
use Modules\SmsSetting\App\Models\SmsSetting;
use Modules\SmsSetting\App\Models\SmsTemplate;
use Modules\EmailSetting\App\Models\EmailTemplate;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $sortBy = $request->get('sort_by', 'id');
        $sortOrder = $request->get('order', $request->get('sort_order', 'desc'));
        if (!in_array(strtolower($sortOrder), ['asc', 'desc'])) {
            $sortOrder = 'desc';
        }

        $orders = Order::when($request->has('order_type') && $request->order_type == 'delivery', function($query){
            $query->where('order_type', 'delivery');
        })
        ->when($request->has('order_type') && $request->order_type == 'pickup', function($query){
            $query->where('order_type', 'pickup');
        })
        ->when($request->has('order_status') && !empty($request->order_status), function($query) use ($request){
            $query->where('order_status', $request->order_status);
        })
        ->orderBy($sortBy, $sortOrder)->get();


        $products = Product::with('translate_product')->latest()->get();

        return view('order::index', compact('orders', 'products'));
    }

    /**
     * Show the order details resource.
     */
    public function order_details($id): Factory|Application|View|\Illuminate\Contracts\Foundation\Application
    {
        $deliverymans=DeliveryMan::latest()->get();
        $order = Order::find($id);
        return view('order::details', compact('order','deliverymans'));
    }

    public function order_status_change(Request $request, $id)
    {
        $order = Order::findOrFail($id);
        $order->order_status = $request->order_status;
        $order->save();

        $message = trans('translate.Status Changed Successfully');

        // Status metadata for dynamic UI badge updates
        $statusLabels = [
            1 => ['label' => trans('translate.Pending'), 'badge' => 'badge bg-warning text-white', 'tag' => 'tag denger'],
            2 => ['label' => trans('translate.Confirmed'), 'badge' => 'badge bg-success text-white', 'tag' => 'tag'],
            3 => ['label' => trans('translate.Processing'), 'badge' => 'badge bg-warning text-white', 'tag' => 'tag'],
            4 => ['label' => trans('translate.Food on the way'), 'badge' => 'badge bg-inprocees text-white', 'tag' => 'tag'],
            5 => ['label' => trans('translate.Delivered'), 'badge' => 'badge bg-success text-white', 'tag' => 'tag'],
            6 => ['label' => trans('translate.Cancel'), 'badge' => 'badge bg-warning text-white', 'tag' => 'tag'],
        ];

        $statusInfo = $statusLabels[$order->order_status] ?? ['label' => trans('translate.Unknown'), 'badge' => 'badge bg-secondary', 'tag' => 'tag'];

        // Instantly generate In-App Live Notification for Customer
        try {
            AppNotification::createOrderStatusNotification($order, (int)$order->order_status, $statusInfo['label']);
        } catch (\Throwable $ex) {
            Log::info('AppNotification create notice: ' . $ex->getMessage());
        }

        // Helper closure to send email & SMS notifications without stalling response
        $sendNotifications = function() use ($order, $request) {
            try {
                $template = null;
                if($request->order_status == 2){
                    $template = EmailTemplate::find(6);
                    $this->send_sms_top($order, 'order_accept_to_user');
                }elseif($request->order_status == 3){
                    $template = EmailTemplate::find(7);
                    $this->send_sms_top($order, 'order_process_to_user');
                }elseif($request->order_status == 4){
                    $template = EmailTemplate::find(8);
                    $this->send_sms_top($order, 'order_on_way_to_user');
                }elseif($request->order_status == 5){
                    $template = EmailTemplate::find(9);
                    $this->send_sms_top($order, 'order_deliver_to_user');
                }elseif($request->order_status == 6){
                    $template = EmailTemplate::find(10);
                    $this->send_sms_top($order, 'order_cancel_to_user');
                }

                if($template != null){
                    $msg = $template->description;
                    $subject = $template->subject;
                    $msg = str_replace('{{order_id}}',$order->id,$msg);

                    if($order->is_guest && $order->is_guest == 1){
                        $address_info = json_decode($order->delivery_address,true);
                        $msg = str_replace('{{user_name}}',$address_info['contact_person_name'] ?? '',$msg);
                        if (!empty($address_info['contact_person_email'])) {
                            Mail::to($address_info['contact_person_email'])->send(new NewOrderConfirmation($msg,$subject));
                        }
                    }else{
                        $user = User::find($order->user_id);
                        if ($user && !empty($user->email)) {
                            $msg = str_replace('{{user_name}}',$user->name,$msg);
                            $msg = str_replace('{{order_id}}',$order->id,$msg);
                            Mail::to($user->email)->send(new NewOrderConfirmation($msg,$subject));
                        }
                    }
                }
            } catch(\Throwable $ex) {
                Log::info('Order email/sms notification notice: ' . $ex->getMessage());
            }
        };

        if ($request->ajax() || $request->wantsJson()) {
            $jsonPayload = [
                'status' => 'success',
                'message' => $message,
                'order_status' => (int)$order->order_status,
                'state_label' => $statusInfo['label'],
                'badge_class' => $statusInfo['badge'],
                'tag_class' => $statusInfo['tag'],
            ];

            // If PHP-FPM is used (e.g. Railway / Nginx), send output and close connection immediately (<20ms)
            if (function_exists('fastcgi_finish_request')) {
                response()->json($jsonPayload)->send();
                fastcgi_finish_request();
                $sendNotifications();
                exit;
            }

            // Otherwise, register shutdown function to run email after connection closes
            register_shutdown_function($sendNotifications);
            return response()->json($jsonPayload);
        }

        register_shutdown_function($sendNotifications);
        $notification = array('message'=>$message,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    private function send_sms_top($order, $order_status){
        try{

            $sms_setting = SmsSetting::where('key', $order_status)->first();

            if($sms_setting && $sms_setting->value == 'active'){
                $template = SmsTemplate::where('template_key', $order_status)->first();

                if($template){
                    $message = $template->description;
                    $subject = $template->subject;

                    if($order->is_guest && $order->is_guest == 1){

                        $address_info = json_decode($order->delivery_address,true);
                        $message = str_replace('{{order_id}}',$order->id,$message);
                        $message = str_replace('{{user_name}}',$address_info['contact_person_name'] ?? '',$message);

                        if(!empty($address_info['contact_person_number'])){
                            sendMobileOTP($address_info['contact_person_number'], $message);
                        }

                    }else{
                        $user = User::find($order->user_id);
                        if ($user && !empty($user->phone)) {
                            $message = str_replace('{{user_name}}',$user->name,$message);
                            $message = str_replace('{{order_id}}',$order->id,$message);
                            sendMobileOTP($user->phone, $message);
                        }

                    }

                }
            }

        }catch(\Throwable $ex){
            Log::info('SMS send notice: ' . $ex->getMessage());
        }
    }

    public function payment_status_change(Request $request, $id)
    {
        $order = Order::findOrFail($id);
        $order->payment_status = $request->payment_status;
        $order->save();

        $message = trans('translate.Status Changed Successfully');

        if ($request->ajax() || $request->wantsJson()) {
            return response()->json([
                'status' => 'success',
                'message' => $message,
                'payment_status' => $order->payment_status,
                'is_paid' => $order->payment_status === 'success'
            ]);
        }

        $notification = array('message'=>$message,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function deliveryman(Request $request, $id): RedirectResponse
    {
        $order = Order::findOrFail($id);
        $order->delivery_man_id = $request->delivery_man_id;
        if ($request->delivery_man_id) {
            $order->order_request = 0;
        }
        $order->save();

        $message = trans('translate.Delivery man assigned successfully');
        $notification = array('message'=>$message,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function delete_order($id): RedirectResponse
    {
        try{
            OrderItem::where('order_id',$id)->delete();
            Order::where('id',$id)->delete();

            $message = trans('translate.Delete Successfully');
            $notification = array('message'=>$message,'alert-type'=>'success');
            return redirect()->route('admin.order.index')->with($notification);

        }catch(\Exception $e)
        {
            $message = $e->getMessage();
            $notification = array('message'=>$message,'alert-type'=>'success');
            return redirect()->back()->with($notification);
        }
    }

    public function invoice($id): Factory|Application|View|\Illuminate\Contracts\Foundation\Application
    {
        $order = Order::findOrFail($id);
        return view('order::invoice',compact('order'));
    }

}
