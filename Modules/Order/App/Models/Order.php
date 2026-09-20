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

    protected $appends = ['special_instructions'];

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
        return $this->belongsTo(User::class) ->withDefault([
            'name' => $this->orderAddress?->billing_name ?? 'Guest'
        ]);
    }

    public function items(): HasMany
    {
        return $this->hasMany(OrderItem::class);
    }

    public function deliveryman(){
        return $this->belongsTo(DeliveryMan::class, 'delivery_man_id', 'id');
    }

    public function reviews(): HasMany
    {
        return $this->hasMany(\App\Models\Review::class, 'order_id');
    }
}
