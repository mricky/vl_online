<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Vendor;
use DB;

class GoodReceipt extends Model
{
    protected  $table = 'goods_receipt';

    protected $fillable = [
        'code',
        'backorder_of',
        'status_id',
        'vendor_id',
        'vendor_name',
        'purchase_order_id',
        'po_number',
        'receipt_date',
        'description',
        'created_by',
        'created_at',
        'updated_by',
        'updated_at'
    ];

    public static function boot(){
        parent::boot();

        self::creating(function ($m){
            $m->code = $m->generateIdNo();

        });

        self::created(function ($m){
            
        });

    }
    public function details(){
        return $this->hasMany(GoodReceiptDetail::class,'good_receipt_id');
    }

    public function deferences(){
        return $this->hasMany(GoodReceiptDetail::class,'good_receipt_id')
                        ->orWhere('qty_diferrence','>', 0);

    }
    public function generateIdNo(){
        $code = 'GR-';
        $supplier = Vendor::find($this->vendor_id);
      
        $sq =$this->max('id'); 
        $year = substr(date("y"),-2);
        $month = date("m");
        $no = str_pad($sq+1,4,"0",STR_PAD_LEFT);

        $receiptCode = $code.$supplier->code.$year.$month.$no;
        return $receiptCode;
    }
}
