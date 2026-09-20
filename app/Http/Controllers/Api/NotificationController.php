<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\AppNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
    /**
     * Resolve the current viewer (user or restaurant)
     */
    private function resolveTarget(Request $request)
    {
        $user = Auth::guard('sanctum')->user();
        if ($user) {
            // Check if this is a restaurant owner/manager
            if (isset($user->restaurant_id) && !empty($user->restaurant_id)) {
                return ['type' => 'restaurant', 'id' => $user->restaurant_id];
            }
            // Check if model is Restaurant
            if (get_class($user) === 'Modules\Restaurant\Entities\Restaurant' || get_class($user) === 'App\Models\Restaurant') {
                return ['type' => 'restaurant', 'id' => $user->id];
            }
            return ['type' => 'user', 'id' => $user->id];
        }

        // Allow fallback query params if passed explicitly (e.g. restaurant_id or user_id)
        if ($request->filled('restaurant_id')) {
            return ['type' => 'restaurant', 'id' => (int)$request->restaurant_id];
        }
        if ($request->filled('user_id')) {
            return ['type' => 'user', 'id' => (int)$request->user_id];
        }

        // Default to public audience
        $audience = $request->query('audience', 'users');
        return ['type' => $audience === 'restaurants' ? 'restaurant' : 'user', 'id' => null];
    }

    /**
     * Get paginated notifications list for user or restaurant
     */
    public function index(Request $request)
    {
        $target = $this->resolveTarget($request);
        $type = $request->query('type'); // 'all', 'order_status', 'promo', 'broadcast'

        $query = AppNotification::latest();

        if ($target['type'] === 'restaurant') {
            $query->forRestaurant($target['id']);
        } else {
            $query->forUser($target['id']);
        }

        if ($type && $type !== 'all') {
            if ($type === 'promo') {
                $query->whereIn('type', ['promo', 'broadcast']);
            } else {
                $query->where('type', $type);
            }
        }

        $notifications = $query->paginate($request->query('per_page', 20));

        // Calculate unread count
        $unreadQuery = AppNotification::where('is_read', false);
        if ($target['type'] === 'restaurant') {
            $unreadQuery->forRestaurant($target['id']);
        } else {
            $unreadQuery->forUser($target['id']);
        }
        $unreadCount = $unreadQuery->count();

        return response()->json([
            'status'        => 'success',
            'unread_count'  => $unreadCount,
            'notifications' => $notifications,
        ]);
    }

    /**
     * Get lightweight unread count for badge indicators
     */
    public function unreadCount(Request $request)
    {
        $target = $this->resolveTarget($request);

        $query = AppNotification::where('is_read', false);
        if ($target['type'] === 'restaurant') {
            $query->forRestaurant($target['id']);
        } else {
            $query->forUser($target['id']);
        }

        return response()->json([
            'status'       => 'success',
            'unread_count' => $query->count(),
        ]);
    }

    /**
     * Live Polling endpoint: returns new notifications created after a given ID
     */
    public function livePoll(Request $request)
    {
        $target = $this->resolveTarget($request);
        $lastId = (int)$request->query('last_id', 0);

        $query = AppNotification::where('id', '>', $lastId)->latest();

        if ($target['type'] === 'restaurant') {
            $query->forRestaurant($target['id']);
        } else {
            $query->forUser($target['id']);
        }

        $newNotifications = $query->take(10)->get();

        return response()->json([
            'status'            => 'success',
            'has_new'           => $newNotifications->isNotEmpty(),
            'new_count'         => $newNotifications->count(),
            'new_notifications' => $newNotifications,
            'latest_id'         => $newNotifications->isNotEmpty() ? $newNotifications->first()->id : $lastId,
        ]);
    }

    /**
     * Mark single, multiple, or all notifications as read
     */
    public function markAsRead(Request $request)
    {
        $target = $this->resolveTarget($request);
        $id = $request->input('id');

        if ($id) {
            $notif = AppNotification::find($id);
            if ($notif) {
                $notif->is_read = true;
                $notif->save();
            }
        } else {
            // Mark all as read for this target
            $query = AppNotification::where('is_read', false);
            if ($target['type'] === 'restaurant') {
                $query->forRestaurant($target['id']);
            } else {
                $query->forUser($target['id']);
            }
            $query->update(['is_read' => true]);
        }

        return response()->json([
            'status'  => 'success',
            'message' => 'Notifications marked as read',
        ]);
    }
}
