<?php

namespace App\Http\Controllers\Deliveryman;

use Auth;
use App\Models\Setting;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\DeliveryMan;
use App\Models\OrderDeliveryManRejection;
use Modules\Order\App\Models\Order;
use Illuminate\Support\Facades\DB;

class DeliveryManOrderController extends Controller
{
    /**
     * Calculate Haversine distance in km
     */
    private function calculateHaversineDistance($lat1, $lon1, $lat2, $lon2): float
    {
        $earthRadius = 6371;
        $dLat = deg2rad($lat2 - $lat1);
        $dLon = deg2rad($lon2 - $lon1);

        $a = sin($dLat / 2) * sin($dLat / 2) +
             cos(deg2rad($lat1)) * cos(deg2rad($lat2)) *
             sin($dLon / 2) * sin($dLon / 2);

        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));
        return $earthRadius * $c;
    }

    public function index(){
        $deliveryman_id = Auth::guard('deliveryman')->user()->id;
        $orders = Order::with('user', 'restaurant')
            ->where('delivery_man_id', $deliveryman_id)
            ->where('order_request', 1)
            ->whereNotIn('order_status', [5, 6])
            ->orderBy('id', 'desc')
            ->get();
        $title = trans('translate.admin_validation.All Orders');

        return view('deliveryman.orders', compact('title','orders'));
    }

    public function orderRequest(Request $request){
        $rider = Auth::guard('deliveryman')->user();
        $deliveryman_id = $rider->id;
        $riderLat = (float)($request->latitude ?? $rider->latitude);
        $riderLng = (float)($request->longitude ?? $rider->longitude);

        $orders = Order::with(['user', 'restaurant', 'address', 'items.products'])
            // Unclaimed / broadcast orders only: as soon as any rider accepts, it leaves the pool
            ->where(function($inner) {
                $inner->whereNull('delivery_man_id')->orWhere('delivery_man_id', 0);
            })
            ->where('order_request', 1)
            ->whereIn('order_status', [2, 3])
            // Exclude orders this rider has explicitly rejected
            ->whereDoesntHave('rejections', function($q) use ($deliveryman_id) {
                $q->where('delivery_man_id', $deliveryman_id);
            })
            ->whereNotIn('order_status', [5, 6])
            ->where(function($q) {
                $q->whereNull('order_type')->orWhere('order_type', 'delivery');
            })
            ->orderBy('id','desc')
            ->get();

        // Calculate distance for each order
        $orders->each(function ($order) use ($riderLat, $riderLng) {
            $restLat = (float)($order->restaurant?->latitude ?? 0);
            $restLng = (float)($order->restaurant?->longitude ?? 0);
            if ($riderLat && $riderLng && $restLat && $restLng) {
                $order->distance_km = round($this->calculateHaversineDistance($riderLat, $riderLng, $restLat, $restLng), 2);
            } else {
                $order->distance_km = null;
            }
        });

        $title = trans('translate.admin_validation.All Orders');
        return view('deliveryman.order_request', compact('title', 'orders', 'riderLat', 'riderLng'));
    }

    /**
     * Real-time AJAX polling endpoint for live order requests.
     */
    public function liveRequestsPoll(Request $request)
    {
        $rider = Auth::guard('deliveryman')->user();
        $deliveryman_id = $rider->id;
        $riderLat = (float)($request->latitude ?? $rider->latitude);
        $riderLng = (float)($request->longitude ?? $rider->longitude);

        $orders = Order::with(['restaurant:id,name,address,latitude,longitude,phone', 'address:id,address'])
            ->where(function($q) {
                $q->whereNull('delivery_man_id')->orWhere('delivery_man_id', 0);
            })
            ->where('order_request', 1)
            ->whereIn('order_status', [2, 3])
            ->whereDoesntHave('rejections', function($q) use ($deliveryman_id) {
                $q->where('delivery_man_id', $deliveryman_id);
            })
            ->whereNotIn('order_status', [5, 6])
            ->where(function($q) {
                $q->whereNull('order_type')->orWhere('order_type', 'delivery');
            })
            ->latest()
            ->get()
            ->map(function($order) use ($riderLat, $riderLng) {
                $restLat = (float)($order->restaurant?->latitude ?? 0);
                $restLng = (float)($order->restaurant?->longitude ?? 0);
                $dist = null;
                if ($riderLat && $riderLng && $restLat && $restLng) {
                    $dist = round($this->calculateHaversineDistance($riderLat, $riderLng, $restLat, $restLng), 1);
                }

                $addressObj = is_string($order->delivery_address) ? json_decode($order->delivery_address) : (object) ($order->delivery_address ?? []);
                $dropAddress = $order->address?->address ?? ($addressObj?->address ?? 'Customer Location');

                return [
                    'id' => $order->id,
                    'order_id_display' => '#' . ($order->order_id ?? $order->id),
                    'grand_total' => $order->grand_total,
                    'formatted_total' => currency($order->grand_total),
                    'payment_method' => strtoupper($order->payment_method ?? 'COD'),
                    'is_cod' => $order->payment_method === 'cash_on_delivery',
                    'restaurant_name' => $order->restaurant?->name ?? 'Restaurant',
                    'restaurant_address' => $order->restaurant?->address ?? '',
                    'restaurant_phone' => $order->restaurant?->phone ?? '',
                    'dropoff_address' => $dropAddress,
                    'distance_km' => $dist,
                    'distance_display' => $dist ? ($dist . ' km') : null,
                    'created_at' => $order->created_at?->diffForHumans() ?? '',
                    'accept_url' => route('deliveryman.order-request-status', $order->id),
                    'show_url' => route('deliveryman.order-show', $order->id),
                ];
            });

        return response()->json([
            'count' => $orders->count(),
            'orders' => $orders,
        ]);
    }

    public function completedOrder(){
        $deliveryman_id = Auth::guard('deliveryman')->user()->id;
        $orders = Order::with('user', 'restaurant')
            ->where('delivery_man_id', $deliveryman_id)
            ->where(function($q) {
                $q->where('order_request', 3)->orWhere('order_status', 5);
            })
            ->orderBy('id','desc')
            ->get();
        $title = trans('translate.admin_validation.All Orders');

        return view('deliveryman.completed_order', compact('title','orders'));
    }

    public function canceledOrder(){
        $deliveryman_id = Auth::guard('deliveryman')->user()->id;
        $orders = Order::with('user', 'restaurant')
            ->where('delivery_man_id', $deliveryman_id)
            ->where(function($q) {
                $q->where('order_request', 4)->orWhere('order_status', 6);
            })
            ->orderBy('id','desc')
            ->get();
        $title = trans('translate.admin_validation.All Orders');

        return view('deliveryman.canceled_order', compact('title','orders'));
    }

    public function show($id){
        $deliverymans = DeliveryMan::latest()->get();
        $order = Order::with(['restaurant', 'deliveryman', 'user', 'items.products', 'address'])->findOrFail($id);
        $rider = Auth::guard('deliveryman')->user();

        return view('deliveryman.show_order', compact('order', 'deliverymans', 'rider'));
    }

    public function updateOrderStatus(Request $request , $id){
        $rules = [
            'order_status' => 'required',
            'payment_status' => 'nullable',
        ];
        $this->validate($request, $rules);

        $order = Order::findOrFail($id);
        $rider = Auth::guard('deliveryman')->user();

        // Ensure order is assigned to this rider
        if ($order->delivery_man_id && $order->delivery_man_id != $rider->id) {
            $notification = array('messege' => 'You are not assigned to this order', 'alert-type' => 'error');
            return redirect()->back()->with($notification);
        }

        // Status 3 or 5 = Delivered
        if ($request->order_status == 3 || $request->order_status == 5 || $request->order_status == 'delivered') {
            $order->order_request = 3;
            $order->order_status = 5; // Delivered
            $order->order_completed_date = date('Y-m-d');

            // Handle payment status: if COD or unspecified, mark payment collected / success
            if ($request->filled('payment_status')) {
                if ($request->payment_status == 1 || $request->payment_status == 'success') {
                    $order->payment_status = 'success';
                    $order->payment_approval_date = date('Y-m-d');
                } else {
                    $order->payment_status = $request->payment_status;
                }
            } elseif ($order->payment_status != 'success') {
                $order->payment_status = 'success';
                $order->payment_approval_date = date('Y-m-d');
            }
            $order->save();

            if ($order->user_id) {
                try {
                    \App\Models\AppNotification::create([
                        'target_type' => 'user',
                        'target_id'   => $order->user_id,
                        'title'       => 'Order Delivered! 🎉',
                        'message'     => 'Your order #' . ($order->order_id ?? $order->id) . ' has been delivered. Enjoy your meal!',
                        'order_id'    => $order->id,
                        'type'        => 'order_status',
                        'is_read'     => false,
                        'data'        => [
                            'order_id'     => $order->id,
                            'order_status' => 5,
                            'status_label' => 'Delivered',
                        ]
                    ]);
                } catch (\Exception $e) {}
            }

            $notification = array('messege' => 'Order marked as Delivered successfully! Excellent work.', 'alert-type' => 'success');
            return redirect()->route('deliveryman.completed-order')->with($notification);

        } else if ($request->order_status == 4 || $request->order_status == 6 || $request->order_status == 'cancelled') {
            $order->order_request = 4;
            $order->order_status = 6; // Cancelled
            $order->order_declined_date = date('Y-m-d');
            $order->save();

            $notification = array('messege' => 'Order has been marked as cancelled.', 'alert-type' => 'warning');
            return redirect()->route('deliveryman.cancel-order')->with($notification);
        }

        $order->save();
        $notification = trans('translate.admin_validation.Order Status Updated successfully');
        $notification = array('messege' => $notification, 'alert-type' => 'success');
        return redirect()->back()->with($notification);
    }

    /**
     * Accept or Reject Order Request (atomic first-come first-served)
     */
    public function orderRequestStatus(Request $request, $id){
        $rules = [
            'order_request_status' => 'required',
        ];
        $this->validate($request, $rules);
        $rider = Auth::guard('deliveryman')->user();
        $deliveryman_id = $rider->id;
        $status = (int)$request->order_request_status;

        if ($status === 1) {
            // ATOMIC FIRST-COME FIRST-SERVED CLAIM
            DB::beginTransaction();
            try {
                $order = Order::where('id', $id)->lockForUpdate()->first();

                if (!$order) {
                    DB::rollBack();
                    $notification = array('messege' => 'Order not found', 'alert-type' => 'error');
                    return redirect()->back()->with($notification);
                }

                if ($order->delivery_man_id && $order->delivery_man_id != $deliveryman_id) {
                    DB::rollBack();
                    $notification = array('messege' => 'Order was already accepted by another delivery partner.', 'alert-type' => 'error');
                    return redirect()->back()->with($notification);
                }

                $order->delivery_man_id = $deliveryman_id;
                $order->order_request = 1;
                $order->order_status = 4; // On the way
                $order->order_req_accept_date = now();
                $order->save();

                DB::commit();

                // Notify Customer
                if ($order->user_id) {
                    try {
                        $riderName = trim(($rider->fname ?? '') . ' ' . ($rider->lname ?? ''));
                        \App\Models\AppNotification::create([
                            'target_type' => 'user',
                            'target_id'   => $order->user_id,
                            'title'       => 'Delivery Partner Assigned! 🛵',
                            'message'     => ($riderName ?: 'A delivery partner') . ' has accepted your order #' . ($order->order_id ?? $order->id) . ' and is on the way to pick it up.',
                            'order_id'    => $order->id,
                            'type'        => 'order_status',
                            'is_read'     => false,
                            'data'        => [
                                'order_id' => $order->id,
                                'order_status' => 4,
                                'status_label' => 'On the way',
                            ]
                        ]);
                    } catch (\Exception $e) {}
                }

                if ($request->ajax() || $request->wantsJson()) {
                    return response()->json([
                        'status' => 'success',
                        'message' => 'Order claimed successfully! Head to restaurant for pickup.',
                        'redirect_url' => route('deliveryman.order-show', $order->id)
                    ]);
                }

                $notification = array('messege' => 'Order claimed successfully! Head to restaurant for pickup.', 'alert-type' => 'success');
                return redirect()->route('deliveryman.order-show', $order->id)->with($notification);

            } catch (\Exception $e) {
                if (DB::transactionLevel() > 0) {
                    DB::rollBack();
                }

                if ($request->ajax() || $request->wantsJson()) {
                    return response()->json([
                        'status' => 'error',
                        'message' => 'Failed to claim order: ' . $e->getMessage()
                    ], 409);
                }

                $notification = array('messege' => 'Failed to claim order: ' . $e->getMessage(), 'alert-type' => 'error');
                return redirect()->back()->with($notification);
            }

        } elseif ($status === 2) {
            // ISOLATED REJECTION: ONLY REJECT FOR THIS DELIVERY MAN
            OrderDeliveryManRejection::firstOrCreate([
                'order_id' => $id,
                'delivery_man_id' => $deliveryman_id,
            ], [
                'reason' => $request->reason ?? 'Rider declined request',
            ]);

            // If order was explicitly assigned to only this rider before broadcast, disassociate so others can claim
            $order = Order::find($id);
            if ($order && $order->delivery_man_id == $deliveryman_id) {
                $order->delivery_man_id = 0;
                $order->order_request = 1;
                $order->save();
            }

            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Order request declined.'
                ]);
            }

            $notification = array('messege' => 'Order request declined.', 'alert-type' => 'info');
            return redirect()->route('deliveryman.order-request')->with($notification);

        } elseif ($status === 3) {
            $order = Order::where('id', $id)->where('delivery_man_id', $deliveryman_id)->first();
            if ($order) {
                $order->order_request = 3;
                $order->order_status = 5; // Delivered
                $order->order_completed_date = date('Y-m-d');
                if ($order->payment_status != 'success') {
                    $order->payment_status = 'success';
                    $order->payment_approval_date = date('Y-m-d');
                }
                $order->save();

                if ($order->user_id) {
                    try {
                        \App\Models\AppNotification::create([
                            'target_type' => 'user',
                            'target_id'   => $order->user_id,
                            'title'       => 'Order Delivered! 🎉',
                            'message'     => 'Your order #' . ($order->order_id ?? $order->id) . ' has been delivered. Enjoy your meal!',
                            'order_id'    => $order->id,
                            'type'        => 'order_status',
                            'is_read'     => false,
                            'data'        => [
                                'order_id'     => $order->id,
                                'order_status' => 5,
                                'status_label' => 'Delivered',
                            ]
                        ]);
                    } catch (\Exception $e) {}
                }
            }
            $notification = array('messege' => 'Order marked as delivered successfully! Excellent work.', 'alert-type' => 'success');
            return redirect()->route('deliveryman.completed-order')->with($notification);

        } elseif ($status === 4) {
            $order = Order::where('id', $id)->where('delivery_man_id', $deliveryman_id)->first();
            if ($order) {
                $order->order_request = 4;
                $order->order_status = 6; // Cancelled
                $order->order_declined_date = date('Y-m-d');
                $order->save();
            }
            $notification = array('messege' => 'Order delivery cancelled.', 'alert-type' => 'warning');
            return redirect()->route('deliveryman.cancel-order')->with($notification);
        }

        $notification = array('messege' => 'Order Request Status Updated successfully', 'alert-type' => 'success');
        return redirect()->back()->with($notification);
    }
}
