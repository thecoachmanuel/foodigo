<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AppNotification extends Model
{
    use HasFactory;

    protected $table = 'app_notifications';

    protected $fillable = [
        'target_type',
        'target_id',
        'title',
        'message',
        'type',
        'order_id',
        'image',
        'action_url',
        'data',
        'is_read',
    ];

    protected $casts = [
        'data' => 'array',
        'is_read' => 'boolean',
        'order_id' => 'integer',
        'target_id' => 'integer',
    ];

    /**
     * Scope for notifications accessible to a specific user.
     * Includes target_type in ('all', 'users') or (target_type = 'user' and target_id = $userId).
     */
    public function scopeForUser($query, $userId)
    {
        return $query->where(function ($q) use ($userId) {
            $q->whereIn('target_type', ['all', 'users']);
            if ($userId) {
                $q->orWhere(function ($sub) use ($userId) {
                    $sub->where('target_type', 'user')->where('target_id', $userId);
                });
            }
        });
    }

    /**
     * Scope for notifications accessible to a specific restaurant.
     * Includes target_type in ('all', 'restaurants') or (target_type = 'restaurant' and target_id = $restaurantId).
     */
    public function scopeForRestaurant($query, $restaurantId)
    {
        return $query->where(function ($q) use ($restaurantId) {
            $q->whereIn('target_type', ['all', 'restaurants']);
            if ($restaurantId) {
                $q->orWhere(function ($sub) use ($restaurantId) {
                    $sub->where('target_type', 'restaurant')->where('target_id', $restaurantId);
                });
            }
        });
    }

    /**
     * Helper to create an order status notification for a customer.
     */
    public static function createOrderStatusNotification($order, $statusNum, $statusLabel)
    {
        if (!$order) return null;

        $messages = [
            1 => 'Your order #' . $order->id . ' has been received and is pending confirmation.',
            2 => 'Great news! Your order #' . $order->id . ' has been confirmed by the restaurant.',
            3 => 'The kitchen is actively preparing your delicious food for order #' . $order->id . '.',
            4 => 'Your food is on the way! Our delivery rider is heading to your location.',
            5 => 'Order #' . $order->id . ' has been delivered! Enjoy your meal.',
            6 => 'Order #' . $order->id . ' has been canceled.',
        ];

        $title = 'Order #' . $order->id . ' is ' . $statusLabel;
        $body = $messages[(int)$statusNum] ?? ('Status for order #' . $order->id . ' is now ' . $statusLabel);

        return self::create([
            'target_type' => 'user',
            'target_id'   => $order->user_id,
            'title'       => $title,
            'message'     => $body,
            'type'        => 'order_status',
            'order_id'    => $order->id,
            'action_url'  => '/(user)/orders/' . $order->id,
            'data'        => [
                'order_id'     => $order->id,
                'order_status' => (int)$statusNum,
                'status_label' => $statusLabel,
            ],
        ]);
    }

    /**
     * Helper to notify a restaurant of a new incoming order.
     */
    public static function createNewOrderNotificationForRestaurant($order, $restaurantId, $amountFormatted)
    {
        if (!$order || !$restaurantId) return null;

        return self::create([
            'target_type' => 'restaurant',
            'target_id'   => $restaurantId,
            'title'       => 'New Order #' . $order->id . ' Received! 🔔',
            'message'     => 'New order #' . $order->id . ' placed for ' . $amountFormatted . '. Tap to confirm & prepare.',
            'type'        => 'order_status',
            'order_id'    => $order->id,
            'action_url'  => '/(restaurant)/orders/' . $order->id,
            'data'        => [
                'order_id'     => $order->id,
                'order_status' => 1,
                'status_label' => 'Pending',
            ],
        ]);
    }
}
