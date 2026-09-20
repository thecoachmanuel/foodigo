<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\AppNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
    /**
     * Resolve the current viewer (user or restaurant) from sanctum token.
     * Routes are now in auth:sanctum protected groups so $user is always set.
     */
    private function resolveTarget(Request $request): array
    {
        $audience = $request->query('audience', $request->input('audience', 'users'));
        $user = Auth::guard('sanctum')->user();

        if ($user) {
            $class = get_class($user);
            // Restaurant model authenticated via sanctum
            if (str_contains($class, 'Restaurant')) {
                return ['type' => 'restaurant', 'id' => (int)$user->id];
            }
            // Regular user
            return ['type' => 'user', 'id' => (int)$user->id];
        }

        // Fallback for unauthenticated / guest polling
        if ($audience === 'restaurants') {
            return ['type' => 'restaurant', 'id' => null];
        }

        return ['type' => 'user', 'id' => null];
    }

    /**
     * Get paginated notifications list for user or restaurant.
     */
    public function index(Request $request)
    {
        $target = $this->resolveTarget($request);
        $type   = $request->query('type'); // all, order_status, promo

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

        $notifications = $query->paginate((int)$request->query('per_page', 20));

        // Unread count
        $unreadQuery = AppNotification::where('is_read', false);
        if ($target['type'] === 'restaurant') {
            $unreadQuery->forRestaurant($target['id']);
        } else {
            $unreadQuery->forUser($target['id']);
        }

        return response()->json([
            'status'        => 'success',
            'unread_count'  => $unreadQuery->count(),
            'notifications' => $notifications,
        ]);
    }

    /**
     * Lightweight unread count for badge indicators.
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
     * Live Polling: returns new notifications created after a given ID.
     * Used by the Expo app poller every 8 seconds to check for new events.
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
        $latestId = $newNotifications->isNotEmpty()
            ? $newNotifications->first()->id
            : $lastId;

        return response()->json([
            'status'            => 'success',
            'has_new'           => $newNotifications->isNotEmpty(),
            'new_count'         => $newNotifications->count(),
            'new_notifications' => $newNotifications,
            'latest_id'         => $latestId,
        ]);
    }

    /**
     * Mark single, multiple, or all notifications as read.
     */
    public function markAsRead(Request $request)
    {
        $target = $this->resolveTarget($request);
        $id     = $request->input('id');

        if ($id) {
            $notif = AppNotification::find($id);
            if ($notif) {
                $notif->is_read = true;
                $notif->save();
            }
        } else {
            $q = AppNotification::where('is_read', false);
            if ($target['type'] === 'restaurant') {
                $q->forRestaurant($target['id']);
            } else {
                $q->forUser($target['id']);
            }
            $q->update(['is_read' => true]);
        }

        return response()->json([
            'status'  => 'success',
            'message' => 'Notifications marked as read',
        ]);
    }
}