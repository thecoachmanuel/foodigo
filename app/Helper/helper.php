<?php

use App\Models\Offer;
use Twilio\Rest\Client;
use App\Models\OfferProduct;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use Modules\SmsSetting\App\Models\SmsSetting;

function admin_lang(){
    return 'en';
}

function front_lang() {
    try {
        return session()->has('front_lang') ? session('front_lang') : 'en';
    } catch (Exception $e) {
        return 'en';
    }
}



function html_decode($text){
    if ($text === null) {
        return '';
    }
    $decode_text = htmlspecialchars_decode((string)$text, ENT_QUOTES);
    return $decode_text;
}

function amount($amount) {
    $amount = number_format($amount, 2, '.', ',');

    return $amount;
}


function currency($price){
    $currency_icon = Session::get('currency_icon');
    $currency_rate = Session::get('currency_rate');
    $currency_position = Session::get('currency_position');

    if (!$currency_icon || !$currency_rate) {
        $default_currency = \Modules\Currency\App\Models\Currency::where('is_default', 'yes')->where('status', 'active')->first()
            ?? \Modules\Currency\App\Models\Currency::where('currency_code', 'NGN')->first()
            ?? \Modules\Currency\App\Models\Currency::where('status', 'active')->first()
            ?? \Modules\Currency\App\Models\Currency::first();

        if ($default_currency) {
            $currency_icon = $default_currency->currency_icon ?: '₦';
            $currency_rate = $default_currency->currency_rate ?: 1;
            $currency_position = $default_currency->currency_position ?: 'before_price';

            try {
                Session::put('currency_name', $default_currency->currency_name);
                Session::put('currency_code', $default_currency->currency_code);
                Session::put('currency_icon', $currency_icon);
                Session::put('currency_rate', $currency_rate);
                Session::put('currency_position', $currency_position);
            } catch (\Throwable $e) {}
        } else {
            $currency_icon = '₦';
            $currency_rate = 1;
            $currency_position = 'before_price';
        }
    }

    $price = (float)$price * (float)$currency_rate;
    $price = amount($price);

    if($currency_position == 'before_price'){
        $price = $currency_icon.$price;
    }elseif($currency_position == 'before_price_with_space'){
        $price = $currency_icon.' '.$price;
    }elseif($currency_position == 'after_price'){
        $price = $price.$currency_icon;
    }elseif($currency_position == 'after_price_with_space'){
        $price = $price.' '.$currency_icon;
    }else{
        $price = $currency_icon.$price;
    }

    return $price;
}


function check_icon(){
    return asset('frontend/assets/images/icon/check.png');
}

function spinner_icon(){
    return asset('frontend/assets/images/icon/Button.png');
}

function default_avatar_url(){
    try {
        $general_setting = cache()->get('setting');
        if (!empty($general_setting?->default_avatar) && file_exists(public_path($general_setting->default_avatar))) {
            return asset($general_setting->default_avatar);
        }
        if (file_exists(public_path('uploads/website-images/avatar-image-2025-05-10-03-46-26-6233.png'))) {
            return asset('uploads/website-images/avatar-image-2025-05-10-03-46-26-6233.png');
        }
        if (file_exists(public_path('uploads/website-images/default-avatar.png'))) {
            return asset('uploads/website-images/default-avatar.png');
        }
    } catch (\Throwable $e) {}
    return 'https://ui-avatars.com/api/?name=User&background=FE5200&color=fff&size=200';
}

function get_user_avatar($user = null){
    if (!$user) {
        $user = auth()->user();
    }
    if ($user) {
        if (!empty($user->image)) {
            if (str_starts_with($user->image, 'http://') || str_starts_with($user->image, 'https://')) {
                return $user->image;
            }
            if (file_exists(public_path($user->image))) {
                return asset($user->image);
            }
        }
        $name = !empty($user->name) ? urlencode($user->name) : 'User';
        $default = default_avatar_url();
        if ($default && !str_contains($default, 'ui-avatars.com')) {
            return $default;
        }
        return "https://ui-avatars.com/api/?name={$name}&background=FE5200&color=fff&size=200";
    }
    return default_avatar_url();
}

function getAllResourceFiles($dir, &$results = array()) {
    $files = scandir($dir);
    foreach ($files as $key => $value) {
        $path = $dir ."/". $value;
        if (!is_dir($path)) {
            $results[] = $path;
        } else if ($value != "." && $value != "..") {
            getAllResourceFiles($path, $results);
        }
    }
    return $results;
}

