<?php

namespace App\Http\Middleware;

use Closure;
use Session, Config;
use Illuminate\Http\Request;
use Modules\Currency\App\Models\Currency;
use Modules\Language\App\Models\Language;
use Symfony\Component\HttpFoundation\Response;

class LangSession
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
       // Set language session if not already set or if session language is invalid
        if (!Session::has('front_lang') || !Language::where('lang_code', Session::get('front_lang'))->exists()) {
            $default_lang = Language::find(1);

            Session::put('front_lang', $default_lang?->lang_code ?? 'en');
            Session::put('lang_dir', $default_lang?->lang_direction ?? 'left_to_right');
            Session::put('front_lang_name', $default_lang?->lang_name ?? 'English');
        }

        // Set app locale
        app()->setLocale(Session::get('front_lang'));

        // Set currency session if not set or sync with latest admin database settings
        $currentCode = Session::get('currency_code');
        $activeCurrency = null;
        if ($currentCode) {
            $activeCurrency = Currency::where('currency_code', $currentCode)->where('status', 'active')->first();
        }

        if (!$activeCurrency) {
            $activeCurrency = Currency::where('is_default', 'yes')->where('status', 'active')->first()
                                ?? Currency::where('currency_code', 'NGN')->where('status', 'active')->first()
                                ?? Currency::where('status', 'active')->first()
                                ?? Currency::first();
        }

        if ($activeCurrency) {
            Session::put('currency_name', $activeCurrency->currency_name);
            Session::put('currency_code', $activeCurrency->currency_code);
            Session::put('currency_icon', $activeCurrency->currency_icon ?: '₦');
            Session::put('currency_rate', $activeCurrency->currency_rate ?: 1);
            Session::put('currency_position', $activeCurrency->currency_position ?: 'before_price');
        }

        return $next($request);
    }
}
