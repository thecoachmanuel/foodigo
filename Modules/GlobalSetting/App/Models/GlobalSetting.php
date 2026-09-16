<?php

namespace Modules\GlobalSetting\App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\Cache;
use Modules\GlobalSetting\Database\factories\GlobalSettingFactory;

class GlobalSetting extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     */
    protected $fillable = ['key', 'value'];

    /**
     * The "booted" method of the model.
     */
    protected static function booted()
    {
        static::saved(function () {
            Cache::forget('setting');
            Cache::forget('global_settings');
        });

        static::deleted(function () {
            Cache::forget('setting');
            Cache::forget('global_settings');
        });
    }
}
