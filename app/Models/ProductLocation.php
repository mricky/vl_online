<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductLocation extends Model
{
    
    protected $fillable = [
        'product_id',
        'good_receipt_id',
        'wh_location_id',
        'qty_onhand',
        'product_price',
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
