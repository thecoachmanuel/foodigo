<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Modules\Order\App\Models\Order;

class OrderDeliveryManRejection extends Model
{
    use HasFactory;

    protected $table = 'order_delivery_man_rejections';

    protected $fillable = [
        'order_id',
        'delivery_man_id',
        'reason',
    ];

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }

    public function deliveryMan()
    {
        return $this->belongsTo(DeliveryMan::class, 'delivery_man_id');
    }
}
