<?php

namespace App\Providers;

use View;
use Cache;
use Exception;
use Throwable;
use App\Models\Wishlist;
use Illuminate\Support\Facades\Log;
use Modules\Page\App\Models\Footer;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\ServiceProvider;
use Modules\Product\App\Models\Product;
use Modules\Currency\App\Models\Currency;
use Modules\Language\App\Models\Language;
use Modules\GlobalSetting\App\Models\GlobalSetting;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\Facades\URL;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->extend('translator', function ($translator, $app) {
            $customTranslator = new \App\Services\CustomTranslator(
                $app['translation.loader'],
                $app['config']['app.locale']
            );
            $customTranslator->setFallback($app['config']['app.fallback_locale']);
            return $customTranslator;
        });
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        if (config('app.env') === 'production' || str_contains(config('app.url', ''), 'https://') || request()->server('HTTP_X_FORWARDED_PROTO') === 'https') {
            URL::forceScheme('https');
        }

        try{
            $loadSettings = function () {
                $defaults = [
                    'logo' => 'uploads/website-images/logo-2025-04-29-08-20-19-6442.svg',
                    'favicon' => 'uploads/website-images/favicon-2025-04-29-08-20-19-6989.png',
                    'app_name' => 'Foodigo',
                    'app_version' => '1.0',
                    'contact_message_mail' => 'admin@gmail.com',
                    'timezone' => 'UTC',
                    'selected_theme' => 'theme_two',
                    'recaptcha_status' => '0',
                    'recaptcha_site_key' => '',
                    'tawk_chat_link' => 'https://embed.tawk.to/6aaa58bcd07e5e34429206af/1k2kml8a8',
                    'tawk_status' => '1',
                    'breadcrumb_image' => 'uploads/website-images/breadcrumb-2024-09-12-06-30-58-9583.png',
                    'not_found' => 'uploads/website-images/not-found-2024-09-12-06-30-58-9583.png',
                    'default_avatar' => 'uploads/website-images/default-avatar.png',
                    'placeholder_image' => 'uploads/website-images/placeholder.png',
                    'delivery_charge' => '0',
                    'admin_login' => 'uploads/website-images/admin-login.png',
                    'login_image_one' => 'uploads/website-images/login-image-one.png',
                    'login_title_one' => 'Welcome Back',
                    'login_description_one' => 'Sign in to your account',
                    'login_image_two' => 'uploads/website-images/login-image-two.png',
                ];

                try {
                    $setting_data = GlobalSetting::all();
                    $setting = [];
                    foreach ($setting_data as $data_item) {
                        $setting[$data_item->key] = $data_item->value;
                    }
                    $merged = array_merge($defaults, $setting);
                    return (object) $merged;
                } catch (\Throwable $e) {
                    return (object) $defaults;
                }
            };

            $setting = Cache::get('setting');
            if (!$setting || !is_object($setting) || empty($setting->favicon)) {
                $setting = $loadSettings();
                Cache::forever('setting', $setting);
            }

            View::composer('*', function($view) use ($loadSettings){

                $general_setting = Cache::get('setting');
                if (!$general_setting || !is_object($general_setting) || empty($general_setting->favicon)) {
                    $general_setting = $loadSettings();
                    Cache::forever('setting', $general_setting);
                }

                $language_list = Language::where('status', 1)->get();
                $currency_list = Currency::where('status', 'active')->get();

                $footer = Footer::first();

                if (Auth::guard('web')->check()) {
                    $userId = Auth::guard('web')->id();

                    $wishlistItems = Wishlist::where('user_id', $userId)->get();

                    $wishlist = $wishlistItems->map(function ($item) {
                        $product = Product::find($item->product_id);
                        return [
                            'wishlist_item' => $item,
                            'product' => $product,
                            'translated_name' => $product->name,
                            'item_id' => $product->id,
                        ];
                    });

                    $view->with('wishlist', $wishlist);
                } else {
                    $view->with('wishlist', collect());
                }





                $view->with('general_setting', $general_setting);
                $view->with('language_list', $language_list);
                $view->with('currency_list', $currency_list);
                $view->with('footer', $footer);

            });

            // Custom PWA Blade Directive
            Blade::directive('laravelPWA', function () {
                return '<?php echo view("pwa.meta")->render(); ?>';
            });



            // Helper function to get general settings
            if (!function_exists('getGeneralSetting')) {
                function getGeneralSetting($key = null) {
                    static $settings = null;

                    if ($settings === null) {
                        $settings = \Modules\GlobalSetting\App\Models\GlobalSetting::get()->keyBy('key');
                    }

                    if ($key === null) {
                        return $settings;
                    }

                    return $settings->get($key);
                }
            }

        }catch(Exception $ex){
            Log::info('AppServiceProvider : '. $ex->getMessage());

            Artisan::call('optimize:clear');
        }



    }
}
