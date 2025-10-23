<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductLocation extends Model
{
    
    protected $fillable = [
        'purchase_order_id',
        'vendor_id',
        'product_id',
        'good_receipt_id',
        'wh_location_id',
        'qty_request', // dasar permintaan awal
        'qty_onhand',
        'product_price',
        'total',
        'is_automatic',
        'description',
        'created_by'

    ];

    // product
    public function products(){
        return $this->hasMany(Product::class,'product_id');
    }
    // good_receive_id
    public function goodReceipts(){
        return $this->hasMany(GoodReceipt::class, 'good_receipt_id');
    }

    // wh_location_id
    public function whLocations(){
        return $this->hasMany(WhLocation::class, 'wh_location_id');
    }
    
}
