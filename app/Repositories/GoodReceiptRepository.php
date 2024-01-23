<?php
namespace App\Repositories;
use App\Models\{
    PurchaseOrder,
    GoodReceipt,
    GoodReceiptDetail,
    WhLocation,
    OrderStatus,
    PurchaseOrderDetail
};
use DB;
use CRUDBooster;
use Carbon\Carbon;
interface IGoodReceipt{
    public function automaticReceiptEntry($poId);
    public function updateDetailGoodReceipt($goodReceiptId);
    public function getTotalProcessReceipt();
    public function getTotalDoneReceipt();
    public function getTotalItemIncoming($periode,$status);
    public function backorderReceiptEntry($goodReceiptId);
    public function syncPurchaseItemQty($purchaseId);
    public function getDetailItemReceiptByPO($purchaseId);
}
class GoodReceiptRepository implements IGoodReceipt {

    CONST WH_LOCATION_DEFAULT = 'Partner Location/Vendor';
    CONST STATUS_DEFAULT = 'Process';
    CONST STATUS_DONE = 'Done';

    public function getDetailItemReceiptByPO($purchaseId){

        $receipts =  GoodReceiptDetail::select('goods_receipt.*','products.name as product_name','goods_receipt_details.qty_in','wh_locations.wh_location_name','cms_users.name as receipt_by')
                                    ->join('goods_receipt','goods_receipt.id','goods_receipt_details.good_receipt_id')
                                    ->join('products','products.id','goods_receipt_details.product_id')
                                    ->join('wh_locations','wh_locations.id','goods_receipt_details.wh_location_id')
                                    ->join('cms_users','cms_users.id','goods_receipt.created_by')
                                    ->where('goods_receipt.purchase_order_id',$purchaseId)
                                ->get();

        return $receipts;

    }
    public function syncPurchaseItemQty($purchaseId){

        $totalQtyRequest = 0;
        $totalQtyIn = 0;
        $totalDifference = 0;

        $receipts =  GoodReceipt::where('purchase_order_id',$purchaseId)->get();
        $totalQtyRequest = PurchaseOrderDetail::where('purchase_order_id',$purchaseId)
                                    ->sum('qty');
        #die($purchaseId);
        foreach($receipts as $items){
            $total_qty_in = GoodReceiptDetail::where('good_receipt_id',$items->id)
                                        ->sum('qty_in');
            $totalQtyIn += $total_qty_in;

       }

       $totalDifference = ((int)$totalQtyRequest - (int) $totalQtyIn);

       try {
           DB::beginTransaction();
            $data = [
                    'total_qty_request' => $totalQtyRequest,
                    'total_qty_in' => $totalQtyIn,
                    'total_qty_difference' => $totalDifference
            ];

            $purchaseOrder = PurchaseOrder::findOrFail($purchaseId);
            $purchaseOrder->total_qty_request =  $totalQtyRequest;
            $purchaseOrder->total_qty_in = $totalQtyIn;
            $purchaseOrder->total_qty_difference = $totalDifference;
            $purchaseOrder->save();
            DB::commit();
        } catch(\Exception $e){
            DB::rollback();
            throw $e;
        }
       # die($totalQtyIn);
    }
    public function getTotalItemIncoming($periode,$status){

        if($status == 'done'){
            $status = OrderStatus::where('name',$this::STATUS_DONE)->first();
        } else {
            $status = OrderStatus::where('name',$this::STATUS_DEFAULT)->first();
        }

        $query = GoodReceiptDetail::join('goods_receipt','goods_receipt.id','goods_receipt_details.good_receipt_id')
                                 ->where('goods_receipt.status_id',$status->id);

        switch($periode){
            case 'day' :
                $query->whereDate('goods_receipt.receipt_date','=',Carbon::now()->format('Y-m-d'));
            break;
            case 'week':
                $query->whereBetween('goods_receipt.receipt_date', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()]);
            case 'month' :
                $query->whereMonth('goods_receipt.receipt_date','=', Carbon::now()->format('m'));
            break;
            case 'year' :
            	$query->whereYear('goods_receipt.receipt_date','=', Carbon::now()->format('Y'));
            break;
        }

        if($status == 'done'){
            $result = $query->sum('qty_demand');
        } else {
            $result =  $query->sum('qty_in');
        }

        return $result;
    }

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

    public function backorderReceiptEntry($goodReceiptId){

        $receive = GoodReceipt::with(['deferences','details'])->find($goodReceiptId);
        $location = WhLocation::where('wh_location_name',$this::WH_LOCATION_DEFAULT)->first();
        $status = OrderStatus::where('name',$this::STATUS_DEFAULT)->first();

         try {
            $backOrder = new GoodReceipt();
            $backOrder->vendor_id = $receive->vendor_id;
            $backOrder->purchase_order_id = $receive->purchase_order_id;
            $backOrder->po_vendor = $receive->order_number;
            $backOrder->backorder_of = $receive->code;
            $backOrder->receipt_date = $receive->receipt_date;
            $backOrder->status_id = $status->id; // Proces
            $backOrder->description = 'backorder-'.$receive->code;
            $backOrder->created_by = CRUDBooster::myId() ?? 1;
            $backOrder->save();

            foreach($receive->deferences as $row){
                $itemDetail = new GoodReceiptDetail();
                $itemDetail->good_receipt_id =  $backOrder->id;
                $itemDetail->product_id = $row['product_id'];
                $itemDetail->lot_number = '-';
                $itemDetail->qty_demand =  $row['qty_diferrence'];
                $itemDetail->qty_in = 0;
                $itemDetail->qty_diferrence = 0;
                $itemDetail->price = $row['price'];
                $itemDetail->wh_location_id = $location->id;
                $itemDetail->is_store_vendor_location = $location->id;
                $itemDetail->created_by =  CRUDBooster::myId() ?? 1;
                $itemDetail->save();
            }

            #GoodReceiptDetail::create($datail);
            DB::commit();
         } catch(\Exception $e){
            DB::rollback();
            throw $e;
        }
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


          $goodReceiptDetail = DB::table('goods_receipt_details')->where('good_receipt_id',$goodReceiptId->id)->get();

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
