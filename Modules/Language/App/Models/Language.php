<?php

namespace Modules\Language\App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\Cache;
use Modules\Language\Database\factories\LanguageFactory;

class Language extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     */
    protected $fillable = [
        'lang_name',
        'lang_code',
        'lang_direction',
        'status',
        'is_default'
    ];

    /**
     * The "booted" method of the model.
     */
    protected static function booted()
    {
        static::saved(function () {
            Cache::forget('languages');
            Cache::forget('default_language');
        });

        static::deleted(function () {
            Cache::forget('languages');
            Cache::forget('default_language');
        });
    }
}
