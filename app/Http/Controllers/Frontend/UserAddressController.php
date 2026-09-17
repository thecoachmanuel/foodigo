<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\UserAddress;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserAddressController extends Controller
{
    public function view_address(): Renderable
    {
        $user = Auth::user();
        $addresses = UserAddress::where('user_id', $user->id)->get();

        return view('frontend.address.user_address', compact('user', 'addresses'));
    }

    public function store_address(Request $request)
    {
        // Auto-resolve coordinates if missing or zero
        if (empty($request->latitude) || empty($request->longitude) || (float)$request->latitude == 0) {
            $coords = resolve_nigerian_coordinates($request->address);
            $request->merge([
                'latitude' => $coords['latitude'],
                'longitude' => $coords['longitude'],
            ]);
        }

        $rules = [
            'name' => 'required',
            'phone' => 'required',
            'address' => 'required|max:220',
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
        ];
        $customMessages = [
            'name.required' => trans('translate.Name is required'),
            'email.required' => trans('translate.Email is required'),
            'phone.required' => trans('translate.Phone is required'),
            'address.required' => trans('translate.Address is required')
        ];

        $this->validate($request, $rules, $customMessages);

        $user = Auth::user();

        $user_address = new UserAddress();
        $user_address->user_id = $user->id;
        $user_address->name = $request->name;
        $user_address->email = $request->email;
        $user_address->phone = $request->phone;
        $user_address->address = $request->address;
        $user_address->lat = $request->latitude;
        $user_address->lon = $request->longitude;
        $user_address->delivery_type = $request->delivery_type;
        $user_address->save();

        $notification = trans('translate.Your address added successfully');
        $notification = array('message' => $notification, 'alert-type' => 'success');
        return redirect()->back()->with($notification);

    }

    public function edit_address($id): Renderable
    {
        $user = Auth::user();
        $address = UserAddress::findOrFail($id);

        return view('frontend.address.edit_address', compact('user', 'address'));
    }

    public function update_address(Request $request, $id): RedirectResponse
    {
        // Retrieve the user address instance by ID
        $user_address = UserAddress::findOrFail($id);

        // Auto-resolve coordinates if address changed or coords missing
        if (empty($request->latitude) || empty($request->longitude) || (float)$request->latitude == 0) {
            $coords = resolve_nigerian_coordinates($request->address);
            $request->merge([
                'latitude' => $coords['latitude'],
                'longitude' => $coords['longitude'],
            ]);
        }

        // Define validation rules
        $rules = [
            'name' => 'required',
            'phone' => 'required',
            'address' => 'required|max:220',
        ];

        $customMessages = [
            'name.required' => trans('translate.Name is required'),
            'email.required' => trans('translate.Email is required'),
            'phone.required' => trans('translate.Phone is required'),
            'address.required' => trans('translate.Address is required')
        ];

        $this->validate($request, $rules, $customMessages);

        $user = Auth::user();

        $user_address->user_id = $user->id;
        $user_address->name = $request->name;
        $user_address->email = $request->email;
        $user_address->phone = $request->phone;
        $user_address->address = $request->address;
        $user_address->lat = $request->latitude ? $request->latitude : $user_address->lat;
        $user_address->lon = $request->longitude ? $request->longitude : $user_address->lon;
        $user_address->delivery_type = $request->delivery_type;
        $user_address->save();

        $notification = trans('translate.Your address updated successfully');
        $notification = array('message' => $notification, 'alert-type' => 'success');
        return redirect()->back()->with($notification);

    }

    /**
     * Remove the specified resource from storage.
     */
    public function delete_address(Request $request, $id)
    {
        $user = Auth::user();
        $address = UserAddress::where('user_id', $user->id)->where('id', $id)->first();

        if ($address) {
            $address->delete();
            $message = trans('translate.Deleted successfully');
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json(['status' => true, 'message' => $message]);
            }
            $notify_message = array('message' => $message, 'alert-type' => 'success');
            return redirect()->route('user.address')->with($notify_message);
        }

        if ($request->ajax() || $request->wantsJson()) {
            return response()->json(['status' => false, 'message' => trans('translate.Address not found')], 404);
        }
        return redirect()->back()->with(['message' => trans('translate.Address not found'), 'alert-type' => 'error']);
    }

    /**
     * Remove the specified resource from storage during checkout.
     */
    public function delete_address_checkout(Request $request, $id)
    {
        $user = Auth::user();
        $address = UserAddress::where('user_id', $user->id)->where('id', $id)->first();

        if ($address) {
            $address->delete();
            $message = trans('translate.Deleted successfully');
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json(['status' => true, 'message' => $message]);
            }
            $notify_message = array('message' => $message, 'alert-type' => 'success');
            return redirect()->route('view.checkout')->with($notify_message);
        }

        if ($request->ajax() || $request->wantsJson()) {
            return response()->json(['status' => false, 'message' => trans('translate.Address not found')], 404);
        }
        return redirect()->back()->with(['message' => trans('translate.Address not found'), 'alert-type' => 'error']);
    }
}
