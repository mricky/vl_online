<?php
namespace App\Repositories;
use DB;

interface ISalesOrder {
    public function getTotalSalesOrder();
    public function getTotalSalesOrderRp();
    public function getTotalSalesPiutangRp();
    public function getSalesOrder($id);
    public function getDetailSalesOrder($id);
    public function updateDeliveryOrder($data);
}

class SalesOrderRepository implements ISalesOrder {

    public function updateDeliveryOrder($data){

        $data = DB::table('sales_orders')->where('id',$data->id)->update([
            'delivery_order' => $data->delivery_order,
            'notes' => $data->notes
        ]);

        return $data;

    }
    public function getTotalSalesOrder(){
        $data = DB::table('sales_orders')->count('id');

        return $data;
    }
    public function getTotalSalesOrderRp()
    {
        $data = DB::table('sales_orders')->sum('sales_orders.total');

        return $data;
    }
    public function getTotalSalesPiutangRp()
    {
        // $data = DB::table('purchase_orders')->sum('purchase_orders.amount_due');
        return 0;
        // return $data;
    }
    public function getSalesOrder($id)
    {
        $data = DB::table('sales_orders as t1')
            ->select('t1.*')
            ->addSelect('t2.code as customer_code','t2.name as customer_name','t2.address as customer_address','t2.phone as customer_phone')
            ->addSelect('t3.name as expedition_name')
            ->join('customers as t2','t1.customer_id','=','t2.id')
            ->join('expeditions as t3','t1.expedition_id','=','t3.id') 
            ->where('t1.id',$id)      
            ->first();

        return $data;
    }

    public function getDetailSalesOrder($id)
    {
        $data = DB::table('sales_order_details as t1')
            ->select('t1.*')
            ->addSelect('t2.code as product_code','t2.name as product_name')
            ->join('products as t2','t1.product_id','=','t2.id')
            ->where('t1.sales_order_id',$id)     
            ->get();

            return $data;
    }
}
