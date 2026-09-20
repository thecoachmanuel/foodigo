<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AppNotification;
use Illuminate\Http\Request;

class BroadcastNotificationController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    /**
     * Display broadcast & promo notifications dashboard.
     */
    public function index()
    {
        $notifications = AppNotification::whereIn('type', ['promo', 'broadcast', 'general'])
            ->latest()
            ->paginate(15);

        return view('admin.promotions.broadcast', compact('notifications'));
    }

    /**
     * Store and broadcast a new notification to users / restaurants.
     */
    public function store(Request $request)
    {
        $request->validate([
            'title'        => 'required|string|max:255',
            'message'      => 'required|string',
            'target_type'  => 'required|in:all,users,restaurants',
            'type'         => 'required|in:promo,broadcast,general',
            'action_url'   => 'nullable|string|max:255',
            'image'        => 'nullable|string|max:500',
        ]);

        AppNotification::create([
            'title'       => $request->title,
            'message'     => $request->message,
            'target_type' => $request->target_type,
            'target_id'   => null,
            'type'        => $request->type,
            'action_url'  => $request->action_url,
            'image'       => $request->image,
            'data'        => [
                'sent_by' => 'admin',
                'audience' => $request->target_type,
                'sent_at' => now()->toIso8601String(),
            ],
            'is_read'     => false,
        ]);

        $notification = [
            'message'    => trans('translate.Notification broadcasted successfully!'),
            'alert-type' => 'success',
        ];

        return redirect()->back()->with($notification);
    }

    /**
     * Delete a broadcast notification.
     */
    public function destroy($id)
    {
        $notif = AppNotification::findOrFail($id);
        $notif->delete();

        $notification = [
            'message'    => trans('translate.Notification deleted successfully!'),
            'alert-type' => 'success',
        ];

        return redirect()->back()->with($notification);
    }
}
