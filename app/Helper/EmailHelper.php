<?php

namespace App\Helper;

use Modules\EmailSetting\App\Models\EmailSetting;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Log;

class EmailHelper{

    public static function mail_setup(){

        try {
            $setting_data = EmailSetting::all();

            $email_setting = array();

            foreach($setting_data as $data_item){
                $email_setting[$data_item->key] = $data_item->value;
            }

            $email_setting = (object) $email_setting;

            $host = trim($email_setting->mail_host ?? '');
            $port = intval(trim($email_setting->mail_port ?? '587'));
            
            $encryption = strtolower(trim($email_setting->mail_encryption ?? 'tls'));
            if ($encryption === 'null' || $encryption === 'none' || empty($encryption)) {
                $encryption = null;
            }

            $username = trim($email_setting->smtp_username ?? '');
            $password = trim($email_setting->smtp_password ?? '');
            
            // If user copied a Google App Password with spaces (e.g. "abcd efgh ijkl mnop"), strip spaces
            if (!empty($password) && (str_contains(strtolower($host), 'gmail.com') || str_contains(strtolower($host), 'googlemail.com') || strlen(str_replace(' ', '', $password)) === 16)) {
                $password = str_replace(' ', '', $password);
            }

            $senderEmail = trim($email_setting->email ?? '');
            if (empty($senderEmail)) {
                $senderEmail = $username;
            }
            $senderName = trim($email_setting->sender_name ?? config('app.name', 'Nectar'));

            // Set scheme explicitly for Symfony Mailer Dsn
            $scheme = null;
            if ($encryption === 'ssl' || $port === 465) {
                $scheme = 'smtps';
                $encryption = 'ssl';
            } elseif ($encryption === 'tls' || $port === 587 || $port === 2525) {
                $scheme = 'smtp';
                $encryption = 'tls';
            } else {
                $scheme = 'smtp';
                $encryption = null;
            }

            $setting = [
                'transport' => 'smtp',
                'scheme' => $scheme,
                'host' => $host,
                'port' => $port,
                'encryption' => $encryption,
                'username' => $username,
                'password' => $password,
                'timeout' => 4,
                'local_domain' => env('MAIL_EHLO_DOMAIN'),
                'source_ip' => '0.0.0.0',
            ];

            config(['mail.default' => 'smtp']);
            config(['mail.mailers.smtp' => $setting]);
            config(['mail.from.address' => $senderEmail]);
            config(['mail.from.name' => $senderName]);

            // Purge cached mailer instances in Laravel Symfony transport
            try {
                Mail::purge('smtp');
                Mail::purge();
            } catch (\Throwable $e) {}

        } catch (\Throwable $th) {
            Log::warning('EmailHelper mail_setup error: ' . $th->getMessage());
        }
    }
}
