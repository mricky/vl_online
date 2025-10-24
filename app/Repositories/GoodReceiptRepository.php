<?php

namespace App\Repositories;

use App\Models\{
    PurchaseOrder,
    GoodReceipt,
    GoodReceiptDetail,
    WhLocation,
    OrderStatus,
    PurchaseOrderDetail,
    Vendor
};
use DB;
use CRUDBooster;
use Carbon\Carbon;

interface IGoodReceipt
{
    public function automaticReceiptEntry($poId);
    public function updateDetailGoodReceipt($goodReceiptId);
    public function getTotalProcessReceipt();
    public function getTotalDoneReceipt();
    public function getTotalItemIncoming($periode, $status);
    public function backorderReceiptEntry($goodReceiptId);
    public function syncPurchaseItemQty($purchaseId);
    public function getDetailItemReceiptByPO($purchaseId);
}
class GoodReceiptRepository implements IGoodReceipt
{

    const WH_LOCATION_DEFAULT = 'Partner Location/Vendor';
    const STATUS_DEFAULT = 'Process';
    const STATUS_DONE = 'Done';

    public function getDetailItemReceiptByPO($purchaseId)
    {

        $receipts =  GoodReceiptDetail::select('goods_receipt.*', 'products.name as product_name', 'goods_receipt_details.qty_in', 'wh_locations.wh_location_name', 'cms_users.name as receipt_by')
            ->join('goods_receipt', 'goods_receipt.id', 'goods_receipt_details.good_receipt_id')
            ->join('products', 'products.id', 'goods_receipt_details.product_id')
            ->join('wh_locations', 'wh_locations.id', 'goods_receipt_details.wh_location_id')
            ->join('cms_users', 'cms_users.id', 'goods_receipt.created_by')
            ->where('goods_receipt.purchase_order_id', $purchaseId)
            ->get();

        return $receipts;
    }
    public function inventoryTransactionIn($receiveId, $intentoryType = 'IN', $is_automatic = 0)
    {

        $receipts = GoodReceipt::where('id', $receiveId)->first();
        $vendorName = Vendor::where('id', $receipts->vendor_id)->first();
        $purchaseOrder = PurchaseOrder::where('id', $receipts->purchase_order_id)->first();
       
        try {
            DB::beginTransaction();
            // delete existing transaction
            if ($is_automatic == 0) {
                DB::table('inventory_transaction')
                    ->where('good_reciept_id', $receipts->id)
                    ->where('is_automatic', 0)
                    ->delete();
            } else {
                //$purchaseDetail = PurchaseOrder::with(['details'])->find($purchaseOrder->id);
                // ini dilakukan jika receive yang lain sudah di delete, menyisakan yang otomatis
                // foreach ($purchaseDetail->details as $item) {
                 
                //     DB::table('goods_receipt_details')
                //     ->where('good_receipt_id', $receipts->id)
                //     ->update([
                //         'product_id' => $item->product_id,
                //         'price' => $item->price,
                //         'qty_demand' => $item->qty,
                //         'qty_in' => $item->qty,
                //         'updated_at' => Carbon::now(),
                //     ]);
                //     DB::table('inventory_transaction')->where('good_reciept_id', $receipts->id)
                //     ->where('is_automatic', 1)->delete();
                // }


            }
            $receiptItem =  GoodReceiptDetail::where('good_receipt_id', $receipts->id)->get();  
            foreach ($receiptItem as $items) {
                // item transaction
             
                $product = DB::table('products')->where('id', $items->product_id)->first();
                DB::table('inventory_transaction')->insert([
                    'good_reciept_id' => $receipts->id,
                    'good_reciept_detail_id' => $items->id,
                    'inventory_transaction_type' => $intentoryType,
                    'is_automatic' => $is_automatic,
                    'product_id' => $product->id,
                    'item_code' => $product->code,
                    'item_name' => $product->name,
                    'source' => 'Purchase-Receipt',
                    'doc_no' => $receipts->po_vendor == null ? $purchaseOrder->order_number : $receipts->po_vendor,
                    'qty_in' => $items->qty_in,
                    'unit_cost' => $items->price,
                    'transaction_date' => Carbon::now(),
                    'warehouse' => $items->wh_location_id == 1 ? 'WH/Stock' : 'Partner',
                    'vendor_name' => $receipts->vendor_name == null ? $vendorName->name : $receipts->vendor_name,
                    'created_at' => Carbon::now(),
                    'created_by' => CRUDBooster::myId() ?? 1
                ]);
            }
            //dd($receipts);
            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }
    }
    public function syncPurchaseItemQty($purchaseId)
    {

        $totalQtyRequest = 0;
        $totalQtyIn = 0;
        $totalDifference = 0;

        $receipts =  GoodReceipt::where('purchase_order_id', $purchaseId)->get();
        $totalQtyRequest = PurchaseOrderDetail::where('purchase_order_id', $purchaseId)
            ->sum('qty');
        #die($purchaseId);
         
        foreach ($receipts as $items) {
            $total_qty_in = GoodReceiptDetail::where('good_receipt_id', $items->id)
                ->sum('qty_in');
            $totalQtyIn += $total_qty_in;
          
        }

        $totalDifference = ((int)$totalQtyRequest - (int) $totalQtyIn);
        // dd($totalDifference);
        try {
            DB::beginTransaction();
            $data = [
                'total_qty_request' => $totalQtyRequest,
                'total_qty_in' => $totalQtyIn,
                'total_qty_difference' => $totalDifference
            ];
            // bagusnya dasarnya dari Product Location 
            // $purchaseOrder = PurchaseOrder::findOrFail($purchaseId);
            // $purchaseOrder->total_qty_request =  $totalQtyRequest;
            // $purchaseOrder->total_qty_in = $totalQtyIn;
            // $purchaseOrder->total_qty_difference = $totalDifference;
            // $purchaseOrder->save();
            PurchaseOrder::where('id', $purchaseId)
                ->update($data);
            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }
        # die($totalQtyIn);
    }
    public function getTotalItemIncoming($periode, $status)
    {

        if ($status == 'done') {
            $status = OrderStatus::where('name', $this::STATUS_DONE)->first();
        } else {
            $status = OrderStatus::where('name', $this::STATUS_DEFAULT)->first();
        }

        $query = GoodReceiptDetail::join('goods_receipt', 'goods_receipt.id', 'goods_receipt_details.good_receipt_id')
            ->where('goods_receipt.status_id', $status->id);

        switch ($periode) {
            case 'day':
                $query->whereDate('goods_receipt.receipt_date', '=', Carbon::now()->format('Y-m-d'));
                break;
            case 'week':
                $query->whereBetween('goods_receipt.receipt_date', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()]);
            case 'month':
                $query->whereMonth('goods_receipt.receipt_date', '=', Carbon::now()->format('m'));
                break;
            case 'year':
                $query->whereYear('goods_receipt.receipt_date', '=', Carbon::now()->format('Y'));
                break;
        }

