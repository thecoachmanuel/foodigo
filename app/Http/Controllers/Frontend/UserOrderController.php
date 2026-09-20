<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Review;
use App\Models\UserAddress;
use Illuminate\Http\Request;
use Modules\Order\App\Models\Order;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\RedirectResponse;
use Modules\Product\App\Models\Product;
use Illuminate\Support\Facades\Validator;
use Illuminate\Contracts\Support\Renderable;
use Modules\GlobalSetting\App\Models\GlobalSetting;

class UserOrderController extends Controller
{
    public function order(Request $request): Renderable
    {
        $user = Auth::user();
        $sortBy = $request->get('sort_by', 'id');
        $sortOrder = $request->get('order', $request->get('direction', 'desc'));

        $allowedSorts = ['id', 'created_at', 'grand_total', 'order_status'];
        if (!in_array($sortBy, $allowedSorts)) {
            $sortBy = 'id';
        }
        if (!in_array(strtolower($sortOrder), ['asc', 'desc'])) {
            $sortOrder = 'desc';
        }

        $orders = Order::with([
            'restaurant',
            'items',
            'reviews' => function($q) use ($user) {
                $q->where('user_id', $user->id);
            }
        ])
            ->where('user_id', $user->id)
            ->orderBy($sortBy, $sortOrder)
            ->paginate(10)
            ->appends($request->query());

        return view('frontend.user.order', compact('user', 'orders', 'sortBy', 'sortOrder'));
    }

    public function order_details($id)
    {
        $user = Auth::user();
        $orderQuery = Order::with([
            'restaurant',
            'address',
            'items.products.translate_product',
            'items.products.restaurant',
            'reviews',
            'deliveryman',
            'deliveryMan'
        ]);

        if ($user) {
            $order = $orderQuery->where('id', $id)
                ->where(function ($q) use ($user) {
                    $q->where('user_id', $user->id)
                      ->orWhere('is_guest', 1);
                })
                ->first()
                ?? $orderQuery->where('id', $id)->first();
        } else {
            $order = $orderQuery->where('id', $id)->first();
        }

        if (!$order) {
            $notification = ['message' => trans('translate.Order not found'), 'alert-type' => 'error'];
            return redirect()->route('home')->with($notification);
        }

        return view('frontend.user.order_details', compact('user', 'order'));
    }

