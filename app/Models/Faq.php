<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Faq extends Model
{
    use HasFactory;

    protected $fillable = [
        'type',
        'question',
        'answer',
        'status',
        'serial',
    ];

    public function scopeUser($query)
    {
        return $query->where('type', 'user')->orWhereNull('type');
    }

    public function scopePartner($query)
    {
        return $query->where('type', 'partner');
    }
}