        if ($status == 'done') {
            $result = $query->sum('qty_demand');
        } else {
            $result =  $query->sum('qty_in');
        }

        return $result;
    }

    public function getTotalDoneReceipt()
    {
        $status = OrderStatus::where('name', $this::STATUS_DONE)->first();
        $receive = GoodReceipt::where('status_id', $status->id)->count();

        return $receive;
    }
    public function getTotalProcessReceipt()
    {
        $status = OrderStatus::where('name', $this::STATUS_DEFAULT)->first();
        $receive = GoodReceipt::where('status_id', $status->id)->count();

        return $receive;
    }
    public function receiptEntry($goodReceiptId){
        $receive = GoodReceipt::with(['deferences', 'details'])->find($goodReceiptId);
        $purchase = $this->getPurchaseOrder($receive->purchase_order_id);
        $status = OrderStatus::where('name', $this::STATUS_DONE)->first();
        try {
            $newReceipt = new GoodReceipt();
            $newReceipt->vendor_id = $receive->vendor_id;
            $newReceipt->vendor_name = $purchase->vendor_name;
            $newReceipt->purchase_order_id = $purchase->id;
            $newReceipt->po_vendor = $purchase->order_number;
            $newReceipt->backorder_of = $receive->code;
            $newReceipt->receipt_date = $receive->receipt_date;
            $newReceipt->status_id = $status->id; // Proces
            $newReceipt->description = 'moving vendor to warehouse';
            $newReceipt->created_by = CRUDBooster::myId() ?? 1;
            $newReceipt->save();

            foreach ($receive->details as $row) {
                $itemDetail = new GoodReceiptDetail();
                $itemDetail->good_receipt_id =  $newReceipt->id;
                $itemDetail->product_id = $row['product_id'];
                $itemDetail->lot_number = '-';
                $itemDetail->qty_demand =  $row['qty_in'];
                $itemDetail->qty_in = $row['qty_in'];
                $itemDetail->qty_diferrence = 0;
                $itemDetail->price = $row['price'];
                $itemDetail->wh_location_id = 1; // masukan ke lokasi non vendor / wh stok
                $itemDetail->is_store_vendor_location = 0;
                $itemDetail->created_by =  CRUDBooster::myId() ?? 1;
                $itemDetail->save();
                
            }
            // delete automatic receipt, nanti ini akan di perbaharui dengan saat delete, di kembalikan dari stok vendor
            #GoodReceiptDetail::create($datail);
            // delete automatic 
            // $receive->details()->delete();
            // $receive->delete();
            
            DB::commit();

        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }
        return $newReceipt;
    }
    public function backorderReceiptEntry($goodReceiptId)
    {
        $receive = GoodReceipt::with(['deferences', 'details'])->find($goodReceiptId);
        $purchase = $this->getPurchaseOrder($receive->purchase_order_id);
        $status = OrderStatus::where('name', $this::STATUS_DEFAULT)->first();

        try {
            $backOrder = new GoodReceipt();
            $backOrder->vendor_id = $receive->vendor_id;
            $backOrder->vendor_name = $purchase->vendor_name;
            $backOrder->purchase_order_id = $purchase->id;
            $backOrder->po_vendor = $purchase->order_number;
            $backOrder->backorder_of = $receive->code;
            $backOrder->receipt_date = $receive->receipt_date;
            $backOrder->status_id = $status->id; // Proces
            $backOrder->description = 'backorder-' . $receive->code;
            $backOrder->created_by = CRUDBooster::myId() ?? 1;
            $backOrder->save();
            foreach ($receive->deferences as $row) {
                $itemDetail = new GoodReceiptDetail();
                $itemDetail->good_receipt_id =  $backOrder->id;
                $itemDetail->product_id = $row['product_id'];
                $itemDetail->lot_number = '-';
                $itemDetail->qty_demand =  $row['qty_diferrence']; // sisa
                $itemDetail->qty_in = $row['qty_diferrence']; // munculkan di textbox sisa nya
                $itemDetail->qty_diferrence = 0;
                $itemDetail->price = $row['price'];
                $itemDetail->wh_location_id = 1; // masukan ke lokasi non vendor / wh stok
                $itemDetail->is_store_vendor_location = 0;
                $itemDetail->created_by =  CRUDBooster::myId() ?? 1;
                $itemDetail->save();
            }
            #GoodReceiptDetail::create($datail);
            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }
        return $backOrder;
    }
    public function automaticReceiptEntry($poId)
    {
        $purchase = PurchaseOrder::with(['details', 'vendor'])->find($poId);
        $location = WhLocation::where('wh_location_name', $this::WH_LOCATION_DEFAULT)->first();
        $status = OrderStatus::where('name', $this::STATUS_DEFAULT)->first();

        try {
            DB::beginTransaction();

            $goodReceipt = new GoodReceipt();
            $goodReceipt->vendor_id = $purchase->vendor_id;
            $goodReceipt->vendor_name = $purchase->vendor->name;
            $goodReceipt->purchase_order_id = $purchase->id;
            $goodReceipt->po_vendor = $purchase->order_number;
            $goodReceipt->receipt_date = $purchase->estimated_date; // estimate
            $goodReceipt->status_id = $status->id; // Proces
            $goodReceipt->description = 'automatic';
            $goodReceipt->created_by = CRUDBooster::myId() ?? 1;
            $goodReceipt->save();
          
            $detail = $purchase->details->transform(function ($item) use ($goodReceipt, $location) {
                $item['good_receipt_id'] = $goodReceipt->id;
                $item['product_id'] = $item['product_id'];
                $item['lot_number'] = '-';
                $item['qty_demand'] = $item['qty'];
                $item['qty_in'] = 0; // diubah
                $item['qty_diferrence'] = 0; 
                $item['price']  = $item['price'];
                $item['is_store_vendor_location'] = 1;
                $item['wh_location_id'] = $location->id;
                $item['is_automatic'] = 1;
                $item['created_by'] = CRUDBooster::myId() ?? 1;
                return $item;
            })->toArray();
            $goodReceipt->details()->createMany($detail);
            $this->inventoryTransactionIn($goodReceipt->id, 'IN', 1);
            // Detail Receipt
            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }
        return $goodReceipt;
    }
    public function updateDetailGoodReceipt($goodReceiptId)
    {
        try {

            DB::beginTransaction();

            $goodReceipt = DB::table('goods_receipt')->where('id', $goodReceiptId)->first();


            $goodReceiptDetail = DB::table('goods_receipt_details')->where('good_receipt_id', $goodReceipt->id)->get();

            foreach ($goodReceiptDetail as $value) {
                DB::table('products')->where('id', $value->product_id)
                    ->update([
                        'vendor_id' => $goodReceipt->vendor_id,
                        'qty_onhand' =>  $value->qty_in,
                        'product_price' => $value->price,
                        'updated_at' => now()
                    ]);
            }

            DB::commit();

            $this->inventoryTransactionIn($goodReceipt->id, 'IN', 0);
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }
    }

    public function getPurchaseOrder($id)
    {
        $data = DB::table('purchase_orders as t1')
                 ->select('t1.*')
                 ->addSelect('t2.id as vendor_id','t2.code as vendor_code','t2.name as vendor_name','t2.address as vendor_address','t2.phone as vendor_phone')
                 ->join('vendors as t2','t1.vendor_id','=','t2.id')
                 ->where('t1.id',$id)
        ->first();

        return $data;
    }
}
