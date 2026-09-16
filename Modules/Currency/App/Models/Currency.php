<?php

namespace Modules\Currency\App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\Cache;
use Modules\Currency\Database\factories\CurrencyFactory;

class Currency extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     */
    protected $fillable = [
        'currency_name',
        'currency_code',
        'country_code',
        'currency_icon',
        'is_default',
        'currency_rate',
        'currency_position',
        'status'
    ];

    /**
     * The "booted" method of the model.
     */
    protected static function booted()
    {
        static::saved(function () {
            Cache::forget('currencies');
            Cache::forget('default_currency');
        });

        static::deleted(function () {
            Cache::forget('currencies');
            Cache::forget('default_currency');
        });
    }
}
