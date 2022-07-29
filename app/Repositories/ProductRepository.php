<?php
namespace App\Repositories;
use DB;

interface IProduct {
    public function getProductById($productId);
    public function getItemLinePO($poId);
    public function getTotalItem();
    public function getTotalCategory();
    public function getTotalBrand();

}
class ProductRepository implements IProduct {

   
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
