<?php
namespace App\Repositories;

use App\Models\{
    GoodReceipt,
    Product,
    GoodReceiptDetail,
    ProductBrand,
    ProductCategory,
    ProductLocation,
    PurchaseOrder,
    SalesOrderDetail,
    WhLocation
};
use DB;
use CRUDBooster;
use Request;


interface IProduct {
    public function findProductItem($term);
    public function findProductCategory($term);
    public function findProductBrand($term);
    public function syncProductItemReturnPurchase($productLocationId);
    public function syncInternalStock();
    public function getProductById($productId);
    public function getItemLinePO($poId);
    public function getTotalItem();
    public function getTotalCategory();
    public function getTotalBrand();
    public function updateStokLocation($receiveId);
    public function updateSalesStokLocation($salesId);
    public function updateStokByProductEntry($id);
    public function findProductLocationItem($ids,$whLocationId);
    public function updateTotalStockAllLocation($productId);
    public function findProductItemPurchase($purchaseId);
}
class ProductRepository implements IProduct {


    const INTERNAL_LOCATION = "WH/Stock";
    const TOKO_LOCATION = 'Toko';
    public function syncProductItemReturnPurchase($productLocationIds){
        // update qty product location
        // ini akan jadi masalah klo ada opname
        // update on hand product
        foreach($productLocationIds as $item){
            $productLocation = ProductLocation::find($item->product_location_id);
            $detailPurchaseReturn = DB::table('purchase_order_detail_return')->where('id',$item->id)
                            ->update([
                                'product_id' => $productLocation->product_id,
                                'created_by' => CRUDBooster::myId() ?? 1]

            );

            #echo $productLocation->product_id; exit;


        }
    }
    public function findProductItemPurchase($purchaseId)
    {
        $data = DB::table('view_product_purchases')
                    ->where('purchase_order_id',$purchaseId)->get();

        return $data;

    }
    public function findProductLocationItem($ids,$whLocationId){
        $data = [];

        $data = ProductLocation::select('product_locations.*')
                        ->addSelect('products.name as product_name','products.product_price','wh_locations.wh_location_name')
                        ->addSelect(DB::raw('IFNULL( vendors.name, 0) as vendor_name'))
                        ->join('products','products.id','product_locations.product_id')
                        ->join('wh_locations','wh_locations.id','product_locations.wh_location_id')
                        ->leftJoin('goods_receipt','goods_receipt.id','product_locations.good_receipt_id')
                        ->leftJoin('vendors','vendors.id','goods_receipt.vendor_id')
;

        if($whLocationId != null){
            $data->where('wh_location_id',$whLocationId);
        }
		if($ids != null){
				$data->whereIn('product_id',$ids);
		}
        $data->where('product_locations.qty_onhand','!=',0);
        $data = $data->get();

        return $data;

    }
    public function findProductItem($term)
    {

        $products = Product::where('name','LIKE',"%{$term}%")->limit(5)->get();

        $formated = [];

        foreach($products as $item){

            $formated[] = ['id'=> $item->id,'text'=> $item->name];
        }

        return $formated;
    }

    public function findProductCategory($term)
    {

        $categories = ProductCategory::where('name','LIKE',"%{$term}%")->limit(5)->get();

        $formated = [];

        foreach($categories as $item){

            $formated[] = ['id'=> $item->id,'text'=> $item->name];
        }

        return $formated;
    }

    public function findProductBrand($term){

        $brands = ProductBrand::where('name',$term)->limit(5)->get();

        $formated = [];

        foreach($brands as $item){
            $formated[] = ['id'=> $item->id,'text'=> $item->name];
        }

        return $formated;

    }
    public function updateTotalStockAllLocation($productId){
        // next ini di buat di trait
        $countbyAllLocation = ProductLocation::select(
            DB::raw('sum(qty_onhand) as total_qty')
        )->where('product_id',$productId)->first();

        $product = Product::findOrFail($productId);

        try {
            DB::beginTransaction();

            $product->qty_onhand = $countbyAllLocation['total_qty'];
            $product->save();
            DB::commit();
        } catch(\Exception $e){
            DB::rollback();
            dd($e->getMessage());
        }

    }