function getRegexBetween($content) {

    preg_match_all("%\{{ __\(['|\"](.*?)['\"]\) }}%i", $content, $matches1, PREG_PATTERN_ORDER);
    preg_match_all("%\{{__\(['|\"](.*?)['\"]\)}}%i", $content, $matches1_1, PREG_PATTERN_ORDER);
    preg_match_all("%\@lang\(['|\"](.*?)['\"]\)%i", $content, $matches2, PREG_PATTERN_ORDER);
    preg_match_all("%trans\(['|\"](.*?)['\"]\)%i", $content, $matches3, PREG_PATTERN_ORDER);
    $Alldata = [$matches1[1], $matches1_1[1], $matches2[1], $matches3[1]];
    $data = [];
    foreach ($Alldata as  $value) {
        if(!empty($value)){
            foreach ($value as $val) {
                $data[$val] = $val;
            }
        }
    }
    return $data;
}

function generateLang($path = ''){

    // user panel
    $paths = getAllResourceFiles(resource_path('views'));

    $paths = array_merge($paths, getAllResourceFiles(app_path()));

    $paths = array_merge($paths, getAllResourceFiles(base_path('Modules')));

    // end user panel

    $AllData= [];
    foreach ($paths as $key => $path) {
    $AllData[] = getRegexBetween(file_get_contents($path));
    }
    $modifiedData = [];
    foreach ($AllData as  $value) {
        if(!empty($value)){
            foreach ($value as $val) {
                $modifiedData[$val] = $val;
            }
        }
    }

    $modifiedData = var_export($modifiedData, true);

    file_put_contents('lang/en/translate.php', "<?php\n return {$modifiedData};\n ?>");

}

function calculateFinalPrice($product, $price = 0)
{
    if($price == 0){
        $price = $product->offer_price > 0 ? $product->offer_price : $product->price;
    }else{
        $price = $price;
    }

    $isOfferSale = OfferProduct::where([
        "product_id" => $product->id,
        "status" => 1,
    ])->first();

    $today = date("Y-m-d H:i:s");
    if ($isOfferSale) {
        $offer = Offer::first();
        if ($offer && $offer->status == 1) {
            if ($today <= $offer->end_time) {
                $offerAmount = ($offer->offer / 100) * $price;
                $price -= $offerAmount;
            }
        }
    }

    return $price;
}



function sendMobileOTP($to_phone, $message) {
    $setting_data = SmsSetting::all();

    $sms_setting = array();

    foreach($setting_data as $data_item){
        $sms_setting[$data_item->key] = $data_item->value;
    }

    $sms_setting = (object) $sms_setting;

    if($sms_setting->twilio_status == 'active'){
        try{
            $account_sid = $sms_setting->twilio_sid;
            $auth_token = $sms_setting->twilio_auth_token;
            $twilio_number = $sms_setting->twilio_phone_number;
            $recipients = $sms_setting->default_phone_code.$to_phone;
            $client = new Client($account_sid, $auth_token);
            $client->messages->create($recipients,
                    ['from' => $twilio_number, 'body' => $message] );
        }catch(Exception $ex){
            Log::info('Twilio Failed:' . $ex->getMessage());
        }

    }

    if($sms_setting->biztech_status == 'active'){
        try{
            $apikey = $sms_setting->twilio_sid;
            $clientid = $sms_setting->twilio_sid;
            $senderid = $sms_setting->twilio_sid;
            $senderid = urlencode($senderid);
            $message = $message;
            $msg_type = true;  // true or false for unicode message
            $message  = urlencode($message);
            $mobilenumbers = $sms_setting->default_phone_code.$to_phone;//8801700000000 or 8801700000000,9100000000
            $url = "https://api.smsq.global/api/v2/SendSMS?ApiKey=$apikey&ClientId=$clientid&SenderId=$senderid&Message=$message&MobileNumbers=$mobilenumbers&Is_Unicode=$msg_type";
            $ch = curl_init();
            curl_setopt ($ch, CURLOPT_URL, $url);
            curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, 0);
            curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, 0);
            curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, 5);
            curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_NOBODY, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            $response = curl_exec($ch);
            $response = json_decode($response);

            Log::info('biztech success');

        }catch(Exception $ex){
            Log::info('Bizitech Failed:' . $ex->getMessage());
        }
    }


}

/**
 * Render dynamic menu by location
 */
function renderDynamicMenu($location, $options = [])
{
    $menuService = app(\Modules\Menu\Services\MenuService::class);
    return $menuService->renderMenu($location, $options);
}

/**
 * Get menu items by location
 */
function getMenuByLocation($location)
{
    $menuService = app(\Modules\Menu\Services\MenuService::class);
    return $menuService->getMenuByLocation($location);
}

/**
 * Get configured Google Maps API Key
 */
function google_map_key()
{
    return config('services.google.map_api') ?: env('MAP_API', '');
}

/**
 * Automatically resolve Nigerian coordinates from address string
 */