    public function continue_order(Request $request): RedirectResponse
    {
        $rules = [
            'order_type' => 'required',
            'additional_notes' => 'nullable',
        ];

        if ($request->order_type == 'delivery') {
            if (auth()->check()) {
                $rules['address_id'] = 'required|exists:user_addresses,id';
            } else {
                if (empty($request->latitude) || empty($request->longitude) || (float)$request->latitude == 0) {
                    $coords = resolve_nigerian_coordinates($request->address);
                    $request->merge([
                        'latitude' => $coords['latitude'],
                        'longitude' => $coords['longitude'],
                    ]);
                }

                $rules = array_merge($rules, [
                    'name' => 'required|string|max:255',
                    'email' => 'max:255',
                    'phone' => 'required|string|max:15',
                    'address' => 'required|string|max:255',
                    'delivery_type' => 'required|in:home,office',
                    'latitude' => 'required|numeric',
                    'longitude' => 'required|numeric',
                ]);
            }
        }else{
            $rules = array_merge($rules, [
                'contact_name' => 'required|string|max:255',
                'contact_email' => 'max:255',
                'contact_phone' => 'required|string|max:15',
            ]);
        }

        // Custom error messages for validation
        $customMessages = [
            'order_type.required' => trans('translate.Order type is required'),
            'delivery_time.required' => trans('translate.Delivery time is required'),
            'slots.required' => trans('translate.Time slot is required'),
            'name.required' => trans('translate.Name is required'),
            'email.required' => trans('translate.Email is required'),
            'phone.required' => trans('translate.Phone is required'),
            'address.required' => trans('translate.Address is required'),
            'delivery_type.required' => trans('translate.Delivery type is required'),
            'address_id.required' => trans('translate.Address is required'),
        ];

        // Perform validation
        $this->validate($request, $rules, $customMessages);

        // Get cart session data
        $carts = session('cart', []);
        $subtotal = $this->calculateCartSubtotal($carts);
        $first_cart = is_array($carts) ? reset($carts) : null;
        $restaurant_id = !empty($first_cart['product_id']) ? Product::find($first_cart['product_id'])?->restaurant?->id : null;

        $orderData = [
            'order_type' => $request->order_type,
            'delivery_time' => $request->delivery_time,
            'slots' => $request->slots,
            'additional_notes' => $request->additional_notes,
            'restaurant_id' => $restaurant_id,
            'subtotal' => $subtotal,
        ];

        if ($request->order_type == 'delivery') {
            if (auth()->check()) {
                $deliveryCharge = $this->getDeliveryChargeForAuthenticatedUser($request->address_id);
                $orderData['address_id'] = $request->address_id;
                $user_address = UserAddress::findOrFail($request->address_id);
                $orderData = array_merge($orderData, [
                    'name' => $user_address->name ?? auth()->user()->name,
                    'email' => $user_address->email ?? auth()->user()->email,
                    'phone' => $user_address->phone ?? auth()->user()->phone,
                    'address' => $user_address->address,
                    'delivery_type' => $user_address->delivery_type,
                    'lat' => $user_address->lat ?? $user_address->latitude,
                    'lon' => $user_address->lon ?? $user_address->longitude,
                ]);
            } else {
                $deliveryCharge = $this->getDeliveryChargeForGuestUser($request->latitude, $request->longitude);
                $orderData = array_merge($orderData, [
                    'name' => $request->name,
                    'email' => $request->email,
                    'phone' => $request->phone,
                    'address' => $request->address,
                    'delivery_type' => $request->delivery_type,
                    'lat' => $request->latitude,
                    'lon' => $request->longitude,
                ]);
            }
            $orderData['delivery_charge'] = $deliveryCharge;
        } else {
            $deliveryCharge = 0;
            $orderData['delivery_charge'] = $deliveryCharge;
            $orderData['name'] = $request->contact_name;
            $orderData['phone'] = $request->contact_phone;
            $orderData['email'] = $request->contact_email;
        }

        if (session()->has('order_data')) {
            session()->forget('order_data');
        }

        if (session()->has('applied_coupon')) {
            $couponData = session('applied_coupon');
            $orderData['coupon_code'] = $couponData['code'];
            $orderData['discount_type'] = $couponData['discount_type'];
            $orderData['discount_value'] = $couponData['discount_value'];
            $orderData['discount_amount'] = $couponData['discount_amount'];
            $orderData['new_total'] = ($subtotal + $deliveryCharge) - $couponData['discount_amount'];
        } else {
            $orderData['new_total'] = $subtotal + $deliveryCharge;
        }

        if (auth()->check()){
            $orderData['is_guest'] = 0;
        }else{
            $orderData['is_guest'] = 1;
        }

        // Store order data in session
        session(['order_data' => $orderData]);

        return redirect()->route('view.payment');
    }

    private function calculateCartSubtotal($carts): float|int
    {
        $subtotal = 0;

        if (is_array($carts)) {
            foreach ($carts as $item) {
                $subtotal += $item['total'] ?? 0;
            }
        }

        return $subtotal;
    }

    private function getDeliveryChargeForAuthenticatedUser($addressId): float|int
    {
        $carts = session('cart', []);
        if (empty($carts)) return 0;
        $first_cart = reset($carts);
        $product = Product::with('restaurant')->find($first_cart['product_id'] ?? null);
        $restaurantLat = $product?->restaurant?->latitude ?? 0;
        $restaurantLon = $product?->restaurant?->longitude ?? 0;

        $userAddress = UserAddress::find($addressId);
        $userLat = $userAddress?->lat ?? $userAddress?->latitude ?? 0;
        $userLon = $userAddress?->lon ?? $userAddress?->longitude ?? 0;

        if (!$userLat || !$userLon || !$restaurantLat || !$restaurantLon) {
            return 0;
        }

        $distance = $this->calculateDistance($userLat, $userLon, $restaurantLat, $restaurantLon);
        $chargeSetting = GlobalSetting::where('key', 'delivery_charge')->first();
        $chargePerKm = $chargeSetting ? (float)$chargeSetting->value : 0;
        $billableDistance = max(1.0, (float)$distance);

        return round($billableDistance * $chargePerKm, 2);
    }

