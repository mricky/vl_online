<?php
namespace App\Repositories;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Exception;
interface IJournalTransaction {
    public function generateNeracaRugiLaba($data,$reportType);

    // purchase
    public function purchaseJournalEntry($data);
    public function deletePurchaseJournalEntry($data);  
    public function updatePurchaseJournalEntry($data);

    // Sales
}
class JournalTransactionRepository implements IJournalTransaction {


    public function updatePurchaseJournalEntry($data)
    {
        
        switch($data->module){
             case 'purchase':
                $accountDebit = DB::table('chart_of_accounts')->where('code','104-1001')->first(); // Uang Muka Pembelian
                $accountCredit = DB::table('chart_of_accounts')->where('code','101-2001')->first(); // BCA
             break;
             case 'receive':
                $accountDebit = DB::table('chart_of_accounts')->where('code','103-1001')->first(); // Persediaan Dagang
                $accountCredit = DB::table('chart_of_accounts')->where('code','104-1001')->first(); // Uang Muka Pembelian
             break;
             case 'sales':
                $accountDebit = DB::table('chart_of_accounts')->where('code','101-2001')->first();
                $accountCredit = DB::table('chart_of_accounts')->where('code','201-1002')->first();     
             break;

        }

         DB::table('journal_transactions')->where('ref_no',$data->order_number)->update([
            'total_debit' => $data->total_amount,
            'total_credit' => $data->total_amount
        ]);
        
        // change debit & kredit
        $id = DB::table('journal_transactions')->where('ref_no',$data->order_number)->first()->id;
        DB::table('journal_details')->where('journal_id',$id)
                                    ->where('account_id',$accountDebit->id)
                                    ->update([
                                        'debit'  => $data->total_amount,
                                        'credit' => 0
                                    ]);
        
        DB::table('journal_details')->where('journal_id',$id)
                                    ->where('account_id',$accountCredit->id)
                                    ->update([
                                        'debit'  => 0,
                                        'credit' => $data->total_amount
                                    ]);
    }
    public function deletePurchaseJournalEntry($data)
    {     
        try {

            DB::beginTransaction();

            switch($data->module){
                case 'purchase':
                   $table = 'purchase_order_details';
                   $uniqKey = 'purchase_order_id';
                break;
                case 'receive':
                    $table = 'goods_receipt_details';
                    $uniqKey = 'good_receipt_id';
                 break;
            case 'sales':
                  $table = 'sales_order_details'; 
                  $uniqKey = 'sales_order_id';
             break;
   
           }
        
            DB::table($table)->where($uniqKey,$data->id)->delete();

            $journalId = DB::table('journal_transactions')->where('ref_no',$data->order_number)->first()->id;

            DB::table('journal_details')->where('journal_id',$journalId)->delete();
            DB::table('journal_transactions')->where('id',$journalId)->delete();

            DB::commit();
        } catch(\Exception $e){
            DB::rollback();
            throw $e;
        }

    }
    public function purchaseJournalEntry($data)
    {
        switch($data->module){
            case 'purchase':
               $accountDebit = DB::table('chart_of_accounts')->where('code','104-1001')->first();
               $accountCredit = DB::table('chart_of_accounts')->where('code','101-2001')->first();
            break;
            case 'receive':
                $accountDebit = DB::table('chart_of_accounts')->where('code','103-1001')->first(); // Persediaan Dagang
                $accountCredit = DB::table('chart_of_accounts')->where('code','104-1001')->first(); // Uang Muka Pembelian
             break;
            case 'sales':
               $accountDebit = DB::table('chart_of_accounts')->where('code','101-2001')->first(); // BCA 
               $accountCredit = DB::table('chart_of_accounts')->where('code','201-1002')->first(); // Uang Muka Penjualan
            break;
         }
       
        try {

            DB::beginTransaction();
                       
            $sq = DB::table('journal_transactions')->max('id'); 
            $year = substr(date("y"),-2);
			$month = date("m");
            $no = str_pad($sq+1,4,"0",STR_PAD_LEFT);
          
            $payload = [
                'transaction_date' => $data->order_date,
                'transaction_number' => 'GL-'.$year.$month.'-'.$no,
                'entry_no'  => $no,
                'ref_no' => $data->order_number,
                'memo' => '-',
                'total_debit' => $data->total_amount,
                'total_credit' => $data->total_amount
            ];

            $id = DB::table('journal_transactions')->insertGetId($payload);
            
            // insert debit & kredit
            DB::table('journal_details')->insert([
                [
                    'journal_id' => $id,
                    'account_id' => $accountDebit->id,
                    'debit'    => $data->total_amount,
                    'credit' => 0
                ],
                [
                    'journal_id' => $id,
                    'account_id' => $accountCredit->id,
                    'debit'    => 0,
                    'credit' => $data->total_amount
                ]
            ]);

            DB::commit();
        } catch(\Exception $e){
            DB::rollback();
            throw $e;
        }

    }

    public function generateNeracaRugiLaba($data,$reportType)
     {

        $tgl_awal = Carbon::createFromFormat('Y-m-d', $data['tgl_awal'])->format('Y-m-d');
        $tgl_akhir = Carbon::createFromFormat('Y-m-d', $data['tgl_akhir'])->format('Y-m-d');
        try {
            DB::beginTransaction();
            $neraca = DB::table('table_neraca')->where('report_type',$reportType)->get();
            DB::table('table_neraca')->update([
                    'debit' => 0,
                    'credit' => 0
            ]);
                    
            foreach($neraca as $key=>$value){
                if($value->account_id != 0){
                    $trans = DB::table('journal_transactions')
                                ->where('account_id',$value->account_id)
                                ->where('d_k','D')
                                // ->whereBetween('transaction_date',[$tgl_awal,$tgl_akhir])
                                ->sum('total');
                            
                    $neraca = DB::table('table_neraca')
                                ->where('account_id',$value->account_id)
                                ->update([
                                    'debit' => $trans
                                ]);
                } // end if
            } // end foreach
                DB::commit();
            } catch (\Exception $e) {
                DB::rollback();
                throw $e;
            }

            $data['neraca'] = $neraca;
       
            return $data;
    }
}