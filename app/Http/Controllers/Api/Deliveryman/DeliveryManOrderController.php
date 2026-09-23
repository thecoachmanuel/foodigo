<?php

namespace App\Http\Controllers\Api\Deliveryman;

use Auth;
use Illuminate\Http\Request;
use App\Models\DeliveryMan;
use App\Models\OrderDeliveryManRejection;
use Modules\Order\App\Models\Order;
use App\Http\Controllers\Api\BaseController;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class DeliveryManOrderController extends BaseController
{
    /**
     * Calculate distance between two coordinates using Haversine formula (km).
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

    /**
     * Live order requests available to this delivery partner.
     * Respects isolated rejections and provides distance calculation.
     */
    public function orderRequest(Request $request): JsonResponse
    {
        try {
            $user = $request->user();
            $riderLat = $request->filled('latitude') ? (float)$request->latitude : ($user->latitude ? (float)$user->latitude : null);
            $riderLng = $request->filled('longitude') ? (float)$request->longitude : ($user->longitude ? (float)$user->longitude : null);

            $orders = Order::with(['restaurant', 'address', 'user', 'items.products', 'deliveryman'])
                ->where(function($q) use ($user) {
                    $q->where(function($sub) use ($user) {
                        $sub->where('delivery_man_id', $user->id)
                            ->whereIn('order_request', [0, 1])
                            ->whereIn('order_status', [2, 3, 4]);
                    })
                    ->orWhere(function($sub) {
                        $sub->where(function($inner) {
                            $inner->whereNull('delivery_man_id')->orWhere('delivery_man_id', 0);
                        })
                        ->where('order_request', 1)
                        ->whereIn('order_status', [2, 3]);
                    });
                })
                ->whereDoesntHave('rejections', function($q) use ($user) {
                    $q->where('delivery_man_id', $user->id);
                })
                ->whereNotIn('order_status', [5, 6])
                ->where(function($q) {
                    $q->whereNull('order_type')->orWhere('order_type', 'delivery');
                })
                ->orderBy('id', 'desc')
                ->get();

            $enrichedOrders = $orders->map(function ($order) use ($riderLat, $riderLng) {
                $restLat = (float)($order->restaurant?->latitude ?? 0);
                $restLng = (float)($order->restaurant?->longitude ?? 0);

                $distanceKm = null;
                if ($riderLat && $riderLng && $restLat && $restLng) {
                    $distanceKm = $this->calculateHaversineDistance($riderLat, $riderLng, $restLat, $restLng);
                }

                $order->distance_km = $distanceKm ? round($distanceKm, 2) : null;
                $order->restaurant_latitude = $restLat ?: null;
                $order->restaurant_longitude = $restLng ?: null;

                $destCoords = $order->delivery_coordinates;
                $order->destination_latitude = $destCoords['latitude'] ?? null;
                $order->destination_longitude = $destCoords['longitude'] ?? null;

                return $order;
            });

            if ($riderLat && $riderLng) {
                $enrichedOrders = $enrichedOrders->sortBy(function($o) {
                    return $o->distance_km ?? 999999;
                })->values();
            }

            $title = trans('translate.admin_validation.All Orders');
            $data = [
                'title' => $title,
                'orders' => $enrichedOrders,
                'rider_location' => ($riderLat && $riderLng) ? [
                    'latitude' => $riderLat,
                    'longitude' => $riderLng,
                ] : null,
            ];

            return $this->sendResponse($data, 'Order Request data retrieved successfully');
        } catch (\Exception $e) {
            return $this->sendError('Something went wrong: ' . $e->getMessage(), [], 500);
        }
    }

    /**
     * Fast live-polling endpoint for nearby orders.
     */
    public function livePoll(Request $request): JsonResponse
    {
        try {
            $user = $request->user();
            $riderLat = $request->filled('latitude') ? (float)$request->latitude : ($user->latitude ? (float)$user->latitude : null);
            $riderLng = $request->filled('longitude') ? (float)$request->longitude : ($user->longitude ? (float)$user->longitude : null);

            if ($riderLat && $riderLng && ($user->latitude != $riderLat || $user->longitude != $riderLng)) {
                $user->latitude = $riderLat;
                $user->longitude = $riderLng;
                $user->last_location_update_at = now();
                $user->save();
            }

            $openOrders = Order::with(['restaurant:id,name,address,latitude,longitude,phone'])
                ->where(function($q) {
                    $q->whereNull('delivery_man_id')->orWhere('delivery_man_id', 0);
                })
                ->where('order_request', 1)
                ->whereIn('order_status', [2, 3])
                ->whereDoesntHave('rejections', function($q) use ($user) {
                    $q->where('delivery_man_id', $user->id);
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
                        $dist = round($this->calculateHaversineDistance($riderLat, $riderLng, $restLat, $restLng), 2);
                    }
                    return [
                        'id' => $order->id,
                        'order_id' => $order->id,
                        'grand_total' => $order->grand_total,
                        'restaurant_name' => $order->restaurant?->name ?? 'Restaurant',
                        'restaurant_address' => $order->restaurant?->address ?? '',
                        'distance_km' => $dist,
                        'created_at' => $order->created_at?->diffForHumans() ?? '',
                    ];
                });

            return $this->sendResponse([
                'count' => $openOrders->count(),
                'orders' => $openOrders,
            ], 'Live poll checked successfully');
        } catch (\Exception $e) {
            return $this->sendError('Failed to check live requests: ' . $e->getMessage(), [], 500);
        }
    }

    public function runningOrders(Request $request): JsonResponse
    {
        try {
            $user = $request->user();
            $orders = Order::with(['restaurant', 'address', 'user', 'items', 'deliveryman'])
                ->where('delivery_man_id', $user->id)
                ->where('order_request', 1)
                ->whereNotIn('order_status', [5, 6])
                ->orderBy('id', 'desc')
                ->get();
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
            $orders = Order::with(['restaurant', 'address', 'user', 'items', 'deliveryman'])
                ->where('delivery_man_id', $user->id)
                ->where(function($q) {
                    $q->where('order_request', 3)->orWhere('order_status', 5);
                })
                ->orderBy('id', 'desc')
                ->get();
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
            $orders = Order::with(['restaurant', 'address', 'user', 'items', 'deliveryman'])
                ->where('delivery_man_id', $user->id)
                ->where(function($q) {
                    $q->where('order_request', 4)->orWhere('order_status', 6);
                })
                ->orderBy('id', 'desc')
                ->get();
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
            $order = Order::with(['restaurant', 'address', 'user', 'deliveryman', 'items.products'])->findOrFail($id);

            $data = [
                'order' => $order
            ];

            return $this->sendResponse($data, 'Order detail page data retrieved successfully');
        } catch (\Exception $e) {
            return $this->sendError('Something went wrong', [], 500);
        }
    }

    /**
     * Update order request status.
     * Status 1 = Claim/Accept (Race condition protected with DB lock & 409 Conflict if claimed)
     * Status 2 = Isolated Reject (Stored in order_delivery_man_rejections, keeps order open for other riders)
     * Status 3 = Delivered
     * Status 4 = Cancelled
     */
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

        $user = $request->user();
        $status = (int)$request->order_request_status;

        try {
            if ($status === 1) {
                // ATOMIC FIRST-COME FIRST-SERVED CLAIM
                DB::beginTransaction();

                $order = Order::where('id', $id)->lockForUpdate()->first();

                if (!$order) {
                    DB::rollBack();
                    return $this->sendError('Order not found', [], 404);
                }

                // If already claimed by another delivery man
                if ($order->delivery_man_id && $order->delivery_man_id != $user->id) {
                    DB::rollBack();
                    return $this->sendError('This order has already been claimed by another delivery partner.', [
                        'already_claimed' => true,
                    ], 409);
                }

                // Successfully claim
                $order->delivery_man_id = $user->id;
                $order->order_request = 1;
                $order->order_status = 4; // On the way
                $order->order_req_accept_date = now();
                $order->save();

                DB::commit();

                // Notify Customer
                if ($order->user_id) {
                    try {
                        $riderName = trim(($user->fname ?? '') . ' ' . ($user->lname ?? ''));
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

                return $this->sendResponse([
                    'order' => $order->fresh(['restaurant', 'deliveryman', 'address'])
                ], 'Order claimed and accepted successfully!');

            } elseif ($status === 2) {
                // ISOLATED REJECTION: ONLY REJECT FOR THIS DELIVERY MAN
                OrderDeliveryManRejection::firstOrCreate([
                    'order_id' => $id,
                    'delivery_man_id' => $user->id,
                ], [
                    'reason' => $request->reason ?? 'Delivery partner declined the request',
                ]);

                // If order was explicitly assigned to only this rider before broadcast, disassociate so others can claim
                $order = Order::find($id);
                if ($order && $order->delivery_man_id == $user->id) {
                    $order->delivery_man_id = null;
                    $order->order_request = 1;
                    $order->save();
                }

                return $this->sendResponse([
                    'order_id' => $id,
                    'rejected' => true,
                ], 'Order rejected for this delivery partner.');

            } elseif ($status === 3) {
                // MARK DELIVERED
                $order = Order::where('id', $id)
                    ->where('delivery_man_id', $user->id)
                    ->first();

                if (!$order) {
                    return $this->sendError('Order not found or not assigned to you', [], 404);
                }

                $order->order_request = 3;
                $order->order_status = 5; // Delivered
                $order->order_completed_date = now();
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
                                'order_id' => $order->id,
                                'order_status' => 5,
                                'status_label' => 'Delivered',
                            ]
                        ]);
                    } catch (\Exception $e) {}
                }

                return $this->sendResponse([
                    'order' => $order
                ], 'Order marked as delivered successfully.');

            } elseif ($status === 4) {
                // CANCELLED
                $order = Order::where('id', $id)
                    ->where('delivery_man_id', $user->id)
                    ->first();

                if (!$order) {
                    return $this->sendError('Order not found or not assigned to you', [], 404);
                }

                $order->order_request = 4;
                $order->order_status = 6;
                $order->order_declined_date = now();
                $order->save();

                return $this->sendResponse([
                    'order' => $order
                ], 'Order cancelled successfully.');
            }

            return $this->sendError('Invalid request status', [], 400);

        } catch (\Exception $e) {
            if (DB::transactionLevel() > 0) {
                DB::rollBack();
            }
            return $this->sendError('Something went wrong: ' . $e->getMessage(), [], 500);
        }
    }
}
