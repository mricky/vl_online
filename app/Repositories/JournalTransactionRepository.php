<?php
namespace App\Repositories;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
interface IJournalTransaction {
    public function generateNeracaRugiLaba($data,$reportType);
}
class JournalTransactionRepository implements IJournalTransaction {

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
                                ->whereBetween('transaction_date',[$tgl_awal,$tgl_akhir])
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