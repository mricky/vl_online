<?php
namespace App\Repositories;
use DB;

interface IJournalTransaction {
    public function generateNeraca($data);
  

}
class JournalTransactionRepository implements IJournalTransaction {

    public function generateNeraca($data)
    {
       $trans = DB::table('journal_transactions')->where('transaction_date',null)->get();

       $neraca = DB::table('table_neraca')->where('report_type','N')->get();
       $data['neraca'] = $neraca;
       
       return $data;
    }
}