<?php
namespace App\Repositories;
use DB;
use App\Repositories\JournalTransactionRepository;
interface IPurchaseOrder {
    public function getTotalOrder();
    public function getTotalOrderRp();
    public function getTotalHutangRp();
    public function getPurchaseOrder($id);
    public function getDetailPurchaseOrder($id);
    public function getPurchaseOrderReturn($id);
    public function getDetailPurchaseOrderReturn($id);
    public function updateDetailPurchaseOrder($id);
    public function entryPayable($id);


}

class PurchaseOrderRepository implements IPurchaseOrder {

    private $journalTransaction;

    public function __construct(JournalTransactionRepository $journalTransactionRepository)
    {
        $this->journalTransaction = $journalTransactionRepository;
    }
    public function entryPayable($id)
    {
        $purchase = $this->getPurchaseOrder($id);

        $accKas = DB::table('chart_of_accounts')->where('code','101-1000')->first(); // KAS
        $accHutang = DB::table('chart_of_accounts')->where('code','201-1001')->first(); // Hutang

        $data = [
            'purchase_id' => $id,
            'transaction_date' => $purchase->order_date,
            'account_debet' =>$accKas->id,
            'account_credit' => $accHutang->id,
            'amount' => $purchase->total_amount,
            'created_by' => $purchase->created_by
        ];

        try {

            DB::beginTransaction();

            DB::table('account_payable')->insert($data);

            if($purchase->total != $purchase->total_amount && $purchase->total_amount != 0){

                $this->journalTransaction->purchaseWithDownpaymentJournalEntry($purchase);
            } else {
                // lunas
                $this->journalTransaction->purchaseWithoutDownpaymentJouralEntry($purchase);

                // if($purchase->total_amount != 0){
                //     #todo: klo beli n langsung lunas gmn
                // }
            }

            // call journal uang muka
            DB::commit();
        } catch(\Exception $e){
            throw $e;
            DB::rollback();
            throw $e;
        }
        //TODO: journal
    }
    public function updateDetailPurchaseOrder($id){
        $purchase = $this->getPurchaseOrder($id);

        $detail = DB::table('purchase_order_details')->where('purchase_order_id',$id)
            ->update([
                'order_date' => $purchase->order_date,
                'vendor_name' => $purchase->vendor_name,
            ]);
        return $detail;
    }

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
