<?php
namespace App\Repositories;
use App\Models\{
    PurchaseOrder,
    GoodReceipt,
    WhLocation,
    OrderStatus
};
use DB;
use CRUDBooster;

interface IGoodReceipt{
    public function automaticReceiptEntry($poId);
    public function updateDetailGoodReceipt($goodReceiptId);
    public function getTotalProcessReceipt();
    public function getTotalDoneReceipt();
}
class GoodReceiptRepository implements IGoodReceipt {
   
    CONST WH_LOCATION_DEFAULT = 'Partner Location/Vendor';
    CONST STATUS_DEFAULT = 'Process';
    CONST STATUS_DONE = 'Done';

    public function getTotalDoneReceipt(){
        $status = OrderStatus::where('name',$this::STATUS_DONE)->first();
        $receive = GoodReceipt::where('status_id',$status->id)->count();

        return $receive;
    }
    public function getTotalProcessReceipt(){
        $status = OrderStatus::where('name',$this::STATUS_DEFAULT)->first();
        $receive = GoodReceipt::where('status_id',$status->id)->count();

        return $receive;
    }
    public function automaticReceiptEntry($poId){

        $purchase = PurchaseOrder::with('details')->find($poId);
        $location = WhLocation::where('wh_location_name',$this::WH_LOCATION_DEFAULT)->first();
        $status = OrderStatus::where('name',$this::STATUS_DEFAULT)->first();
      
        try {
            DB::beginTransaction();

            $goodReceipt = new GoodReceipt();
            $goodReceipt->vendor_id = $purchase->vendor_id;
            $goodReceipt->purchase_order_id = $purchase->id;
            $goodReceipt->po_vendor = $purchase->order_number;
            $goodReceipt->receipt_date = $purchase->estimated_date; // estimate
            $goodReceipt->status_id = $status->id; // Process
            $goodReceipt->description = 'automatic';
            $goodReceipt->created_by = CRUDBooster::myId() ?? 1;
            $goodReceipt->save();

            $detail = $purchase->details->transform(function ($item) use ($goodReceipt,$location) {
                $item['good_receipt_id'] = $goodReceipt->id;
                $item['product_id'] = $item['product_id'];
                $item['lot_number'] = '-';
                $item['qty_demand'] = $item['qty'];
                $item['qty_in'] = 0;
                $item['qty_diferrence'] = 0;
                $item['price']  = $item['price'];
                $item['is_store_vendor_location'] = 1;
                $item['wh_location_id'] = $location->id;
                $item['created_by'] = CRUDBooster::myId() ?? 1;
                return $item;
            })->toArray();

            $goodReceipt->details()->createMany($detail);

            // Detail Receipt
            DB::commit();
        } catch(\Exception $e){
            DB::rollback();
            throw $e;
        }
        return $goodReceipt;
    }
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