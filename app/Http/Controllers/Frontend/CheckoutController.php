<?php

namespace App\Http\Controllers\Frontend;

use App\Models\UserAddress;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Modules\Currency\App\Models\Currency;
use Modules\Restaurant\Entities\Restaurant;
use Modules\PaymentGateway\App\Models\PaymentGateway;

class CheckoutController extends Controller
{

    public $payment_setting;

    public function __construct()
    {
        $payment_data = PaymentGateway::all();


            $this->payment_setting = array();

            foreach($payment_data as $data_item){
                $payment_setting[$data_item->key] = $data_item->value;
            }

            $this->payment_setting  = (object) $payment_setting;
    }

    public function checkout_page()
    {
        if (!session('cart')){
            $notify_message = trans('translate.Your cart is empty! Please add food first');
            $notify_message = array('message' => $notify_message, 'alert-type' => 'error');
            return redirect()->route('home')->with($notify_message);
        }

        $addresses = [];
        $carts = session()->get('cart', []);
        $slots = [];
        $areas = [];

        if (Auth::check()){
            $user = Auth::user();
            $addresses = UserAddress::where('user_id', $user->id)->get();
        }

        $first_cart = reset($carts);
        $first_product = !empty($first_cart['product_id']) ? \Modules\Product\App\Models\Product::with('restaurant')->find($first_cart['product_id']) : null;
        $restaurant = $first_product?->restaurant;

        $payment_data = PaymentGateway::all();

        $payment_setting = array();

        foreach($payment_data as $data_item){
            $payment_setting[$data_item->key] = $data_item->value;
        }

        $payment_setting = (object) $payment_setting;

        if (Auth::check()){
            return view('frontend.checkout.checkout_view', compact('carts', 'slots', 'addresses', 'areas', 'payment_setting', 'restaurant', 'first_product'));
        }
        return view('frontend.checkout.guest_checkout', compact('carts', 'slots', 'addresses', 'areas', 'payment_setting', 'restaurant', 'first_product'));

    }

    public function payment_page()
    {
        if (!session('cart')){
            $notify_message = trans('translate.Your cart is empty! Please add food first');
            $notify_message = array('message' => $notify_message, 'alert-type' => 'error');
            return redirect()->route('home')->with($notify_message);
        }

        if (!session('order_data')){
            $notify_message = trans('translate.Please provide checkout information first');
            $notify_message = array('message' => $notify_message, 'alert-type' => 'error');
            return redirect()->route('view.checkout')->with($notify_message);
        }

        if (env('Global_SEARCH') === 'DISABLE') {

            $orderData = session('order_data');
            $restaurantId = $orderData['restaurant_id'] ?? null;
            $lat = $orderData['lat'] ?? null;
            $lon = $orderData['lon'] ?? null;
            $order_type = $orderData['order_type'] ?? 'delivery';

            if($order_type == 'delivery' && !empty($lat) && !empty($lon)){
                $restaurant = Restaurant::where('id', $restaurantId)
                            ->where('is_banned', 'disable')
                            ->where('admin_approval', 'enable')
                            ->whereRaw("(
                                6371 * acos(
                                    cos(radians(?)) *
                                    cos(radians(latitude)) *
                                    cos(radians(longitude) - radians(?)) +
                                    sin(radians(?)) *
                                    sin(radians(latitude))
                                )
                            ) <= max_delivery_distance", [$lat, $lon, $lat])
                            ->first();

                if (!$restaurant) {
                    $notify_message = trans('translate.We unable to deliver to your location. Please change your address or select another restaurant.');
                    $notify_message = array('message' => $notify_message, 'alert-type' => 'error');
                    return redirect()->route('view.checkout')->with($notify_message);
                }
            }
        }


        $payment_data = PaymentGateway::all();

        $payment_setting = array();

        foreach($payment_data as $data_item){
            $payment_setting[$data_item->key] = $data_item->value;
        }

        $payment_setting = (object) $payment_setting;

        $carts = session()->get('cart', []);

        $default_currency = Currency::where('is_default', 'yes')->where('status', 'active')->first()
            ?? Currency::where('currency_code', 'NGN')->first()
            ?? Currency::where('status', 'active')->first()
            ?? Currency::first();

        $razorpay_currency = (!empty($this->payment_setting->razorpay_currency_id) ? Currency::find($this->payment_setting->razorpay_currency_id) : null) ?? $default_currency;
        $flutterwave_currency = (!empty($this->payment_setting->flutterwave_currency_id) ? Currency::find($this->payment_setting->flutterwave_currency_id) : null) ?? $default_currency;
        $paystack_currency = (!empty($this->payment_setting->paystack_currency_id) ? Currency::find($this->payment_setting->paystack_currency_id) : null) ?? $default_currency;

        return view('frontend.payment.index', compact('payment_setting', 'carts', 'razorpay_currency', 'flutterwave_currency', 'paystack_currency'));
    }


}