    private function getDeliveryChargeForGuestUser($guestLat, $guestLon): float|int
    {
        $carts = session('cart', []);
        if (empty($carts)) return 0;
        $first_cart = reset($carts);
        $product = Product::with('restaurant')->find($first_cart['product_id'] ?? null);
        $restaurantLat = $product?->restaurant?->latitude ?? 0;
        $restaurantLon = $product?->restaurant?->longitude ?? 0;

        if (!$guestLat || !$guestLon || !$restaurantLat || !$restaurantLon) {
            return 0;
        }

        $distance = $this->calculateDistance($guestLat, $guestLon, $restaurantLat, $restaurantLon);
        $chargeSetting = GlobalSetting::where('key', 'delivery_charge')->first();
        $chargePerKm = $chargeSetting ? (float)$chargeSetting->value : 0;
        $billableDistance = max(1.0, (float)$distance);

        return round($billableDistance * $chargePerKm, 2);
    }

    private function calculateDistance($lat1, $lon1, $lat2, $lon2): float|int
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

    public function review_submit(Request $request, $food_id){

        $request->validate([
            'review' => 'nullable|string|max:1000',
            'rating' => 'required|numeric|min:1|max:5',
            'order_id' => 'required',
            'restaurant_id' => 'nullable'
        ]);

        $order = Order::findOrFail($request->order_id);

        if ((int)$order->order_status !== 5) {
            $message = trans('translate.Reviews can only be submitted after receiving the order');
            $notification = array('message' => $message, 'alert-type' => 'error');
            return redirect()->back()->with($notification);
        }

        $product = Product::findOrFail($food_id);
        $restaurantId = $request->restaurant_id ?: ($order->restaurant_id ?: ($product->restaurant_id ?? 0));

        $review = Review::where('product_id', $food_id)
            ->where('order_id', $request->order_id)
            ->where('user_id', Auth::id())
            ->first();

        if($review){
            $review->restaurant_id = $restaurantId;
            $review->review = $request->review ?: $review->review;
            $review->rating = (int) $request->rating;
            $review->status = 1;
            $review->save();

            $message = trans('translate.Review submited successful');
            $notification = array('message' => $message, 'alert-type' => 'success');
            return redirect()->back()->with($notification);
        }

        $review = new Review();
        $review->product_id = $food_id;
        $review->restaurant_id = $restaurantId;
        $review->order_id = $request->order_id;
        $review->user_id = Auth::id();
        $review->review = $request->review ?: 'Great food and service!';
        $review->rating = (int) $request->rating;
        $review->status = 1;
        $review->save();

        $message = trans('translate.Review submited successful');
        $notification = array('message' => $message, 'alert-type' => 'success');
        return redirect()->back()->with($notification);

    }

    public function order_review_submit(Request $request, $order_id)
    {
        $user = Auth::user();
        $order = Order::with('items.products')->findOrFail($order_id);

        if ($order->user_id && $order->user_id != $user->id) {
            abort(403);
        }

        if ((int)$order->order_status !== 5) {
            $message = trans('translate.Reviews can only be submitted after receiving the order');
            $notification = array('message' => $message, 'alert-type' => 'error');
            return redirect()->back()->with($notification);
        }

        $request->validate([
            'ratings' => 'required|array',
            'ratings.*' => 'required|numeric|min:1|max:5',
            'reviews' => 'nullable|array',
        ]);

        foreach ($request->ratings as $productId => $rating) {
            $reviewText = $request->reviews[$productId] ?? '';
            $product = Product::find($productId);
            $restaurantId = $order->restaurant_id ?: ($product?->restaurant_id ?? 0);

            $review = Review::where('product_id', $productId)
                ->where('order_id', $order->id)
                ->where('user_id', $user->id)
                ->first();

            if (!$review) {
                $review = new Review();
                $review->user_id = $user->id;
                $review->order_id = $order->id;
                $review->product_id = $productId;
            }

            $review->restaurant_id = $restaurantId;
            $review->rating = (int) $rating;
            $review->review = !empty(trim($reviewText)) ? trim($reviewText) : 'Great food and service!';
            $review->status = 1;
            $review->save();
        }

        $message = trans('translate.Review submited successful');
        $notification = array('message' => $message, 'alert-type' => 'success');
        return redirect()->back()->with($notification);
    }


}
