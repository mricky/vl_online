<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SalesOrder extends Model
{
    protected $fillable = [
        'customer_id',
        'order_number',
        'order_date',
        'expedition_id',
        'order_status_id',
        'subtotal',
        'discount',
        'expedition_cost',
        'total',
        'total_amount',
        'customer_receive_date',
        'description',
        'delivery_order',
        'notes',
        'customer_receive_image',
        'created_by'
    ];

    public function details(){
        return $this->hasMany(SalesOrderDetail::class,'sales_order_id');
    }
    //
}
