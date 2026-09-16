@extends('admin.master_layout')
@section('title')
    <title>{{ __('translate.Email Configuration') }}</title>
@endsection

@section('body-header')
    <h3 class="crancy-header__title m-0">{{ __('translate.Email Configuration') }}</h3>
    <p class="crancy-header__text">{{ __('translate.Dashboard') }} >> {{ __('translate.Email Configuration') }}</p>
@endsection

@section('body-content')
    <!-- crancy Dashboard -->
    <section class="crancy-adashboard crancy-show">
        <div class="container container__bscreen">
            <div class="row">
                <div class="col-12">
                    <div class="crancy-body">
                        <!-- Dashboard Inner -->
                        <div class="crancy-dsinner">
                            <div class="row">
                                <div class="col-lg-8 col-12 mg-top-30">
                                    <form action="{{ route('admin.update-email-setting') }}" enctype="multipart/form-data" method="POST">
                                        @csrf
                                        @method('PUT')
                                        <!-- Product Card -->
                                        <div class="crancy-product-card">
                                            <h4 class="crancy-product-card__title">{{ __('translate.Email Configuration') }}</h4>

                                            <div class="row">

                                                <div class="col-12">
                                                    <div class="crancy__item-form--group mg-top-form-20">
                                                        <label class="crancy__item-label">{{ __('translate.Sender Name') }} </label>
                                                        <input class="crancy__item-input" type="text" name="sender_name" value="{{ $email_setting->sender_name }}" placeholder="e.g. Nectar">
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <div class="crancy__item-form--group mg-top-form-20">
                                                        <label class="crancy__item-label">{{ __('translate.Mail Host') }} </label>
                                                        <input class="crancy__item-input" type="text" name="mail_host" value="{{ $email_setting->mail_host }}" placeholder="e.g. smtp.gmail.com">
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <div class="crancy__item-form--group mg-top-form-20">
                                                        <label class="crancy__item-label">{{ __('translate.Email') }} ({{ __('translate.Sender Address') }}) </label>
                                                        <input class="crancy__item-input" type="text" name="email" value="{{ $email_setting->email }}" placeholder="e.g. info@yourdomain.com or yourname@gmail.com">
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <div class="crancy__item-form--group mg-top-form-20">
                                                        <label class="crancy__item-label">{{ __('translate.SMTP User Name') }} </label>
                                                        <input class="crancy__item-input" type="text" name="smtp_username" value="{{ $email_setting->smtp_username }}" placeholder="e.g. yourname@gmail.com">
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <div class="crancy__item-form--group mg-top-form-20">
                                                        <label class="crancy__item-label">{{ __('translate.SMTP Password') }} / API Key </label>
                                                        <input class="crancy__item-input" type="password" name="smtp_password" id="smtp_password" value="{{ $email_setting->smtp_password }}" placeholder="Google App Password or Provider API Key">
                                                        <small class="text-muted" style="font-size: 12px; margin-top: 5px; display: block;">
                                                            <strong>Google:</strong> 16-char App Password &bull; 
                                                            <strong>Resend:</strong> API Key (re_...) &bull; 
                                                            <strong>SendGrid:</strong> API Key (SG....) &bull; 
                                                            <strong>Brevo:</strong> SMTP Key
                                                        </small>
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <div class="crancy__item-form--group mg-top-form-20">
                                                        <label class="crancy__item-label">{{ __('translate.Mail Port') }} </label>
                                                        <input class="crancy__item-input" type="text" name="mail_port" id="mail_port" value="{{ $email_setting->mail_port }}" placeholder="587, 465, or 2525">
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <div class="crancy__item-form--group mg-top-form-20">
                                                        <label class="crancy__item-label">{{ __('translate.Mail Encryption') }} </label>
                                                        <select class="form-select crancy__item-input" name="mail_encryption" id="mail_encryption">
                                                            <option {{ $email_setting->mail_encryption == 'tls' ? 'selected' : '' }} value="tls">{{ __('translate.TLS') }} (Port 587 or 2525)</option>
                                                            <option {{ $email_setting->mail_encryption == 'ssl' ? 'selected' : '' }} value="ssl">{{ __('translate.SSL') }} (Port 465)</option>
                                                            <option {{ $email_setting->mail_encryption == 'none' || empty($email_setting->mail_encryption) ? 'selected' : '' }} value="none">{{ __('translate.None') }} (Port 25 or Unencrypted)</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>

                                            <button class="crancy-btn mg-top-25" type="submit">{{ __('translate.Update') }}</button>

                                        </div>
                                        <!-- End Product Card -->
                                    </form>
                                </div>

                                <div class="col-lg-4 col-12 mg-top-30">
                                    <!-- Test Email Card -->
                                    <div class="crancy-product-card mb-4">
                                        <h4 class="crancy-product-card__title">Test Email Delivery</h4>
                                        <p style="font-size: 13px; color: #64748b; margin-bottom: 15px;">Send a test email to verify that your SMTP credentials and mail server connection are working properly.</p>

                                        <form action="{{ route('admin.send-test-email') }}" method="POST">
                                            @csrf
                                            <div class="crancy__item-form--group mg-top-form-10">
                                                <label class="crancy__item-label">Recipient Email</label>
                                                <input class="crancy__item-input" type="email" name="test_email" required placeholder="your.email@example.com">
                                            </div>

                                            <button class="crancy-btn mg-top-20 w-100" type="submit" style="background-color: #ff6b35; border-color: #ff6b35;">
                                                <i class="fa-solid fa-paper-plane me-2"></i> Send Test Email
                                            </button>
                                        </form>
                                    </div>

                                    <!-- Quick Preset & Provider Guide Card -->
                                    <div class="crancy-product-card" style="background: #ffffff; border: 1px solid #e2e8f0;">
                                        <h5 style="font-size: 15px; font-weight: 600; color: #1e293b; margin-bottom: 12px;">
                                            <i class="fa-solid fa-wand-magic-sparkles me-2" style="color: #ff6b35;"></i> Quick Provider Setup
                                        </h5>
                                        <p style="font-size: 12px; color: #64748b; margin-bottom: 12px;">Click a provider below to quickly auto-fill standard host & port settings:</p>
                                        
                                        <div class="d-flex flex-wrap gap-2 mb-3">
                                            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="applyPreset('google')" style="font-size: 11px; border-radius: 6px; padding: 4px 8px;">
                                                <i class="fa-brands fa-google text-danger me-1"></i> Google
                                            </button>
                                            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="applyPreset('resend')" style="font-size: 11px; border-radius: 6px; padding: 4px 8px;">
                                                <i class="fa-solid fa-paper-plane text-dark me-1"></i> Resend
                                            </button>
                                            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="applyPreset('sendgrid')" style="font-size: 11px; border-radius: 6px; padding: 4px 8px;">
                                                <i class="fa-solid fa-envelope text-primary me-1"></i> SendGrid
                                            </button>
                                            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="applyPreset('brevo')" style="font-size: 11px; border-radius: 6px; padding: 4px 8px;">
                                                <i class="fa-solid fa-bolt text-success me-1"></i> Brevo
                                            </button>
                                            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="applyPreset('mailgun')" style="font-size: 11px; border-radius: 6px; padding: 4px 8px;">
                                                <i class="fa-solid fa-shield text-danger me-1"></i> Mailgun
                                            </button>
                                        </div>

                                        <div style="font-size: 12px; color: #475569; line-height: 1.5; background: #f8fafc; padding: 10px; border-radius: 6px; border: 1px solid #edf2f7;">
                                            <div class="mb-2">
                                                <strong style="color: #0f172a;"><i class="fa-brands fa-google text-danger me-1"></i> Google:</strong> Host <code>smtp.gmail.com</code>, Port <code>587</code> (TLS) or <code>465</code> (SSL), User = full gmail, Password = 16-char App Password.
                                            </div>
                                            <div class="mb-2">
                                                <strong style="color: #0f172a;"><i class="fa-solid fa-paper-plane text-dark me-1"></i> Resend:</strong> Host <code>smtp.resend.com</code>, Port <code>465</code> (SSL) or <code>587</code>, User = <code>resend</code>, Password = API Key (re_...).
                                            </div>
                                            <div class="mb-2">
                                                <strong style="color: #0f172a;"><i class="fa-solid fa-envelope text-primary me-1"></i> SendGrid:</strong> Host <code>smtp.sendgrid.net</code>, Port <code>587</code>, User = <code>apikey</code>, Password = API Key (SG....).
                                            </div>
                                            <div>
                                                <strong style="color: #0f172a;"><i class="fa-solid fa-bolt text-success me-1"></i> Brevo:</strong> Host <code>smtp-relay.brevo.com</code>, Port <code>587</code>, User = login email, Password = SMTP key.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Dashboard Inner -->
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- End crancy Dashboard -->
@endsection

