<?php

namespace Modules\EmailSetting\App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Modules\EmailSetting\App\Models\EmailSetting;
use Modules\EmailSetting\App\Models\EmailTemplate;
use App\Helper\EmailHelper;
use Illuminate\Support\Facades\Mail;
use Modules\EmailSetting\App\Http\Requests\EmailSettingRequest;
use Modules\EmailSetting\App\Http\Requests\EmailTemplateRequest;

class EmailSettingController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        $setting_data = EmailSetting::all();

        $email_setting = array();

        foreach($setting_data as $data_item){
            $email_setting[$data_item->key] = $data_item->value;
        }

        $email_setting = (object) $email_setting;

        return view('emailsetting::email_configuration', ['email_setting' => $email_setting]);
    }


    public function update(EmailSettingRequest $request)
    {
        $password = trim($request->smtp_password ?? '');
        if (!empty($password) && (str_contains(strtolower($request->mail_host ?? ''), 'gmail.com') || str_contains(strtolower($request->mail_host ?? ''), 'googlemail.com') || strlen(str_replace(' ', '', $password)) === 16)) {
            $password = str_replace(' ', '', $password);
        }

        EmailSetting::where('key', 'sender_name')->update(['value' => trim($request->sender_name ?? '')]);
        EmailSetting::where('key', 'mail_host')->update(['value' => trim($request->mail_host ?? '')]);
        EmailSetting::where('key', 'email')->update(['value' => trim($request->email ?? '')]);
        EmailSetting::where('key', 'smtp_username')->update(['value' => trim($request->smtp_username ?? '')]);
        EmailSetting::where('key', 'smtp_password')->update(['value' => $password]);
        EmailSetting::where('key', 'mail_port')->update(['value' => trim($request->mail_port ?? '')]);
        EmailSetting::where('key', 'mail_encryption')->update(['value' => trim($request->mail_encryption ?? '')]);

        $notify_message = trans('translate.Updated successfully');
        $notify_message = array('message' => $notify_message, 'alert-type' => 'success');
        return redirect()->back()->with($notify_message);
    }

    public function email_template(){

        $template_list = EmailTemplate::all();


        return view('emailsetting::template_list', ['template_list' => $template_list]);
    }

    public function edit_email_template($id){

        $template_item = EmailTemplate::findOrFail($id);

        if($template_item->id == 1){
            return view('emailsetting::password_reset', ['template_item' => $template_item]);
        }elseif($template_item->id == 2){
            return view('emailsetting::contact_message', ['template_item' => $template_item]);
        }elseif($template_item->id == 3){
            return view('emailsetting::newsletter', ['template_item' => $template_item]);
        }elseif($template_item->id == 4){
            return view('emailsetting::user_register', ['template_item' => $template_item]);
        }elseif($template_item->id == 5 || $template_item->id == 6 || $template_item->id == 7 || $template_item->id == 8 || $template_item->id == 9|| $template_item->id == 10){
            return view('emailsetting::new_order', ['template_item' => $template_item]);
        }else{
            abort(404);
        }

    }


    public function update_email_template(EmailTemplateRequest $request, $id){

        $template_item = EmailTemplate::findOrFail($id);
        $template_item->subject = $request->subject;
        $template_item->description = $request->description;
        $template_item->save();

        $notify_message = trans('translate.Updated successfully');
        $notify_message = array('message' => $notify_message, 'alert-type' => 'success');
        return redirect()->back()->with($notify_message);
    }

    public function send_test_email(Request $request): RedirectResponse
    {
        $request->validate([
            'test_email' => 'required|email',
        ], [
            'test_email.required' => trans('translate.Email is required'),
            'test_email.email' => trans('translate.Please enter a valid email address'),
        ]);

        try {
            EmailHelper::mail_setup();

            $appName = config('app.name', 'Nectar');
            $testSubject = 'SMTP Test Email - ' . $appName;
            $testMessage = '<div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 25px; border: 1px solid #e2e8f0; border-radius: 8px; background: #ffffff;">'
                . '<h2 style="color: #ff6b35; margin-top: 0;">' . htmlspecialchars($appName) . ' SMTP Email Test</h2>'
                . '<p style="color: #4a5568; font-size: 15px; line-height: 1.6;">Great news! Your SMTP configuration is working perfectly.</p>'
                . '<div style="background: #f7fafc; padding: 15px; border-radius: 6px; margin: 20px 0; border-left: 4px solid #38a169;">'
                . '<p style="margin: 0; color: #2d3748; font-size: 14px;"><strong>Status:</strong> Connected & Verified</p>'
                . '<p style="margin: 5px 0 0; color: #718096; font-size: 13px;">Timestamp: ' . now()->toDayDateTimeString() . '</p>'
                . '</div>'
                . '<p style="color: #a0aec0; font-size: 12px; margin-bottom: 0;">This is an automated test email sent from the ' . htmlspecialchars($appName) . ' Admin Panel.</p>'
                . '</div>';

            Mail::html($testMessage, function ($message) use ($request, $testSubject) {
                $message->to($request->test_email)
                    ->subject($testSubject);
            });

            $notify_message = trans('translate.Test email sent successfully to') . ' ' . $request->test_email;
            return redirect()->back()->with(['message' => $notify_message, 'alert-type' => 'success']);
        } catch (\Throwable $e) {
            $errorMessage = $e->getMessage();
            \Illuminate\Support\Facades\Log::error('SMTP Test email sending failed: ' . $errorMessage);
            $notify_message = trans('translate.Failed to send test email: ') . $errorMessage;
            return redirect()->back()->with(['message' => $notify_message, 'alert-type' => 'error']);
        }
    }
}