    public function syncInternalStock(){
        $wh_location = WhLocation::where('wh_location_name',$this::TOKO_LOCATION)->first();

        $products = Product::all();
        try {
            DB::beginTransaction();

            foreach($products as $item){
            ProductLocation::updateOrCreate([
                    'product_id' => $item['id'],
                    'wh_location_id' => $wh_location->id,
                    'qty_onhand' => $item['qty_onhand']
            ]);
        }

        DB::commit();
        } catch(\Exception $e){
            DB::rollback();
            dd($e->getMessage());
        }
    }
    public function updateSalesStokLocation($salesId){
        $salesDetails = SalesOrderDetail::where('sales_order_id',$salesId)->get();
        try {
            DB::beginTransaction();

            foreach($salesDetails as $item){
                $product = Product::find($item['product_id']);

                $productLocation = ProductLocation::find($item['product_location_id']);

                $qtyProduct = $product->qty_onhand ?? 0;
                $qtyProductLoc = $productLocation->qty_onhand ?? 0;
                $newProductLocationQty =  ($qtyProductLoc - $item['qty']);
                //dd($item['product_location_id']);
                $newProductQty = $qtyProduct - $item['qty'];
                $productLocation->qty_onhand = $item['qty'];

                # Save Product Qty
                $product->qty_onhand = $newProductQty;
                $product->save();
                # Save Product Location Qty
                $productLocation->qty_onhand = $newProductLocationQty;
                $productLocation->save();
                // update product
            }

            DB::commit();
        } catch(\Exception $e){
            DB::rollback();
            dd($e->getMessage());
        }

        return $salesDetails;

    }
    public function updateStokByProductEntry($id){

        $product = Product::find($id);
        try {
            DB::beginTransaction();

                ProductLocation::create([
                    'product_id' => $id,
                    'wh_location_id' =>1,
                    'qty_onhand' => $product->qty_onhand,
                    'product_price' => $product->product_price,
                    'created_by' => CRUDBooster::myId() ?? 1
                ]);
            DB::commit();
        } catch(\Exception $e){
            DB::rollback();
            throw $e;
        }

       return $product;
    }
    public function updateStokLocation($id){

        $receives = GoodReceiptDetail::where('good_receipt_id',$id)->get();
       
        // TODO : Check here
        try {
            DB::beginTransaction();

            ProductLocation::where('good_receipt_id',$id)->delete();
            // Demand misal 10
            // qty in = 0
            foreach($receives as $item){
                $product = Product::find($item['product_id']);
              
                $purchaseOrder = GoodReceipt::where('id',$item['good_receipt_id'])->first()->purchase_order_id;
              
                // input product location qty baru
              
                ProductLocation::create([
                    'good_receipt_id' => $id,
                    'purchase_order_id' => $purchaseOrder->purchase_order_id,
                    'product_id' => $item['product_id'],
                    'wh_location_id' => 1,
                    'qty_onhand' => $item['qty_in'],
                    'product_price' => $item['price'],
                    'created_by' => CRUDBooster::myId() ?? 1
                ]);

                // cari product dengan kondisi good_receipt_id = null / berasal dari inputan purchase
               
                $latestProdLocation = DB::table('product_locations')->where('wh_location_id',2) // vendor
                                ->whereNull('good_receipt_id')
                                ->where('purchase_order_id',$purchaseOrder)
                                ->first();
             
                ProductLocation::where('id',$latestProdLocation->id)
                                ->update([
                                    'qty_onhand' => $latestProdLocation->qty_onhand - $item['qty_in']
                                ]);

            }
            $lastQtyOnhand = $product->qty_onhand;
            $newStok = ($lastQtyOnhand + $item['qty_in']);
            $product->qty_onhand = $newStok;
            $product->save();
            DB::commit();
        } catch(\Exception $e){
            DB::rollback();
            throw $e;
        }

        return $receives;
    }
    public function getTotalItem(){
        $data = DB::table('products')->count('id');

        return $data;
    }