@push('js_section')
<script>
function applyPreset(provider) {
    const hostInput = document.querySelector('input[name="mail_host"]');
    const portInput = document.getElementById('mail_port');
    const encSelect = document.getElementById('mail_encryption');
    const userInput = document.querySelector('input[name="smtp_username"]');

    if (provider === 'google') {
        hostInput.value = 'smtp.gmail.com';
        portInput.value = '587';
        encSelect.value = 'tls';
    } else if (provider === 'resend') {
        hostInput.value = 'smtp.resend.com';
        portInput.value = '465';
        encSelect.value = 'ssl';
        if (!userInput.value || userInput.value.includes('@')) userInput.value = 'resend';
    } else if (provider === 'sendgrid') {
        hostInput.value = 'smtp.sendgrid.net';
        portInput.value = '587';
        encSelect.value = 'tls';
        if (!userInput.value || userInput.value.includes('@')) userInput.value = 'apikey';
    } else if (provider === 'brevo') {
        hostInput.value = 'smtp-relay.brevo.com';
        portInput.value = '587';
        encSelect.value = 'tls';
    } else if (provider === 'mailgun') {
        hostInput.value = 'smtp.mailgun.org';
        portInput.value = '587';
        encSelect.value = 'tls';
    }
}
</script>
@endpush
