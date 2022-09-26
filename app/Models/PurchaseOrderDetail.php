<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PurchaseOrderDetail extends Model
{
    
    protected $fillable = [
        'puchase_order_id',
        'qty',
        'product_id',
        'price',
        'subtotal',
        'downpayment',
        'paid_off',
        'total'
    ];
    
    public function purchase(){
        return $this->belongsTo(PurchaseOrder::class,'purchase_order_id');
    }
}