function resolve_nigerian_coordinates($address_text = '', $default_lat = 6.4281, $default_lng = 3.4219)
{
    if (empty($address_text)) {
        return ['latitude' => $default_lat, 'longitude' => $default_lng];
    }

    $lower = strtolower(trim((string)$address_text));

    $nigerian_map = [
        // Lagos
        'ikeja' => [6.6018, 3.3515],
        'allen' => [6.6006, 3.3548],
        'toyin' => [6.5956, 3.3544],
        'opebi' => [6.5925, 3.3625],
        'alausa' => [6.6194, 3.3582],
        'maryland' => [6.5744, 3.3678],
        'anthony' => [6.5614, 3.3705],
        'victoria island' => [6.4281, 3.4219],
        ' vi' => [6.4281, 3.4219],
        'vi ' => [6.4281, 3.4219],
        'lekki' => [6.4474, 3.4723],
        'admiralty' => [6.4502, 3.4680],
        'ikate' => [6.4410, 3.4980],
        'chevron' => [6.4350, 3.5400],
        'vgc' => [6.4330, 3.5650],
        'ajah' => [6.4698, 3.5852],
        'sangotedo' => [6.4710, 3.6300],
        'ikoyi' => [6.4549, 3.4346],
        'banana island' => [6.4678, 3.4565],
        'parkview' => [6.4520, 3.4470],
        'yaba' => [6.5095, 3.3711],
        'unilag' => [6.5160, 3.3990],
        'surulere' => [6.4969, 3.3515],
        'bode thomas' => [6.4950, 3.3560],
        'adeniran' => [6.4980, 3.3540],
        'ojuelegba' => [6.5140, 3.3610],
        'gbagada' => [6.5540, 3.3870],
        'ogudu' => [6.5760, 3.3890],
        'magodo' => [6.6180, 3.3760],
        'omole' => [6.6260, 3.3620],
        'ogba' => [6.6290, 3.3440],
        'berger' => [6.6430, 3.3680],
        'ojota' => [6.5820, 3.3820],
        'festac' => [6.4670, 3.2840],
        'amuwo' => [6.4640, 3.3120],
        'okota' => [6.4980, 3.3250],
        'ago palace' => [6.4950, 3.3180],
        'agege' => [6.6180, 3.3230],
        'egbeda' => [6.5970, 3.2920],
        'ikotun' => [6.5510, 3.2660],
        'iyana ipaja' => [6.6120, 3.2860],
        'ikorodu' => [6.6194, 3.5105],
        'lagos' => [6.4281, 3.4219],

        // Ibadan
        'bodija' => [7.4250, 3.9050],
        'ring road' => [7.3620, 3.8720],
        'challenge' => [7.3480, 3.8820],
        'dugbe' => [7.3880, 3.8810],
        'cocoa house' => [7.3872, 3.8825],
        'mokola' => [7.4040, 3.8860],
        'agodi' => [7.4120, 3.9140],
        'samonda' => [7.4260, 3.8890],
        'sango' => [7.4280, 3.8820],
        'ui ' => [7.4420, 3.9000],
        'ui,' => [7.4420, 3.9000],
        'university of ibadan' => [7.4420, 3.9000],
        'polytechnic' => [7.4390, 3.8740],
        'jericho' => [7.3910, 3.8640],
        'idi ishin' => [7.3980, 3.8550],
        'eleyele' => [7.4140, 3.8620],
        'akobo' => [7.4480, 3.9420],
        'iwo road' => [7.4090, 3.9490],
        'oluyole' => [7.3520, 3.8640],
        'apata' => [7.3620, 3.8320],
        'uch' => [7.4015, 3.9025],
        'ibadan' => [7.3775, 3.9470],

        // Abuja
        'wuse' => [9.0797, 7.4723],
        'maitama' => [9.0882, 7.4934],
        'garki' => [9.0340, 7.4890],
        'asokoro' => [9.0430, 7.5260],
        'gwarinpa' => [9.1080, 7.4080],
        'jabi' => [9.0720, 7.4240],
        'utako' => [9.0640, 7.4410],
        'guzape' => [9.0190, 7.5180],
        'kubwa' => [9.1550, 7.3380],
        'lugbe' => [8.9720, 7.3780],
        'abuja' => [9.0579, 7.4951],

        // Ogun
        'abeokuta' => [7.1475, 3.3619],
        'oke mosan' => [7.1260, 3.3980],
        'ibara' => [7.1510, 3.3420],
        'ota' => [6.6910, 3.2340],
        'mowe' => [6.8120, 3.4410],
        'ibafo' => [6.7450, 3.4210],

        // Port Harcourt
        'port harcourt' => [4.8156, 7.0498],
        'trans amadi' => [4.8080, 7.0380],
        'rumuokoro' => [4.8720, 6.9850],
        'choba' => [4.8980, 6.9180],
    ];

    foreach ($nigerian_map as $key => $coords) {
        if (str_contains($lower, $key)) {
            return ['latitude' => $coords[0], 'longitude' => $coords[1]];
        }
    }

    return ['latitude' => $default_lat, 'longitude' => $default_lng];
}


