<?php

namespace App\Http\Controllers\Deliveryman;

use Auth;
use App\Models\Setting;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\DeliveryMan;
use Modules\Order\App\Models\Order;

class DeliveryManOrderController extends Controller
{
    public function index(){
        $deliveryman_id=Auth::guard('deliveryman')->user()->id;
        $orders = Order::with('user')->where('delivery_man_id', $deliveryman_id)->where('order_request', 1)->orderBy('id', 'desc')->get();
        $title = trans('translate.admin_validation.All Orders');

        return view('deliveryman.orders', compact('title','orders'));
    }
    public function orderRequest(){
        $deliveryman_id=Auth::guard('deliveryman')->user()->id;
        $orders = Order::with('user')
            ->where(function($q) use ($deliveryman_id) {
                $q->where(function($sub) use ($deliveryman_id) {
                    $sub->where('delivery_man_id', $deliveryman_id)->where('order_request', 0);
                })->orWhere(function($sub) {
                    $sub->where(function($inner) {
                        $inner->whereNull('delivery_man_id')->orWhere('delivery_man_id', 0);
                    })->whereIn('order_status', [2, 3, 4]);
                });
            })
            ->whereNotIn('order_status', [5, 6])
            ->where(function($q) {
                $q->whereNull('order_type')->orWhere('order_type', 'delivery');
            })
            ->orderBy('id','desc')->get();
        $title = trans('translate.admin_validation.All Orders');
        return view('deliveryman.order_request', compact('title', 'orders'));
    }

    public function completedOrder(){
        $deliveryman_id=Auth::guard('deliveryman')->user()->id;
        $orders = Order::with('user')->where('delivery_man_id', $deliveryman_id)->where('order_request', '=', 3)->orderBy('id','desc')->get();
        $title = trans('translate.admin_validation.All Orders');

        return view('deliveryman.completed_order', compact('title','orders'));
    }
    public function canceledOrder(){
        $deliveryman_id=Auth::guard('deliveryman')->user()->id;
        $orders = Order::with('user')->where('delivery_man_id', $deliveryman_id)->where('order_request', '=', 4)->orderBy('id','desc')->get();
        $title = trans('translate.admin_validation.All Orders');

        return view('deliveryman.canceled_order', compact('title','orders'));
    }
    public function show($id){

        $deliverymans=DeliveryMan::latest()->get();
        $order = Order::findOrFail($id);
        return view('deliveryman.show_order', compact('order','deliverymans'));
    }
    public function updateOrderStatus(Request $request , $id){
        $rules = [
            'order_status' =>'required',
            'payment_status' => 'required',
        ];
        $this->validate($request, $rules);

        $order = Order::find($id);
         if($request->order_status == 3){
            $order->order_request=3;
            $order->order_status =3;
            $order->order_completed_date = date('Y-m-d');
            $order->save();
        }else if($request->order_status == 4){
            $order->order_request=4;
            $order->order_status = 4;
            $order->order_declined_date = date('Y-m-d');
            $order->save();
        }

        if($request->payment_status == 0){
            $order->payment_status = 0;
            $order->save();
        }elseif($request->payment_status == 1){
            $order->payment_status = 1;
            $order->payment_approval_date = date('Y-m-d');
            $order->save();
        }
        $notification = trans('translate.admin_validation.Order Status Updated successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function orderRequestStatus(Request $request, $id){
        $rules = [
            'order_request_status' => 'required',
        ];
        $this->validate($request, $rules);
        $deliveryman_id=Auth::guard('deliveryman')->user()->id;
        $order = Order::where('id', $id)
            ->where(function($q) use ($deliveryman_id) {
                $q->where('delivery_man_id', $deliveryman_id)
                  ->orWhereNull('delivery_man_id')
                  ->orWhere('delivery_man_id', 0);
            })->first();

        if (!$order) {
            $notification = array('message'=>'Order not found or already assigned','alert-type'=>'error');
            return redirect()->back()->with($notification);
        }

        if($request->order_request_status == 1){
            $order->delivery_man_id = $deliveryman_id;
            $order->order_request=1;
            $order->order_status=4; // On the way
            $order->order_req_accept_date = date('Y-m-d');
            $order->save();

            if ($order->user_id) {
                try {
                    $dm = Auth::guard('deliveryman')->user();
                    $riderName = trim(($dm->fname ?? '') . ' ' . ($dm->lname ?? ''));
                    \App\Models\AppNotification::create([
                        'user_id' => $order->user_id,
                        'user_type' => 'user',
                        'title' => 'Delivery Partner Assigned!',
                        'message' => ($riderName ?: 'A delivery partner') . ' has accepted your order #' . ($order->order_id ?? $order->id) . ' and is heading your way.',
                        'order_id' => $order->id,
                        'type' => 'order',
                        'is_read' => 0
                    ]);
                } catch (\Exception $e) {}
            }
        }elseif($request->order_request_status == 2){
            $order->order_request=2;
            $order->save();
        }elseif($request->order_request_status == 3){
            $order->order_request=3;
            $order->order_status=5; // Delivered
            $order->order_completed_date = date('Y-m-d');
            $order->save();

            if ($order->user_id) {
                try {
                    \App\Models\AppNotification::create([
                        'user_id' => $order->user_id,
                        'user_type' => 'user',
                        'title' => 'Order Delivered!',
                        'message' => 'Your order #' . ($order->order_id ?? $order->id) . ' has been delivered. Enjoy your meal!',
                        'order_id' => $order->id,
                        'type' => 'order',
                        'is_read' => 0
                    ]);
                } catch (\Exception $e) {}
            }
        }elseif($request->order_request_status == 4){
            $order->order_request=4;
            $order->order_status=6;
            $order->order_declined_date = date('Y-m-d');
            $order->save();
        }
        $notification = trans('translate.Order Request Status Updated successfully');
        $notification = array('message'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }
}
