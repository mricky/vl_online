<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PurchaseOrder extends Model
{
    protected $fillable = [
        'vendor_id',
        'order_number',
        'order_date',
        'estimated_date',
        'order_status',
        'subtotal',
        'discount',
        'total',
        'total_amount',
        'description'
    ];


    public function details(){
        return $this->hasMany(PurchaseOrderDetail::class,'purchase_order_id');
    }

}
