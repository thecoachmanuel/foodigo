<?php

namespace Modules\Newsletter\Http\Controllers;

use App\Helper\EmailHelper;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Modules\EmailSetting\App\Models\EmailTemplate;
use Modules\Newsletter\Entities\Subscriber;
use Illuminate\Support\Facades\Log;
use Modules\Newsletter\Http\Requests\NewsletterRequest;
use Str, Mail, Hash, Auth;
use Modules\Newsletter\Emails\NewsletterVerification;

class NewsletterController extends Controller
{

    public function newsletter_request(NewsletterRequest $request): RedirectResponse
    {
        $newsletter = Subscriber::where('email', $request->email)->first();

        if ($newsletter && $newsletter->is_verified == 1) {
            $notification = [
                'message' => trans('translate.You have already subscribed to our newsletter'),
                'alert-type' => 'info'
            ];
            return redirect()->back()->with($notification);
        }

        if (!$newsletter) {
            $newsletter = new Subscriber();
            $newsletter->email = $request->email;
        }

        $newsletter->verified_token = Str::random(25);
        $newsletter->is_verified = 0;
        $newsletter->status = 0;
        $newsletter->save();

        $mailSent = false;
        try {
            EmailHelper::mail_setup();

            $verification_link = route('newsletter-verification').'?verification_link='.$newsletter->verified_token.'&email='.$newsletter->email;
            $verification_link_html = '<a href="'.$verification_link.'">'.$verification_link.'</a>';

            $template = EmailTemplate::find(3) ?? EmailTemplate::where('name', 'subscribe_notification')->first();
            $message = $template?->description ?? 'Please click the link below to verify your email:<br>{{verification_link}}';
            $subject = $template?->subject ?? 'Newsletter Verification';
            $message = str_replace('{{verification_link}}', $verification_link_html, $message);

            if (!empty($newsletter->email) && !empty($message) && !empty($subject)) {
                Mail::to($newsletter->email)->send(new NewsletterVerification($message, $subject));
                $mailSent = true;
            }
        } catch (\Exception $e) {
            Log::warning('Newsletter mail sending failed, auto-activating subscriber: ' . $e->getMessage(), [
                'newsletter' => $newsletter ?? null,
            ]);
        }

        if ($mailSent) {
            $notification = trans('translate.A verification link has been send to your email, please verify and enjoy our newsletter');
            $notification = array('message' => $notification, 'alert-type' => 'success');
        } else {
            // Auto-verify subscriber so they are immediately active if SMTP is not configured
            $newsletter->is_verified = 1;
            $newsletter->status = 1;
            $newsletter->verified_token = null;
            $newsletter->save();

            $notification = trans('translate.Subscription successfully, thank you for subscribing');
            $notification = array('message' => $notification, 'alert-type' => 'success');
        }

        return redirect()->back()->with($notification);
    }


    public function newsletter_verification(Request $request): RedirectResponse
    {
        $newsletter = Subscriber::where('email', $request->email)
            ->where(function($query) use ($request) {
                $query->where('verified_token', $request->verification_link)
                      ->orWhereNull('verified_token');
            })->first();

        if($newsletter){
            $newsletter->verified_token = null;
            $newsletter->is_verified = 1;
            $newsletter->status = 1;
            $newsletter->save();

            $notification = trans('translate.Email verification successfully');
            $notification = array('message'=>$notification,'alert-type'=>'success');
            return redirect()->route('home')->with($notification);
        }else{
            $notification = trans('translate.Something went wrong');
            $notification = array('message'=>$notification,'alert-type'=>'error');
            return redirect()->route('home')->with($notification);
        }
    }

}
