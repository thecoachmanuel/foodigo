<?php

namespace App\Http\Controllers\Api\Deliveryman;

use Auth;
use Illuminate\Http\Request;
use App\Models\DeliveryMan;
use Modules\Order\App\Models\Order;
use App\Http\Controllers\Api\BaseController;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Validator;

class DeliveryManOrderController extends BaseController
{
    public function orderRequest(Request $request): JsonResponse
    {
        try {
            $user = $request->user();
            $orders = Order::with(['restaurant', 'address', 'user', 'items.products', 'deliveryman'])
                ->where(function($q) use ($user) {
                    $q->where(function($sub) use ($user) {
                        $sub->where('delivery_man_id', $user->id)->where('order_request', 0);
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
                ->orderBy('id', 'desc')
                ->get();

            $title = trans('translate.admin_validation.All Orders');
            $data = [
                'title' => $title,
                'orders' => $orders
            ];

            return $this->sendResponse($data, 'Order Request data retrieved successfully');
        } catch (\Exception $e) {
            return $this->sendError('Something went wrong: ' . $e->getMessage(), [], 500);
        }
    }

    public function runningOrders(Request $request): JsonResponse
    {
        try {
            $user = $request->user();
            $orders = Order::with(['restaurant', 'address', 'user', 'items', 'deliveryman',])->where('delivery_man_id', $user->id)->where('order_request', '=', 1)->orderBy('id', 'desc')->get();
            $title = trans('translate.Running Orders');

            $data = [
                'title' => $title,
                'orders' => $orders
            ];

            return $this->sendResponse($data, 'Running Orders data retrieved successfully');
        } catch (\Exception $e) {
            return $this->sendError('Something went wrong', [], 500);
        }
    }

    public function completedOrders(Request $request): JsonResponse
    {
        try {
            $user = $request->user();
            $title = trans('translate.Completed Orders');
            $orders = Order::with(['restaurant', 'address', 'user', 'items', 'deliveryman',])->where('delivery_man_id', $user->id)->where('order_request', '=', 3)->orderBy('id', 'desc')->get();
            $data = [
                'title' => $title,
                'orders' => $orders
            ];

            return $this->sendResponse($data, 'Completed Orders data retrieved successfully');
        } catch (\Exception $e) {
            return $this->sendError('Something went wrong', [], 500);
        }
    }

    public function cancelOrders(Request $request): JsonResponse
    {
        try {
            $user = $request->user();
            $title = trans('translate.Canceled Orders');
            $orders = Order::with(['restaurant', 'address', 'user', 'items', 'deliveryman',])->where('delivery_man_id', $user->id)->where('order_request', '=', 4)->orderBy('id', 'desc')->get();
            $data = [
                'title' => $title,
                'orders' => $orders
            ];

            return $this->sendResponse($data, 'Canceled Orders data retrieved successfully');
        } catch (\Exception $e) {
            return $this->sendError('Something went wrong', [], 500);
        }
    }

    public function orderDetail($id)
    {
        try {
            //$deliverymans = DeliveryMan::latest()->get();
            $order = Order::with('deliveryman','items.products')->findOrFail($id);

            $data = [
               // 'deliverymans' => $deliverymans,
                'order' => $order
            ];

            return $this->sendResponse($data, 'Order detail page data retrieved successfully');
        } catch (\Exception $e) {
            return $this->sendError('Something went wrong', [], 500);
        }
    }

    public function updateOrderRequestStatus(Request $request, $id)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'order_request_status' => 'required',
            ]
        );

        if ($validator->fails()) {
            return $this->sendValidationError($validator->errors()->toArray());
        }

        try {
            $user = $request->user();
            $order = Order::where('id', $id)
                ->where(function($q) use ($user) {
                    $q->where('delivery_man_id', $user->id)
                      ->orWhereNull('delivery_man_id')
                      ->orWhere('delivery_man_id', 0);
                })->first();

            if (!$order) {
                return $this->sendError('Order not found or already assigned to another rider', [], 404);
            }

            if ($request->order_request_status == 1) {
                $order->delivery_man_id = $user->id;
                $order->order_request = 1;
                $order->order_status = 4; // On the way
                $order->order_req_accept_date = date('Y-m-d');
                $order->save();

                if ($order->user_id) {
                    try {
                        $riderName = trim(($user->fname ?? '') . ' ' . ($user->lname ?? ''));
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
            } elseif ($request->order_request_status == 2) {
                $order->order_request = 2;
                $order->save();
            } elseif ($request->order_request_status == 3) {
                $order->order_request = 3;
                $order->order_status = 5; // Delivered
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
            } elseif ($request->order_request_status == 4) {
                $order->order_request = 4;
                $order->order_status = 6;
                $order->order_declined_date = date('Y-m-d');
                $order->save();
            }

            $data = [
                'order' => $order
            ];

            return $this->sendResponse($data, 'Order Request status changed successfully');
        } catch (\Exception $e) {
            return $this->sendError('Something went wrong: ' . $e->getMessage(), [], 500);
        }
    }
}
