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
        $order->save();

        $message = trans('translate.Status Changed Successfully');

        if ($request->ajax() || $request->wantsJson()) {
            return response()->json([
                'status' => 'success',
                'message' => $message,
                'order_status' => (int)$order->order_status
            ]);
        }

        $notification = array('message'=>$message,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }
}
