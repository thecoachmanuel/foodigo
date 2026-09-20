<?php

namespace App\Http\Controllers\Api\Restaurant;

use App\Http\Controllers\Api\BaseController;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image;
use Modules\City\Entities\City;
use Modules\Cuisine\Entities\Cuisine;

class RestaurantProfileController extends BaseController
{

    public function edit(Request $request): JsonResponse
    {
        try {
            $restaurant = $request->user();
            $cities = City::with('translate')->get();
            $cuisines = Cuisine::with('translate')->get();

            $data = [
                'restaurant' => [
                    'restaurant' => $restaurant,
                    'cities' => $cities,
                    'cuisines' => $cuisines,
                ]
            ];

            return $this->sendResponse($data, 'Profile edit page data retrieved successfully');
        } catch (\Exception $e) {
            return $this->sendError('Something went wrong', [], 500);
        }
    }

    public function update(Request $request): JsonResponse
    {
        $validator = Validator::make(
            $request->all(),
            [
                'restaurant_name'       => 'nullable|max:255',
                'name'                  => 'nullable|max:255',
                'email'                 => 'nullable|email|max:255',
                'phone'                 => 'nullable|max:255',
                'address'               => 'nullable|max:255',
                'city_id'               => 'nullable',
                'cuisines'              => 'nullable',
                'whatsapp'              => 'nullable|max:255',
                'latitude'              => 'nullable',
                'longitude'             => 'nullable',
                'max_delivery_distance' => 'nullable|numeric',
                'owner_name'            => 'nullable|max:255',
                'owner_email'           => 'nullable|max:255',
                'owner_phone'           => 'nullable|max:255',
                'opening_hour'          => 'nullable|max:255',
                'closing_hour'          => 'nullable|max:255',
                'min_processing_time'   => 'nullable|numeric|max:255',
                'max_processing_time'   => 'nullable|numeric|max:255',
                'time_slot_separate'    => 'nullable|numeric|max:255',
                'min_order_amount'      => 'nullable|numeric',
                'is_featured'           => 'nullable',
                'pickup_order'          => 'nullable',
                'delivery_order'        => 'nullable',
            ]
        );

        if ($validator->fails()) {
            return $this->sendValidationError($validator->errors()->toArray());
        }

        try {
            $restaurant = $request->user();

            if ($request->filled('restaurant_name')) {
                $restaurant->restaurant_name = $request->restaurant_name;
            }
            if ($request->filled('city_id')) {
                $restaurant->city_id = $request->city_id;
            }
            if ($request->filled('cuisines')) {
                $restaurant->cuisines = $request->cuisines;
            }
            if ($request->filled('whatsapp')) {
                $restaurant->whatsapp = $request->whatsapp;
            }
            if ($request->filled('address')) {
                $restaurant->address = $request->address;
            }
            if ($request->filled('latitude')) {
                $restaurant->latitude = $request->latitude;
            }
            if ($request->filled('longitude')) {
                $restaurant->longitude = $request->longitude;
            }
            if ($request->filled('max_delivery_distance')) {
                $restaurant->max_delivery_distance = $request->max_delivery_distance;
            }
            if ($request->filled('owner_name')) {
                $restaurant->owner_name = $request->owner_name;
            }
            if ($request->filled('owner_email')) {
                $restaurant->owner_email = $request->owner_email;
            }
            if ($request->filled('owner_phone')) {
                $restaurant->owner_phone = $request->owner_phone;
            }
            if ($request->filled('name')) {
                $restaurant->name = $request->name;
            }
            if ($request->filled('email')) {
                $restaurant->email = $request->email;
            }
            if ($request->filled('phone')) {
                $restaurant->phone = $request->phone;
            }
            if ($request->filled('min_order_amount')) {
                $restaurant->min_order_amount = $request->min_order_amount;
            }
            if ($request->filled('opening_hour')) {
                $restaurant->opening_hour = $request->opening_hour;
            }
            if ($request->filled('closing_hour')) {
                $restaurant->closing_hour = $request->closing_hour;
            }
            if ($request->filled('min_processing_time')) {
                $restaurant->min_processing_time = $request->min_processing_time;
            }
            if ($request->filled('max_processing_time')) {
                $restaurant->max_processing_time = $request->max_processing_time;
            }
            if ($request->filled('time_slot_separate')) {
                $restaurant->time_slot_separate = $request->time_slot_separate;
            }
            if ($request->has('tags')) {
                $restaurant->tags = $request->tags;
            }
            if ($request->has('is_featured')) {
                $v = $request->is_featured;
                $restaurant->is_featured = ($v === 'enable' || $v === '1' || $v === 1 || $v === true) ? 'enable' : 'disable';
            }
            if ($request->has('pickup_order') || $request->has('is_pickup_order')) {
                $v = $request->pickup_order ?? $request->is_pickup_order;
                $restaurant->is_pickup_order = ($v === 'enable' || $v === '1' || $v === 1 || $v === true) ? 'enable' : 'disable';
            }
            if ($request->has('delivery_order') || $request->has('is_delivery_order')) {
                $v = $request->delivery_order ?? $request->is_delivery_order;
                $restaurant->is_delivery_order = ($v === 'enable' || $v === '1' || $v === 1 || $v === true) ? 'enable' : 'disable';
            }

            if ($request->hasFile('logo') || ($request->logo && !is_string($request->logo))) {
                $old_image = $restaurant->logo;
                $image_name = 'restaurant-logo-' . date('-Y-m-d-h-i-s-') . rand(999, 9999) . '.webp';
                $image_name = 'uploads/custom-images/' . $image_name;
                Image::make($request->file('logo') ?? $request->logo)
                    ->encode('webp', 80)
                    ->save(public_path() . '/' . $image_name);
                $restaurant->logo = $image_name;

                if ($old_image && File::exists(public_path() . '/' . $old_image)) {
                    @unlink(public_path() . '/' . $old_image);
                }
            }

            if ($request->hasFile('cover_image') || ($request->cover_image && !is_string($request->cover_image))) {
                $old_image = $restaurant->cover_image;
                $image_name = 'restaurant-cover-' . date('-Y-m-d-h-i-s-') . rand(999, 9999) . '.webp';
                $image_name = 'uploads/custom-images/' . $image_name;
                Image::make($request->file('cover_image') ?? $request->cover_image)
                    ->encode('webp', 80)
                    ->save(public_path() . '/' . $image_name);
                $restaurant->cover_image = $image_name;

                if ($old_image && File::exists(public_path() . '/' . $old_image)) {
                    @unlink(public_path() . '/' . $old_image);
                }
            }

            $restaurant->save();

            $data = [
                'restaurant' => $restaurant,
            ];

            return $this->sendResponse($data, 'Profile data updated successfully');
        } catch (\Exception $e) {
            return $this->sendError('Something went wrong: ' . $e->getMessage(), [], 500);
        }
    }

    public function updatePassword(Request $request): JsonResponse
    {
        $validator = Validator::make(
            $request->all(),
            [
                'current_password' => 'required',
                'password'         => 'required|min:4|max:100|confirmed',
            ],
            [
                'current_password.required' => __('translate.Current password is required'),
                'password.required'         => __('translate.Password is required'),
                'password.confirmed'        => __('translate.Password confirmation is required'),
            ]
        );

        if ($validator->fails()) {
            return $this->sendValidationError($validator->errors()->toArray());
        }

        try {

            $restaurant = $request->user();

            if (Hash::check($request->current_password, $restaurant->password)) {
                $restaurant->password = Hash::make($request->password);
                $restaurant->save();

                return $this->sendResponse('Password updated successfully');
            } else {
                return $this->sendResponse('Current password does not match');
            }

        } catch (\Exception $e) {
            return $this->sendError('Something went wrong', [], 500);
        }
    }
}
