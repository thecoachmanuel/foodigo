<?php

namespace Modules\Order\App\Models;

use App\Models\DeliveryMan;
use App\Models\User;
use App\Models\UserAddress;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Modules\Order\Database\factories\OrderFactory;
use Modules\Restaurant\Entities\Restaurant;

class Order extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     */
    protected $fillable = [];

    protected $appends = ['special_instructions', 'delivery_man'];

    public function getSpecialInstructionsAttribute()
    {
        if (!empty($this->order_note)) {
            return $this->order_note;
        }
        if (!empty($this->delivery_address)) {
            $addr = is_string($this->delivery_address) ? json_decode($this->delivery_address, true) : (array) $this->delivery_address;
            return $addr['delivery_instructions'] ?? $addr['additional_notes'] ?? null;
        }
        return null;
    }

    public function restaurant(): BelongsTo
    {
        return $this->belongsTo(Restaurant::class);
    }

    public function address(): BelongsTo
    {
        return $this->belongsTo(UserAddress::class, 'address_id', 'id');
    }

    public function user(){
        return $this->belongsTo(User::class)->withDefault([
            'name' => $this->orderAddress?->billing_name ?? 'Guest'
        ]);
    }

    public function items(): HasMany
    {
        return $this->hasMany(OrderItem::class);
    }

    public function deliveryman(): BelongsTo
    {
        return $this->belongsTo(DeliveryMan::class, 'delivery_man_id', 'id');
    }

    public function deliveryMan(): BelongsTo
    {
        return $this->belongsTo(DeliveryMan::class, 'delivery_man_id', 'id');
    }

    public function getDeliveryManAttribute()
    {
        $man = $this->relationLoaded('deliveryMan') 
            ? $this->getRelation('deliveryMan') 
            : ($this->relationLoaded('deliveryman') ? $this->getRelation('deliveryman') : ($this->delivery_man_id ? $this->deliveryman()->first() : null));

        if (!$man) return null;

        $img = $man->profile_image ?: $man->man_image;
        $imageUrl = null;
        if ($img) {
            $imageUrl = (str_starts_with($img, 'http://') || str_starts_with($img, 'https://')) ? $img : asset($img);
        }

        return [
            'id' => $man->id,
            'name' => trim(($man->fname ?? '') . ' ' . ($man->lname ?? '')),
            'fname' => $man->fname,
            'lname' => $man->lname,
            'phone' => $man->phone,
            'email' => $man->email,
            'image' => $imageUrl,
            'vehicle_number' => $man->vehicle_number ?? null,
            'rating' => '4.8 (100+ deliveries)',
            'latitude' => $man->latitude,
            'longitude' => $man->longitude,
        ];
    }

    public function reviews(): HasMany
    {
        return $this->hasMany(\App\Models\Review::class, 'order_id');
    }
}
