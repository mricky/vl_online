<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;


class StockOpnameDetail extends Model {

    protected $fillable = [
        'stock_opname_id',
        'product_location_id',
        'qty_onhand',
        'qty_actual',
        'qty_difference',
        'adjust_cost',
    ];

    
    public static function boot(){
        parent::boot();

        self::creating(function ($m){
          
        });
    }

    public function opname(){
        return $this->belongsTo(StockOpname::class, 'stock_opname_id'); 
    }
}