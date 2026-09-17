<?php

namespace Modules\Restaurant\Entities;

use App\Models\Review;
use Modules\City\Entities\City;
use App\Models\RestaurantWishlist;
use Illuminate\Database\Eloquent\Model;
use Modules\Product\App\Models\Product;
use App\Models\Scopes\RestaurantLocationScope;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;

class Restaurant extends Authenticatable
{
    use HasFactory, HasApiTokens;

    protected $guarded = ['id'];

    protected $hidden = [
        'password',
        'remember_token',
        'forget_password_token',
    ];

    public function getRememberTokenName()
    {
        return 'remember_token';
    }

    public function city(){
        return $this->belongsTo(City::class);
    }

    public function products(): HasMany
    {
        return $this->hasMany(Product::class);
    }

    public function reviews(): HasMany
    {
        return $this->hasMany(Review::class)->where(function($q) {
            $q->where('status', 1)->orWhere('status', 'active');
        });
    }

    public function wishlist(): HasMany
    {
        return $this->hasMany(RestaurantWishlist::class);
    }

    public function getReviewsAvgRatingAttribute()
    {
        if (array_key_exists('reviews_avg_rating', $this->attributes) && !is_null($this->attributes['reviews_avg_rating'])) {
            return (float) $this->attributes['reviews_avg_rating'];
        }
        return (float) ($this->reviews()->avg('rating') ?: 0);
    }

    public function getReviewsCountAttribute()
    {
        if (array_key_exists('reviews_count', $this->attributes) && !is_null($this->attributes['reviews_count'])) {
            return (int) $this->attributes['reviews_count'];
        }
        return (int) $this->reviews()->count();
    }

    protected static function booted()
    {
        static::addGlobalScope(new RestaurantLocationScope);
    }
    
}
