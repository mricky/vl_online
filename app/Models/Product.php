<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'vendor_id',
        'code',
        'name',
        'is_track_lot_number',
        'category_id',
        'brand_id',
        'product_cost',
        'product_price',
        'qty_onhand',
        'qty_allocated',
        'qty_received',
        'qty_shipped',
        'description',
        'is_store_vendor_location'
    ];

    
}
