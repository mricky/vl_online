<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SalesOrderDetail extends Model
{
   protected $fillable = [
        'sales_order_id',
        'order_date',
        'qty',
        'product_id',
        'product_location_id',
        'lot_number',
        'price',
        'total',
        'created_by'
   ];

   
}
