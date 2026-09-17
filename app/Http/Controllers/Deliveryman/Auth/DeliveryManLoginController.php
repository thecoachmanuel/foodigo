<?php

namespace App\Http\Controllers\Deliveryman\Auth;

use App\Models\DeliveryMan;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use Hash;
use Illuminate\Support\Facades\View;

class DeliveryManLoginController extends Controller
{
   public function loginPage(){
    return view('deliveryman.login');
   }




    public function dashboardLogin(Request $request) {
        $rules = [
            'email' => 'required|email',
            'password' => 'required',
        ];

        $customMessages = [
            'email.required' => trans('translate.Email is required'),
            'email.email' => trans('translate.Invalid email format'),
            'password.required' => trans('translate.Password is required'),
        ];

        $this->validate($request, $rules, $customMessages);

        $credentials = [
            'email' => $request->email,
            'password' => $request->password
        ];

        $deliveryMan = DeliveryMan::where('email', $request->email)->first();

        if (!$deliveryMan) {
            return back()->withInput($request->only('email', 'remember'))->withErrors(['email' => trans('translate.Invalid Email')]);
        }

        if (!Hash::check($request->password, $deliveryMan->password)) {
            return back()->withInput($request->only('email', 'remember'))->withErrors(['password' => trans('translate.Invalid Password')]);
        }

        if ((int)$deliveryMan->status !== 1) {
            return back()->withInput($request->only('email', 'remember'))->withErrors(['email' => trans('translate.Your account is inactive or pending approval')]);
        }

        Auth::guard('deliveryman')->login($deliveryMan, $request->boolean('remember'));
        $request->session()->regenerate();

        return redirect()->route('deliveryman.dashboard')->with([
            'message' => trans('translate.Login successfully'),
            'alert-type' => 'success'
        ]);
    }

    public function logout(){
        Auth::guard('deliveryman')->logout();
        $notification = [
            'message' => trans('translate.Logout successfully'),
            'alert-type' => 'success'
        ];
        return redirect()->route('deliveryman.login')->with($notification);
    }
}