    public function getTotalCategory()
    {

        $data = DB::table('product_categories')->count('id');

        return $data;
    }
    public function getTotalBrand()
    {
        $data = DB::table('product_brands')->count('id');

        return $data;
    }
    public function getProductById($id){
        die($id);
        $sql = 'vendor_id ='.$id;

       return $sql;
    }

    public function getItemLinePO($poId)
    {
        $data = DB::table('purchase_order_details as t1')
            ->select('t1.purchase_order_id','t1.id as order_detail_id','t1.qty','t1.price')
            ->addSelect('t2.id as product_id','t2.code as product_code','t2.name as product_name','t2.is_track_lot_number')
            ->addSelect('t3.id as product_category_id','t3.name as product_category_name')
            ->addSelect('t4.id as product_brand_id','t4.name as product_brand_name')
            ->addSelect('t5.order_number as po_number')
            ->addSelect('t6.id as vendor_id','t6.code as vendor_code','t6.name as vendor_name')
            ->join('products as t2','t1.product_id','t2.id')
            ->join('product_categories as t3','t2.category_id','t3.id')
            ->join('product_brands as t4','t2.brand_id','t4.id')
            ->join('purchase_orders as t5','t1.purchase_order_id','t5.id')
            ->join('vendors as t6','t5.vendor_id','t6.id')
            ->where('t1.purchase_order_id',$poId)->get();
        return $data;
    }

    public function getItemLineReceipt($id)
    {
        // product location id
        // ngurangin product stock
        // product_locations reference good receipt id
        /// ->addSelect(DB::raw('CASE WHEN product_locations.wh_location_id = 1 THEN COALESCE(SUM(product_locations.qty_onhand),0) ELSE 0 END as qty_internal'),DB::raw('CASE WHEN product_locations.wh_location_id = 2 THEN COALESCE(SUM(product_locations.qty_onhand),0) ELSE 0 END as qty_vendor'))
      //  ->select(DB::raw('COALESCE(sum(qty_in),0) as incoming_qty')

        $subQuery = DB::table('product_locations as t1')
                    ->select('id as product_location_id')
                    ->where('good_receipt_id',$id)->first();


        $data = DB::table('goods_receipt_details as t1')
           // ->mergeBindings($subQuery ) 
            ->select('t6.id as product_location_id','t7.wh_location_name','t1.good_receipt_id','t1.id as good_receipt_detail_id','t1.qty_in','t1.price')
            //->addSelect(DB::raw('select wh_location_id from product_locations WHERE good_receipt_id = 2 as wh_location_id'))
            ->addSelect('t2.id as product_id','t2.code as product_code','t2.name as product_name','t2.is_track_lot_number')
            ->addSelect('t3.id as product_category_id','t3.name as product_category_name')
            ->addSelect('t4.id as product_brand_id','t4.name as product_brand_name')
            ->addSelect('t5.code as code')
           // ->addSelect('t6.id as vendor_id','t6.code as vendor_code','t6.name as vendor_name')
            ->join('products as t2','t1.product_id','t2.id')
            ->join('product_categories as t3','t2.category_id','t3.id')
            ->join('product_brands as t4','t2.brand_id','t4.id')
            ->join('goods_receipt as t5','t1.good_receipt_id','t5.id')
            ->join('product_locations as t6','t1.product_id','t6.product_id')
            //->join('vendors as t6','t5.vendor_id','t6.id')
            ->join('wh_locations as t7','t6.wh_location_id','t7.id')
            ->where('t6.good_receipt_id',$id)
            ->where('t1.good_receipt_id',$id)->get();

        return $data;
    }
}
