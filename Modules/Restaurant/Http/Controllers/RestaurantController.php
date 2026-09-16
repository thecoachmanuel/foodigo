<?php

namespace Modules\Restaurant\Http\Controllers;

use Image, File, Str;
use App\Models\Review;
use App\Models\OfferProduct;
use App\Models\RestaurantWishlist;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Contracts\Support\Renderable;
use Modules\City\Entities\City;
use Modules\Cuisine\Entities\Cuisine;
use Modules\Order\App\Models\Order;
use Modules\Order\App\Models\OrderItem;
use Modules\PaymentWithdraw\App\Models\SellerWithdraw;
use Modules\Product\App\Models\Product;
use Modules\Product\App\Models\ProductTranslation;
use Modules\Restaurant\Entities\Restaurant;
use Modules\Restaurant\Http\Requests\RestaurantRequest;

class RestaurantController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        $restaurants = Restaurant::withoutGlobalScopes()->latest()->get();

        return view('restaurant::index', ['restaurants' => $restaurants]);
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        $cities = City::with('translate')->get();
        $cuisines = Cuisine::with('translate')->get();

        return view('restaurant::create', ['cities' => $cities, 'cuisines' => $cuisines]);
    }

    /**
     * Store a newly created resource in storage.
     * @param RestaurantRequest $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(RestaurantRequest $request)
    {
        $restaurant = new Restaurant();

        // Basic info
        $restaurant->restaurant_name = $request->restaurant_name;
        $restaurant->slug = $request->slug ?: Str::slug($request->restaurant_name);
        $restaurant->city_id = $request->city_id;
        $restaurant->cuisines = json_encode($request->cuisines ?: []);

        if ($request->hasFile('logo')) {
            $image_name = 'restaurant-logo-' . date('Y-m-d-h-i-s-') . rand(999, 9999) . '.webp';
            $image_path = 'uploads/custom-images/' . $image_name;
            if (!File::isDirectory(public_path('uploads/custom-images'))) {
                File::makeDirectory(public_path('uploads/custom-images'), 0755, true, true);
            }
            Image::make($request->file('logo'))
                ->encode('webp', 80)
                ->save(public_path($image_path));
            $restaurant->logo = $image_path;
        }

        if ($request->hasFile('cover_image')) {
            $image_name = 'restaurant-cover-' . date('Y-m-d-h-i-s-') . rand(999, 9999) . '.webp';
            $image_path = 'uploads/custom-images/' . $image_name;
            if (!File::isDirectory(public_path('uploads/custom-images'))) {
                File::makeDirectory(public_path('uploads/custom-images'), 0755, true, true);
            }
            Image::make($request->file('cover_image'))
                ->encode('webp', 80)
                ->save(public_path($image_path));
            $restaurant->cover_image = $image_path;
        }

        // Address info
        $restaurant->whatsapp = $request->whatsapp;
        $restaurant->address = $request->address;
        $restaurant->latitude = $request->latitude;
        $restaurant->longitude = $request->longitude;
        $restaurant->max_delivery_distance = $request->max_delivery_distance;

        // Owner info
        $restaurant->owner_name = $request->owner_name;
        $restaurant->owner_email = $request->owner_email;
        $restaurant->owner_phone = $request->owner_phone;

        // Account credentials
        $restaurant->name = $request->name;
        $restaurant->email = $request->email;
        $restaurant->password = Hash::make($request->password);

        // Operational & Configuration info
        $restaurant->opening_hour = $request->opening_hour;
        $restaurant->closing_hour = $request->closing_hour;
        $restaurant->min_processing_time = $request->min_processing_time;
        $restaurant->max_processing_time = $request->max_processing_time;
        $restaurant->time_slot_separate = $request->time_slot_separate;
        $restaurant->tags = $request->tags;
        $restaurant->is_featured = $request->is_featured ? 'enable' : 'disable';
        $restaurant->is_pickup_order = $request->is_pickup_order ? 'enable' : 'disable';
        $restaurant->is_delivery_order = $request->is_delivery_order ? 'enable' : 'disable';
        $restaurant->admin_approval = $request->admin_approval ?: 'enable';
        $restaurant->save();

        $notification = ['message' => trans('translate.Created Successfully'), 'alert-type' => 'success'];
        return redirect()->route('admin.restaurants.index')->with($notification);
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        $restaurant = Restaurant::withoutGlobalScopes()->findOrFail($id);
        $cities = City::with('translate')->get();
        $cuisines = Cuisine::with('translate')->get();

        return view('restaurant::edit', ['restaurant' => $restaurant, 'cities' => $cities, 'cuisines' => $cuisines]);
    }

    /**
     * Update the specified resource in storage.
     * @param RestaurantRequest $request
     * @param int $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(RestaurantRequest $request, $id)
    {
        $restaurant = Restaurant::withoutGlobalScopes()->findOrFail($id);

        // Basic info
        $restaurant->restaurant_name = $request->restaurant_name;
        if ($request->slug) {
            $restaurant->slug = $request->slug;
        }
        $restaurant->city_id = $request->city_id;
        $restaurant->cuisines = json_encode($request->cuisines ?: []);

        if ($request->hasFile('logo')) {
            $old_image = $restaurant->logo;
            $image_name = 'restaurant-logo-' . date('Y-m-d-h-i-s-') . rand(999, 9999) . '.webp';
            $image_path = 'uploads/custom-images/' . $image_name;
            if (!File::isDirectory(public_path('uploads/custom-images'))) {
                File::makeDirectory(public_path('uploads/custom-images'), 0755, true, true);
            }
            Image::make($request->file('logo'))
                ->encode('webp', 80)
                ->save(public_path($image_path));
            $restaurant->logo = $image_path;

            if ($old_image && File::exists(public_path($old_image))) {
                @unlink(public_path($old_image));
            }
        }

        if ($request->hasFile('cover_image')) {
            $old_image = $restaurant->cover_image;
            $image_name = 'restaurant-cover-' . date('Y-m-d-h-i-s-') . rand(999, 9999) . '.webp';
            $image_path = 'uploads/custom-images/' . $image_name;
            if (!File::isDirectory(public_path('uploads/custom-images'))) {
                File::makeDirectory(public_path('uploads/custom-images'), 0755, true, true);
            }
            Image::make($request->file('cover_image'))
                ->encode('webp', 80)
                ->save(public_path($image_path));
            $restaurant->cover_image = $image_path;

            if ($old_image && File::exists(public_path($old_image))) {
                @unlink(public_path($old_image));
            }
        }

        // Address info
        $restaurant->whatsapp = $request->whatsapp;
        $restaurant->address = $request->address;
        $restaurant->latitude = $request->latitude;
        $restaurant->longitude = $request->longitude;
        $restaurant->max_delivery_distance = $request->max_delivery_distance;

        // Owner info
        $restaurant->owner_name = $request->owner_name;
        $restaurant->owner_email = $request->owner_email;
        $restaurant->owner_phone = $request->owner_phone;

        // Account info
        $restaurant->name = $request->name;
        if ($request->email) {
            $restaurant->email = $request->email;
        }
        if (!empty($request->password)) {
            $restaurant->password = Hash::make($request->password);
        }

        // Operational & Configuration info
        $restaurant->opening_hour = $request->opening_hour;
        $restaurant->closing_hour = $request->closing_hour;
        $restaurant->min_processing_time = $request->min_processing_time;
        $restaurant->max_processing_time = $request->max_processing_time;
        $restaurant->time_slot_separate = $request->time_slot_separate;
        $restaurant->tags = $request->tags;
        $restaurant->is_featured = $request->is_featured ? 'enable' : 'disable';
        $restaurant->is_pickup_order = $request->is_pickup_order ? 'enable' : 'disable';
        $restaurant->is_delivery_order = $request->is_delivery_order ? 'enable' : 'disable';
        if ($request->admin_approval) {
            $restaurant->admin_approval = $request->admin_approval;
        }
        $restaurant->save();

        $notification = ['message' => trans('translate.Updated Successfully'), 'alert-type' => 'success'];
        return redirect()->route('admin.restaurants.index')->with($notification);
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($id)
    {
        try {
            DB::transaction(function () use ($id) {
                $restaurant = Restaurant::withoutGlobalScopes()->findOrFail($id);

                // 1. Delete associated products and product child records
                $products = Product::withoutGlobalScopes()->where('restaurant_id', $id)->get();
                foreach ($products as $product) {
                    ProductTranslation::where('product_id', $product->id)->delete();
                    OfferProduct::where('product_id', $product->id)->delete();
                    Review::where('product_id', $product->id)->delete();
                    OrderItem::where('product_id', $product->id)->delete();

                    if ($product->image && File::exists(public_path($product->image))) {
                        @unlink(public_path($product->image));
                    }
                    $product->delete();
                }

                // 2. Delete reviews, wishlists, and withdraw requests
                Review::where('restaurant_id', $id)->delete();
                RestaurantWishlist::where('restaurant_id', $id)->delete();
                SellerWithdraw::where('seller_id', $id)->delete();

                // 3. Delete orders for this restaurant
                $orders = Order::where('restaurant_id', $id)->get();
                foreach ($orders as $order) {
                    OrderItem::where('order_id', $order->id)->delete();
                    $order->delete();
                }

                // 4. Delete images from filesystem
                if ($restaurant->logo && File::exists(public_path($restaurant->logo))) {
                    @unlink(public_path($restaurant->logo));
                }
                if ($restaurant->cover_image && File::exists(public_path($restaurant->cover_image))) {
                    @unlink(public_path($restaurant->cover_image));
                }

                // 5. Delete restaurant
                $restaurant->delete();
            });

            $notification = ['message' => trans('translate.Deleted Successfully'), 'alert-type' => 'success'];
            return redirect()->route('admin.restaurants.index')->with($notification);

        } catch (\Throwable $e) {
            $notification = ['message' => $e->getMessage(), 'alert-type' => 'error'];
            return redirect()->back()->with($notification);
        }
    }

    public function trusted_status($id)
    {
        $restaurant = Restaurant::withoutGlobalScopes()->findOrFail($id);
        $restaurant->is_trusted = $restaurant->is_trusted == 1 ? 0 : 1;
        $restaurant->save();

        $message = trans('translate.Status Changed Successfully');
        return response()->json($message);
    }
}
