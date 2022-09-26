<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GoodReceiptDetail extends Model
{
    
    protected $table = 'goods_receipt_details';

    protected $fillable = [
        'good_receipt_id',
        'product_id',
        'lot_number',
        'qty_demand',
        'qty_in',
        'qty_diferrence',
        'wh_location_id',
        'price',
        'is_store_vendor_location'
    ];

    public static function boot(){
        parent::boot();

        self::creating(function ($m){
          
        });
    }
    
}
