<?php
namespace App\Repositories;

use App\Models\{
    Product,
    GoodReceiptDetail,
    ProductBrand,
    ProductCategory,
    ProductLocation,
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
    public function syncInternalStock();
    public function getProductById($productId);
    public function getItemLinePO($poId);
    public function getTotalItem();
    public function getTotalCategory();
    public function getTotalBrand();
    public function updateStokLocation($receiveId);
    public function updateSalesStokLocation($salesId);
    public function updateStokByProductEntry($id);

}
class ProductRepository implements IProduct {


    const INTERNAL_LOCATION = "WH/Stock";

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
    public function syncInternalStock(){
        $wh_location = WhLocation::where('wh_location_name',$this::INTERNAL_LOCATION)->first();

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
        //dd($salesId);
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
        try {
            DB::beginTransaction();

            ProductLocation::where('good_receipt_id',$id)->delete();
            
            foreach($receives as $item){
                $product = Product::find($item['product_id']);
                

                ProductLocation::create([
                    'good_receipt_id' => $id,
                    'product_id' => $item['product_id'],
                    'wh_location_id' => $item['wh_location_id'],
                    'qty_onhand' => $item['qty_in'],
                    'product_price' => $item['price'],
                    'created_by' => CRUDBooster::myId() ?? 1
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
}
