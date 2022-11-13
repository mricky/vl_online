<?php
namespace App\Repositories;
use DB;

interface ISalesOrder {
    public function getTotalSalesOrder();
    public function getTotalKirimOrder();
    public function getTotalSalesOrderRp();
    public function getTotalSalesPiutangRp();
    public function getTotalSalesLunasRp();
    public function getSalesOrder($id);
    public function getDetailSalesOrder($id);
    public function updateDetailSalesOrder($id);
    public function updateDeliveryOrder($id);
    public function updatePayment($data);
}

class SalesOrderRepository implements ISalesOrder {

    public function updateDetailSalesOrder($id){
        $sales = $this->getSalesOrder($id);
        
        $detail = DB::table('sales_order_details')->where('sales_order_id',$id)
                ->update([
                    'customer_name' => $sales->customer_name,
                    'expedition_name' => $sales->expedition_name
                ]);
        return $detail;
    }
    public function updatePayment($data){

        $data = DB::table('sales_orders')->where('id',$data->id)->update([
            'total_amount' => $data->total_amount,
            'amount_due' => $data->amount_due

        ]);

        return $data;

    }
    public function updateDeliveryOrder($id){

        $data = DB::table('sales_orders')->where('id',$id)->update([
            'delivery_order' =>1
        ]);

        return $data;

    }
    public function getTotalKirimOrder(){
        $data = DB::table('sales_orders')
                ->selectRaw('COUNT(sales_orders.total) as kirim')
                ->where('sales_orders.delivery_order','=','0')
                ->get();

        return $data[0]->kirim;
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
    public function getTotalSalesLunasRp()
    {
        $data = DB::table('sales_orders')
                    ->selectRaw('SUM(sales_orders.total) as lunas')
                    ->where('sales_orders.amount_due','=','0')
                    ->get();
       
         return $data[0]->lunas;
    }

    public function getTotalSalesPiutangRp()
    {
        $data = DB::table('sales_orders')
                    ->selectRaw('SUM(sales_orders.total) as amount_due')
                    ->where('sales_orders.amount_due','>','0')
                    ->get();
       
         return $data[0]->amount_due;
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
