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
        try {
            if (!empty($this->order_note)) {
                return $this->order_note;
            }
            if (!empty($this->delivery_address)) {
                $addr = is_string($this->delivery_address) ? json_decode($this->delivery_address, true) : (array) $this->delivery_address;
                return $addr['delivery_instructions'] ?? $addr['additional_notes'] ?? null;
            }
            return null;
        } catch (\Throwable $e) {
            return null;
        }
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

        public function getDeliveryManAttribute()
    {
        try {
            $man = $this->relationLoaded('deliveryman') 
                ? $this->getRelation('deliveryman') 
                : ($this->delivery_man_id ? $this->deliveryman()->first() : null);

            if (!$man) return null;
            if (is_array($man)) return $man;

            $img = $man->profile_image ?? $man->man_image ?? null;
            $imageUrl = null;
            if ($img) {
                $imageUrl = (str_starts_with($img, 'http://') || str_starts_with($img, 'https://')) ? $img : asset($img);
            }

            return [
                'id' => $man->id ?? null,
                'name' => trim(($man->fname ?? '') . ' ' . ($man->lname ?? '')),
                'fname' => $man->fname ?? '',
                'lname' => $man->lname ?? '',
                'phone' => $man->phone ?? '',
                'email' => $man->email ?? '',
                'image' => $imageUrl,
                'vehicle_number' => $man->vehicle_number ?? null,
                'rating' => '4.8 (100+ deliveries)',
                'latitude' => $man->latitude ?? null,
                'longitude' => $man->longitude ?? null,
            ];
        } catch (\Throwable $e) {
            return null;
        }
    }

    public function reviews(): HasMany
    {
        return $this->hasMany(\App\Models\Review::class, 'order_id');
    }

    public function rejections(): HasMany
    {
        return $this->hasMany(\App\Models\OrderDeliveryManRejection::class, 'order_id');
    }

    public function getDeliveryCoordinatesAttribute()
    {
        try {
            $lat = null;
            $lng = null;
            $addrText = '';

            if ($this->address) {
                $lat = $this->address->lat ?? $this->address->latitude ?? null;
                $lng = $this->address->lon ?? $this->address->lng ?? $this->address->longitude ?? null;
                $addrText = $this->address->address ?? '';
            }

            if ((!$lat || !$lng) && !empty($this->delivery_address)) {
                $raw = is_string($this->delivery_address) ? json_decode($this->delivery_address, true) : (array)$this->delivery_address;
                if (is_array($raw)) {
                    $lat = $raw['lat'] ?? $raw['latitude'] ?? null;
                    $lng = $raw['lon'] ?? $raw['lng'] ?? $raw['longitude'] ?? null;
                    $addrText = $raw['address'] ?? ($raw['delivery_address'] ?? $addrText);
                }
            }

            if ($lat !== null && $lng !== null && ((float)$lat != 0 || (float)$lng != 0)) {
                return [
                    'latitude'  => (float)$lat,
                    'longitude' => (float)$lng,
                    'lat'       => (float)$lat,
                    'lng'       => (float)$lng,
                    'address'   => (string)$addrText,
                ];
            }

            return null;
        } catch (\Throwable $e) {
            return null;
        }
    }

    public function getPickupCoordinatesAttribute()
    {
        try {
            $rest = $this->relationLoaded('restaurant') ? $this->getRelation('restaurant') : $this->restaurant()->first();
            if ($rest) {
                $lat = $rest->latitude ?? null;
                $lng = $rest->longitude ?? null;
                if ($lat !== null && $lng !== null && ((float)$lat != 0 || (float)$lng != 0)) {
                    return [
                        'latitude'  => (float)$lat,
                        'longitude' => (float)$lng,
                        'lat'       => (float)$lat,
                        'lng'       => (float)$lng,
                        'name'      => (string)($rest->name ?? ''),
                        'address'   => (string)($rest->address ?? ''),
                        'phone'     => (string)($rest->phone ?? ''),
                    ];
                }
            }
            return null;
        } catch (\Throwable $e) {
            return null;
        }
    }

    public function scopeAvailableForDeliveryMan($query, $deliveryManId = null)
    {
        $query->where('order_request', 1)
              ->where(function ($q) {
                  $q->whereNull('delivery_man_id')->orWhere('delivery_man_id', 0);
              })
              ->whereNotIn('order_status', [5, 6, '5', '6', 'delivered', 'declined', 'cancelled']);

        if ($deliveryManId) {
            $query->whereDoesntHave('rejections', function ($q) use ($deliveryManId) {
                $q->where('delivery_man_id', $deliveryManId);
            });
        }

        return $query;
    }
}
