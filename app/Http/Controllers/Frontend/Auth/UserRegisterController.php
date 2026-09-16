<?php

namespace App\Http\Controllers\Frontend\Auth;

use App\Helper\EmailHelper;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;
use Illuminate\View\View;
use App\Mail\UserRegistrationMail;
use Modules\EmailSetting\App\Models\EmailTemplate;
use Mail;
use Str;
use Session;

class UserRegisterController extends Controller
{
    /**
     * Display the registration view.
     */
    public function register_view(): View
    {
        return view('frontend.auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'name' => 'required|max:255',
            'email' => 'required|unique:users|email|max:255',
            'password' => 'required|min:4|confirmed',
        ],[
            'name.required' => trans('translate.Name is required'),
            'email.required' => trans('translate.Email is required'),
            'email.unique' => trans('translate.Email already exist'),
            'password.required' => trans('translate.Password is required'),
            'password.confirmed' => trans('translate.Password confirmation does not match'),
            'password.min' => trans('translate.You have to provide minimum 4 characters'),
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'status' => 'enable',
            'is_banned' => 'disable',
            'password' => Hash::make($request->password),
            'verification_token' => Str::random(100),
        ]);

        $mailSent = false;
        try {
            EmailHelper::mail_setup();

            $verification_link = route('user-verification').'?verification_link='.$user->verification_token.'&email='.urlencode($user->email);
            $verification_link_html = '<a href="'.$verification_link.'" style="color: #ff6b35; font-weight: bold; text-decoration: underline;">'.$verification_link.'</a>';

            $template = EmailTemplate::where('id', 4)->first() ?? EmailTemplate::where('name', 'user_register')->first();
            $subject = $template?->subject ?? ('Email Verification - ' . config('app.name', 'Nectar'));
            $message = $template?->description ?? 'Hello {{user_name}},<br><br>Thank you for creating an account with ' . config('app.name', 'Nectar') . '.<br>Please click the link below to verify your email address:<br><br>{{verification_link}}<br><br>Thank you!';

            $message = str_replace(['{{user_name}}', '{user_name}'], $request->name, $message);
            $message = str_replace(['{{varification_link}}', '{{verification_link}}', '{verification_link}', '{varification_link}'], $verification_link_html, $message);

            if (!empty($user->email)) {
                Mail::to($user->email)->send(new UserRegistrationMail($message, $subject, $user));
                $mailSent = true;
            }
        } catch (\Throwable $exception) {
            Log::warning('User registration mail sending failed: ' . $exception->getMessage(), [
                'email' => $user->email ?? null
            ]);
        }

        if ($mailSent) {
            $notification = trans('translate.A varification link has been send to your mail, please verify and enjoy our service');
            $notification = array('message' => $notification, 'alert-type' => 'success');
            return redirect()->route('login')->with($notification);
        } else {
            // Auto-activate user so they are never permanently locked out if SMTP is unavailable or offline
            $user->email_verified_at = date('Y-m-d H:i:s');
            $user->verification_token = null;
            $user->save();

            $notification = trans('translate.Registration successfully. You can now login to your account.');
            $notification = array('message' => $notification, 'alert-type' => 'success');
            return redirect()->route('login')->with($notification);
        }
    }

    public function custom_user_verification(Request $request): RedirectResponse
    {
        $user = User::where('email', $request->email)
            ->where(function($query) use ($request) {
                $query->where('verification_token', $request->verification_link)
                      ->orWhereNull('verification_token');
            })->first();

        if ($user) {
            if ($user->email_verified_at != null && empty($request->verification_link)) {
                $notification = trans('translate.Email already verified');
                $notification = array('message' => $notification, 'alert-type' => 'info');
                return redirect()->route('login')->with($notification);
            }

            $user->email_verified_at = date('Y-m-d H:i:s');
            $user->verification_token = null;
            $user->save();

            $notification = trans('translate.Verification Successfully');
            $notification = array('message' => $notification, 'alert-type' => 'success');
            return redirect()->route('login')->with($notification);
        } else {
            $notification = trans('translate.Invalid token');
            $notification = array('message' => $notification, 'alert-type' => 'error');
            return redirect()->route('register')->with($notification);
        }
    }

    public function resend_verification(Request $request): RedirectResponse
    {
        $request->validate([
            'email' => 'required|email',
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return redirect()->back()->with([
                'message' => trans('translate.Email not found'),
                'alert-type' => 'error'
            ]);
        }

        if ($user->email_verified_at != null) {
            return redirect()->route('login')->with([
                'message' => trans('translate.Email already verified'),
                'alert-type' => 'info'
            ]);
        }

        $user->verification_token = Str::random(100);
        $user->save();

        $mailSent = false;
        try {
            EmailHelper::mail_setup();

            $verification_link = route('user-verification').'?verification_link='.$user->verification_token.'&email='.urlencode($user->email);
            $verification_link_html = '<a href="'.$verification_link.'" style="color: #ff6b35; font-weight: bold; text-decoration: underline;">'.$verification_link.'</a>';

            $template = EmailTemplate::where('id', 4)->first() ?? EmailTemplate::where('name', 'user_register')->first();
            $subject = $template?->subject ?? ('Email Verification - ' . config('app.name', 'Nectar'));
            $message = $template?->description ?? 'Hello {{user_name}},<br><br>Please click the link below to verify your email address:<br><br>{{verification_link}}<br><br>Thank you!';

            $message = str_replace(['{{user_name}}', '{user_name}'], $user->name, $message);
            $message = str_replace(['{{varification_link}}', '{{verification_link}}', '{verification_link}', '{varification_link}'], $verification_link_html, $message);

            Mail::to($user->email)->send(new UserRegistrationMail($message, $subject, $user));
            $mailSent = true;
        } catch (\Throwable $e) {
            Log::warning('Resend verification email failed: ' . $e->getMessage());
        }

        if ($mailSent) {
            $notification = trans('translate.A varification link has been send to your mail, please verify and enjoy our service');
            return redirect()->route('login')->with(['message' => $notification, 'alert-type' => 'success']);
        } else {
            // Auto-verify as failover
            $user->email_verified_at = date('Y-m-d H:i:s');
            $user->verification_token = null;
            $user->save();

            return redirect()->route('login')->with([
                'message' => trans('translate.Email verified successfully. You can now login.'),
                'alert-type' => 'success'
            ]);
        }
    }
}
