<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class StockOpname extends Model {

    protected $table = 'stock_opnames';

    
    protected $fillable = [
        'wh_location_id',
        'opname_number',
        'opname_date',
        'opname_type_id',
        'total_onhand',
        'total_actual',
        'total_difference',
        'document',
    
    ];

    public static function boot(){
        parent::boot();

        self::creating(function ($m){
          
        });
    }

    public function details(){
        return $this->hasMany(StockOpnameDetail::class,'stock_opname_id');
    }
}