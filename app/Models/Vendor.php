<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Vendor extends Model
{
    protected $fillable = [
        'code',
        'name',
        'address',
        'phone',
        'facebook',
        'instagram',
        'description'
    ];
    
    public function purchase(){
        return $this->belongsTo(PurchaseOrder::class, 'vendor_id'); 
    }
}
