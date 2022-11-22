<?php
namespace App\Repositories;
use DB;

interface IPurchaseOrder {
    public function getTotalOrder();
    public function getTotalOrderRp();
    public function getTotalHutangRp();
    public function getPurchaseOrder($id);
    public function getDetailPurchaseOrder($id);
    public function getPurchaseOrderReturn($id);
    public function getDetailPurchaseOrderReturn($id);

}

class PurchaseOrderRepository implements IPurchaseOrder {

    public function getPurchaseOrderReturn($id)
    {
   
        $data = DB::table('purchase_order_return as t1')
                ->select('t1.*')
                ->addSelect('t2.code as vendor_code','t2.name as vendor_name','t2.address as vendor_address','t2.phone as vendor_phone')
                ->join('vendors as t2','t1.vendor_id','=','t2.id')  
                ->where('t1.id',$id)      
            ->first();
            return $data;
    }
    public function getDetailPurchaseOrderReturn($id)
    {   
        $data = DB::table('purchase_order_detail_return as t1')
                 ->select('t1.*')
                 ->addSelect('t2.code as product_code','t2.name as product_name')
                 ->join('products as t2','t1.product_id','=','t2.id')
                 ->where('t1.return_order_id',$id)     
                 ->get();
       
        return $data;
    }
    public function getPurchaseOrder($id)
    {
        $data = DB::table('purchase_orders as t1')
                 ->select('t1.*')
                 ->addSelect('t2.code as vendor_code','t2.name as vendor_name','t2.address as vendor_address','t2.phone as vendor_phone')
                 ->join('vendors as t2','t1.vendor_id','=','t2.id')  
                 ->where('t1.id',$id)      
        ->first();

        return $data;
    }
    public function getDetailPurchaseOrder($id){

        $data = DB::table('purchase_order_details as t1')
                 ->select('t1.*')
                 ->addSelect('t2.code as product_code','t2.name as product_name')
                 ->join('products as t2','t1.product_id','=','t2.id')
                 ->where('t1.purchase_order_id',$id)     
                 ->get();
       
        return $data;
    }
    public function getTotalOrder(){

        $data = DB::table('purchase_orders')->count('purchase_orders.id');

        return $data;
    }

    public function getTotalOrderRp(){
        $data = DB::table('purchase_orders')->sum('purchase_orders.subtotal');

        return $data;
    }

    public function getTotalHutangRp()
    {
        $data = DB::table('purchase_orders')->sum('purchase_orders.amount_due');

        return $data;
    }
  
}
