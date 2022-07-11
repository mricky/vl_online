<?php
namespace App\Repositories;
use Illuminate\Support\Facades\DB;

class ChartOfAccountTransaction {

    private $bca;
    private $uangMukaPenjualan;
    private $piutangDagang;

    function __construct ($bca,$uangMukaPenjualan,$piutangDagang) {
        $this->bca = $bca;
        $this->uangMukaPenjualan = $uangMukaPenjualan;
        $this->getPiutangDagang = $piutangDagang;   
    }
    // public function getBcaAccount(){

    //     $this->bca = 
    //     return $this->bca;
    // }

    // public function getUangMukaPenjualan(){
    //     $this->uangMukaPenjualan = DB::table('chart_of_accounts')->where('code','201-1002')->value('id'); // Uang Muka Penjualan
        
    //     return $this->uangMukaPenjualan;
    // }

    // public function getPiutangDagang(){
    //     $this->piutangDagang =  DB::table('chart_of_accounts')->where('code','102-1001')->value('id'); // Putang Dagang
        
    //     return $this->piutangDagang;
    // }

}