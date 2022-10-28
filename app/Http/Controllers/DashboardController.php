<?php

namespace App\Http\Controllers;

use App\Models\SalesOrder;
use Illuminate\Http\Request;
use DB;
use App\Repositories\{
    GoodReceiptRepository
};
class DashboardController extends Controller
{
    
    private $goodReceiptRepository;

    public function __construct(GoodReceiptRepository $goodReceiptRepository) 
    {
       	    $this->goodReceiptRepository = $goodReceiptRepository;
    }

    public function indexPenjualan(Request $request){
        
        $days = $request->input('days', 1);

        $range = \Carbon\Carbon::now()->subDays($days)->format('Y-m-d');
     
        $sales = SalesOrder::whereDate('sales_orders.order_date', '>=', $range)
                        ->join('sales_order_details','sales_order_details.sales_order_id','sales_orders.id')
                        ->groupBy('sales_orders.order_date')
                        ->get([
                            DB::raw('Date(sales_orders.order_date) as date'),
                            DB::raw('SUM(sales_order_details.total) as value'),
                        ])
                        ->toJSON();
        return $sales;           
    }
    public function totalItems(){

       $receipt =  $this->goodReceiptRepository->getTotalItemIncoming('month','done');
       $processReceipt =  $this->goodReceiptRepository->getTotalProcessReceipt();

       $data = [
            'total_incoming' => $receipt, # barang
            'total_incoming_process' => $processReceipt
       ];

       return response()->json($data);
    }

    public function indexItemFastMoving(){

        $sales = SalesOrder::join('sales_order_details','sales_order_details.sales_order_id','sales_orders.id')
                        ->join('products','products.id','sales_order_details.product_id')
                        ->join('product_categories','product_categories.id','products.category_id')
                        ->groupBy('product_categories.name')
                        ->limit(3)
                        ->get([
                            'product_categories.name as label',
                             DB::raw('SUM(sales_order_details.qty) as value'),
                        ])
                        ->toJSON();
        return $sales;
    }

    public function indexPenerimaan(){
        die('penerimaaan');
    }
}
