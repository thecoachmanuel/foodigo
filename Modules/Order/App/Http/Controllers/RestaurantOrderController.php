<?php

namespace Modules\Order\App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Foundation\Application;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Modules\Order\App\Models\Order;

class RestaurantOrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): Factory|Application|View|\Illuminate\Contracts\Foundation\Application
    {
        $sortBy = $request->get('sort_by', 'id');
        $sortOrder = $request->get('order', $request->get('sort_order', 'desc'));
        if (!in_array(strtolower($sortOrder), ['asc', 'desc'])) {
            $sortOrder = 'desc';
        }

        $orders = Order::where('restaurant_id', Auth::guard('restaurant')->user()->id)
            ->when($request->has('order_type') && $request->order_type == 'delivery', function($query){
                $query->where('order_type', 'delivery');
            })
            ->when($request->has('order_type') && $request->order_type == 'pickup', function($query){
                $query->where('order_type', 'pickup');
            })
            ->orderBy($sortBy, $sortOrder)
            ->get();
        return view('order::restaurant.index', compact('orders'));
    }


    /**
     * Show the order details resource.
     */
    public function order_details($id): Factory|Application|View|\Illuminate\Contracts\Foundation\Application
    {
        $order = Order::findOrFail($id);
        return view('order::restaurant.details', compact('order'));
    }

    public function invoice($id): Factory|Application|View|\Illuminate\Contracts\Foundation\Application
    {
        $order = Order::find($id);
        return view('order::restaurant.invoice',compact('order'));
    }

    public function order_status_change(Request $request, $id)
    {
        $order = Order::findOrFail($id);
        $order->order_status = $request->order_status;

        // Auto broadcast to nearby riders when restaurant confirms or starts preparing delivery orders
        if (in_array((int)$request->order_status, [2, 3]) && ($order->order_type == 'delivery' || empty($order->order_type))) {
            if (!$order->delivery_man_id) {
                $order->order_request = 1;
                $order->order_req_date = now();

                try {
                    \App\Models\AppNotification::createDeliveryBroadcastNotification($order, $order->restaurant?->restaurant_name ?? $order->restaurant?->name);
                } catch (\Throwable $e) {}
            }
        }

        $order->save();

        // Instantly generate In-App Live Notification for Customer
        try {
            $statusLabels = [
                1 => "Pending",
                2 => "Confirmed",
                3 => "Processing",
                4 => "Food on the way",
                5 => "Delivered",
                6 => "Canceled",
            ];
            $label = $statusLabels[(int)$order->order_status] ?? "Updated";
            \App\Models\AppNotification::createOrderStatusNotification($order, (int)$order->order_status, $label);
        } catch (\Throwable $ex) {
            \Illuminate\Support\Facades\Log::info("AppNotification restaurant notice: " . $ex->getMessage());
        }

        $message = trans('translate.Status Changed Successfully');

        if ($request->ajax() || $request->wantsJson()) {
            return response()->json([
                'status' => 'success',
                'message' => $message,
                'order_status' => (int)$order->order_status,
                'order_request' => (int)$order->order_request,
            ]);
        }

        $notification = array('message'=>$message,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function broadcast_to_riders(Request $request, $id)
    {
        $order = Order::where('restaurant_id', Auth::guard('restaurant')->user()->id)->findOrFail($id);
        $order->order_request = 1;
        $order->order_req_date = now();
        $order->save();

        try {
            \App\Models\AppNotification::createDeliveryBroadcastNotification($order, $order->restaurant?->restaurant_name ?? $order->restaurant?->name);
        } catch (\Throwable $e) {}

        $message = "Order successfully broadcast to all nearby delivery partners!";
        if ($request->ajax() || $request->wantsJson()) {
            return response()->json(['status' => 'success', 'message' => $message]);
        }
        return redirect()->back()->with(['message' => $message, 'alert-type' => 'success']);
    }
}
