<?php
namespace App\Repositories;
use DB;

interface IGoodReceipt{

    public function updateDetailGoodReceipt($goodReceiptId);
}

class GoodReceiptRepository implements IGoodReceipt {

    public function updateDetailGoodReceipt($goodReceiptId)
    {
        try {

          DB::beginTransaction();

          $goodReceipt = DB::table('goods_receipt')->where('id',$goodReceiptId)->first();


          $goodReceiptDetail = DB::table('goods_receipt_details')->where('good_receipt_id',$goodReceiptId)->get();

          foreach ($goodReceiptDetail as $value){
               DB::table('products')->where('id',$value->product_id)
                         ->update([
                                'vendor_id' => $goodReceipt->vendor_id,
                                'qty_onhand' =>  $value->qty_in,
                                'product_price' => $value->price,    
                                'updated_at' => now()
                     ]);
                
          }   

          DB::commit();
        } catch(\Exception $e){
            DB::rollback();
            throw $e;
        }
    }

}