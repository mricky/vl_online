<?php
namespace App\Repositories;

use App\Models\PurchaseOrder;
use App\Models\StockOpname;
use App\Models\StockOpnameDetail;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use crocodicstudio\crudbooster\helpers\CRUDBooster;
use Exception;

use function Psy\debug;

interface IJournalTransaction {
    public function generateNeraca($data,$reportType);
    public function generateRugiLaba($data,$reportType,$tgl_awal,$tgl_akhir,$generateFrom);

    // purchase
    public function printJurnal($id,$type);
    public function goodReceiveJournalEntry($receive);
    public function paidPurchase($purchase,$payment);
    public function purchaseWithDownpaymentJournalEntry($purchaseOrder);
    public function purchaseWithoutDownpaymentJouralEntry($purchaseOrder);
    public function purchaseJournalEntry($data,$is_manual);
    public function salesJournalEntry($data,$is_manual,$mode);
    public function deletePurchaseJournalEntry($data);
    public function updatePurchaseJournalEntry($data);
    public function generateJournalNumber() : string;
    public function paidSales($sales,$payment);

    // Sales
}
class JournalTransactionRepository extends ChartOfAccountTransaction implements IJournalTransaction {

    private $bca;
    private $uangMukaPenjualan;
    private $piutangDagang;
    private $pendapatanDagang;
    private $HPP;
    // NEw
    private $accKas;
    private $accHutang;
    private $saldoAwal;
    private $biayaSelisih;
    private $accPersediaanExternal;
    private $accPersediaanInternal;

    // Expedisi and Diskon
    private $accDiskon;
    private $accExpedisi;


    function __construct()
    {
         $this->bca = DB::table('chart_of_accounts')->where('code','101-2001')->first(); // BCA
         $this->uangMukaPenjualan = DB::table('chart_of_accounts')->where('code','201-1002')->first(); // Uang Muka Penjualan
         $this->piutangDagang =  DB::table('chart_of_accounts')->where('code','102-1001')->first(); // Putang Dagang
         $this->pendapatanDagang =  DB::table('chart_of_accounts')->where('code','401-1001')->first(); // Pendapatan Dagang
         $this->HPP =  DB::table('chart_of_accounts')->where('code','501-1001')->first(); // HPP
         $this->accKas = DB::table('chart_of_accounts')->where('code','101-1000')->first(); // KAS
         $this->accHutang = DB::table('chart_of_accounts')->where('code','201-1001')->first(); // Hutang


         $this->saldoAwal =  DB::table('chart_of_accounts')->where('code','301-1001')->first();
         $this->biayaSelisih =  DB::table('chart_of_accounts')->where('code','601-1006')->first();
         $this->accPersediaanExternal = DB::table('chart_of_accounts')->where('code','103-1002')->first(); // 103-1002
         $this->accPersediaanInternal = DB::table('chart_of_accounts')->where('account','Persediaan Internal')->first(); // 103-1003

         $this->accDiskon =  DB::table('chart_of_accounts')->where('code','501-2001')->first();
         $this->accExpedisi = DB::table('chart_of_accounts')->where('code','401-2001')->first();
         // 501-2001
    }

    public function stockOpname($opname){
        $number = $this->generateJournalNumber();

        try {

            DB::beginTransaction();

            $transactionType =  DB::table('transaction_types')->where('code','08')->first();

            $payload = [
                'transaction_date' =>now(),
                'transaction_number' => $number,
                'transaction_type' => $transactionType->id,
                'entry_no'  => 0,
                'ref_id' => $opname->id,
                'ref_no' => $opname->opname_number,
                'memo' => $transactionType->name,
                'total_debit' => 0,
                'is_manual' => 0,
                'total_credit' =>0
            ];

            $id = DB::table('journal_transactions')->insertGetId($payload);

            $detail = StockOpnameDetail::where('stock_opname_id',$id)->get();

            // INSERT to Product Location
            foreach($detail as $item){
                 // Update Product location tobe 0, and only from stock opname have

                DB::table('product_locations')->where('id',$item->product_location_id)
                                                ->update([
                                                        'qty_onhand' => $item->qty_actual
                                                ]);
                }

            foreach($detail as $item) {
                $dataTransaction = [];

                if($item->qty_onhand == 0 && $item->qty_difference == 0){
                    // Saldo Awal

                    $dataTransaction = [
                        [
                            'journal_id' => $id,
                            'account_id' => $this->accPersediaanInternal->id,
                            'debit'    => $item->total,
                            'credit' =>  0,
                            'is_manual' => 0,
                            'created_at' => now(),
                        ],
                        [
                            'journal_id' => $id,
                            'account_id' => $this->saldoAwal->id,
                            'debit'    => 0,
                            'credit' => $item->total,
                            'is_manual' => 0,
                            'created_at' => now(),
                        ]
                    ];
                } else if($item->qty_onhand != 0 && $item->qty_difference > 0){
                    // jika +
                    $dataTransaction = [
                        [
                            'journal_id' => $id,
                            'account_id' => $this->accPersediaanInternal->id,
                            'debit'    => $item->total,
                            'credit' =>  0,
                            'is_manual' => 0,
                            'created_at' => now(),
                        ],
                        [
                            'journal_id' => $id,
                            'account_id' => $this->biayaSelisih->id, // atau biaya selisih stock
                            'debit'    => 0,
                            'credit' => $item->total,
                            'is_manual' => 0,
                            'created_at' => now(),
                        ]
                    ];
                } else {
                    // minus

                    $dataTransaction = [
                        [
                            'journal_id' => $id,
                            'account_id' => $this->biayaSelisih->id,
                            'debit'    => $item->total,
                            'credit' =>  0,
                            'is_manual' => 0,
                            'created_at' => now(),
                        ],
                        [
                            'journal_id' => $id,
                            'account_id' => $this->accPersediaanInternal->id, // atau biaya selisih stock
                            'debit'    => 0,
                            'credit' => $item->total,
                            'is_manual' => 0,
                            'created_at' => now(),
                        ]
                    ];
                }

                DB::table('journal_details')->insert($dataTransaction);
            }

            DB::commit();

            } catch(\Exception $e){
                throw $e;
                DB::rollback();
                throw $e;
            }
    }
    public function printJurnal($id,$type){

       $noRef = DB::table('purchase_orders')->where('id',$id)->first()->order_number;

    //    $header = DB::table('journal_transactions as t')
    //             ->select('t.id')
    //             ->addSelect('t.transaction_date as Date','t.memo as DescriptionOrAccountTitle')
    //             ->addSelect(DB::raw("null as AmountDebit"))
    //             ->addSelect(DB::raw("null as AmountKredit"))
    //             ->addSelect("t.ref_no AS Reference")
    //             ->addSelect(DB::raw("null as IsLine"))
    //             ->join('transaction_types as type','t.transaction_type','type.id')
    //             ->where(function ($query) use ($id,$type){
    //                 $query->where('t.ref_id', $id);
    //                 $query->where('type.scope', $type);
    //              });


    //     $detail = DB::table('journal_transactions as t')
    //             ->select('t.id')
    //             ->addSelect(DB::raw("null as Date"))
    //             ->addSelect('coa.account as DescriptionOrAccountTitle','detail.debit as AmountDebit','detail.credit as AmountKredit')
    //             ->addSelect("t.ref_no AS Reference")
    //             ->addSelect(DB::raw("null as IsLine"))
    //             ->join('journal_details as detail','detail.journal_id','t.id')
    //             ->join("chart_of_accounts as coa",'coa.id','detail.account_id')
    //             ->join('transaction_types as type','t.transaction_type','type.id')
    //             ->where(function ($query) use ($id,$type){
    //                 $query->where('t.ref_id', $id);
    //                 $query->where('type.scope', $type);
    //              });

      //    $data = DB::query()->fromSub($query, 'union_join')->get();

      $data = DB::select('call sp_jurnal(?,?)',[$id,$type]);

      return $data;
    }
    public function generateJournalNumber() : string
    {
        $sq = DB::table('journal_transactions')->max('id');
        $year = substr(date("y"),-2);
        $month = date("m");
        $no = str_pad($sq+1,4,"0",STR_PAD_LEFT);


        return 'GL-'.$year.$month.'-'.$no;

    }

    public function paidSales($sales,$payment)
    {
        $number = $this->generateJournalNumber();

        try {

            DB::beginTransaction();

            $transactionType =  DB::table('transaction_types')->where('code','06')->first();

            $payload = [
                'transaction_date' =>now(),
                'transaction_number' => $number,
                'transaction_type' => $transactionType->id,
                'entry_no'  => 0,
                'ref_id' => $sales->id,
                'ref_no' => $sales->order_number,
                'memo' => $transactionType->name,
                'total_debit' => $payment->total_amount,
                'is_manual' => 0,
                'total_credit' => $payment->total_amount
            ];

            $id = DB::table('journal_transactions')->insertGetId($payload);

            $dataTransaction = [
                [
                    'journal_id' => $id,
                    'account_id' => $sales->account_cost,
                    'debit'    => $payment->total_amount,
                    'credit' =>  0,
                    'is_manual' => 0,
                    'created_at' => now(),
                ],
                [
                    'journal_id' => $id,
                    'account_id' => $this->piutangDagang->id,
                    'debit'    => 0,
                    'credit' => $payment->total_amount,
                    'is_manual' => 0,
                    'created_at' => now(),
                ]
            ];

            DB::table('journal_details')->insert($dataTransaction);

            DB::commit();

            } catch(\Exception $e){
                DB::rollback();
                throw $e;
            }

    }
    public function goodReceiveJournalEntry($receive)
    {


        $goodReceiptDetail = DB::table('goods_receipt_details')->where('good_receipt_id',$receive->id)->get();

        $inventoryValue = 0;

        foreach ($goodReceiptDetail as $value){

            $inventoryValue +=(int)$value->qty_in * (int)$value->price;
        }

        $number = $this->generateJournalNumber();

        try {

            DB::beginTransaction();

            $transactionType =  DB::table('transaction_types')->where('code','04')->first();


            $payload = [
                'transaction_date' => $receive->receipt_date,
                'transaction_number' => $number,
                'transaction_type' => $transactionType->id,
                'entry_no'  => 0,
                'ref_id' => $receive->purchase_order_id, // order id
                'ref_no' => $receive->code,
                'memo' => $transactionType->name,
                'total_debit' => $inventoryValue,
                'is_manual' => 0,
                'total_credit' => $inventoryValue
            ];

            $id = DB::table('journal_transactions')->insertGetId($payload);

            $dataTransaction = [
                [
                    'journal_id' => $id,
                    'account_id' => $this->accPersediaanInternal->id,
                    'debit'    => $inventoryValue,
                    'credit' =>  0,
                    'is_manual' => 0,
                    'created_at' => now(),
                ],
                [
                    'journal_id' => $id,
                    'account_id' => $this->accPersediaanExternal->id,
                    'debit'    => 0,
                    'credit' => $inventoryValue,
                    'is_manual' => 0,
                    'created_at' => now(),
                ]
            ];

            DB::table('journal_details')->insert($dataTransaction);

            DB::commit();

            } catch(\Exception $e){
                throw $e;
                DB::rollback();
                throw $e;
            }

    }
    public function paidPurchase($purchase,$payment)
    {
        $number = $this->generateJournalNumber();
        try {

            DB::beginTransaction();

            $transactionType =  DB::table('transaction_types')->where('code','03')->first();
            $payload = [
                'transaction_date' => $purchase->order_date,
                'transaction_number' => $number,
                'transaction_type' => $transactionType->id,
                'entry_no'  => 0,
                'ref_id' => $purchase->id,
                'ref_no' => $purchase->order_number,
                'memo' => $transactionType->name,
                'total_debit' => $payment->amount,
                'is_manual' => 0,
                'total_credit' => $payment->amount
            ];

            $id = DB::table('journal_transactions')->insertGetId($payload);

            $dataTransaction = [
                [
                    'journal_id' => $id,
                    'account_id' => $this->accHutang->id,
                    'debit'    => $payment->amount,
                    'credit' =>  0,
                    'is_manual' => 0,
                    'created_at' => now(),
                ],
                [
                    'journal_id' => $id,
                    'account_id' => $payment->account_credit,
                    'debit'    => 0,
                    'credit' => $payment->amount,
                    'is_manual' => 0,
                    'created_at' => now(),
                ]
            ];

            DB::table('journal_details')->insert($dataTransaction);
            DB::commit();

            } catch(\Exception $e){
                DB::rollback();
                throw $e;
            }
    }

    public function purchaseWithDownpaymentJournalEntry($purchase)
    {

        $number = $this->generateJournalNumber();

        try {

            DB::beginTransaction();

            $transactionType =  DB::table('transaction_types')->where('code','02')->first();
            $payload = [
                'transaction_date' => $purchase->order_date,
                'transaction_number' => $number,
                'transaction_type' => $transactionType->id, // Order Pembelian + Uang Muka
                'entry_no'  => 0,
                'ref_id' => $purchase->id,
                'ref_no' => $purchase->order_number,
                'memo' => $transactionType->name,
                'total_debit' => $purchase->total,
                'is_manual' => 0,
                'total_credit' => $purchase->total
            ];

            $id = DB::table('journal_transactions')->insertGetId($payload);

            $dataTransaction = [
                [
                    'journal_id' => $id,
                    'account_id' => $this->accPersediaanExternal->id,
                    'debit'    => $purchase->total,
                    'credit' => 0,
                    'is_manual' => 0,
                    'created_at' => now(),
                ],
                [
                    'journal_id' => $id,
                    'account_id' => $this->accHutang->id,
                    'debit'    => 0,
                    'credit' => (int)$purchase->total - (int)$purchase->total_amount,
                    'is_manual' => 0,
                    'created_at' => now(),
                ],
                [
                    'journal_id' => $id,
                    'account_id' => $purchase->account_cost,
                    'debit'    => 0,
                    'credit' => $purchase->total_amount,
                    'is_manual' => 0,
                    'created_at' => now(),
                ]
            ];

            DB::table('journal_details')->insert($dataTransaction);
            DB::commit();

            } catch(\Exception $e){
                DB::rollback();
                throw $e;
            }
    }
    public function purchaseWithoutDownpaymentJouralEntry($purchase)
    {
        $number = $this->generateJournalNumber();

        try {

            DB::beginTransaction();

            $transactionType =  DB::table('transaction_types')->where('code','01')->first();
            $payload = [
                'transaction_date' => $purchase->order_date,
                'transaction_number' => $number,
                'transaction_type' => $transactionType->id,
                'entry_no'  => 0,
                'ref_id' => $purchase->id,
                'ref_no' => $purchase->order_number,
                'memo' => $transactionType->name,
                'total_debit' => $purchase->total,
                'is_manual' => 0,
                'total_credit' => $purchase->total
            ];

            $id = DB::table('journal_transactions')->insertGetId($payload);


            $dataTransaction = [
                [
                    'journal_id' => $id,
                    'account_id' => $this->accPersediaanExternal->id,
                    'debit'    => $purchase->total,
                    'credit' => 0,
                    'is_manual' => 0,
                    'created_at' => now(),
                ],
                [
                    'journal_id' => $id,
                    'account_id' => $this->accHutang->id,
                    'debit'    => 0,
                    'credit' => $purchase->total_amount,
                    'is_manual' => 0,
                    'created_at' => now(),
                ]
            ];
            #dd($dataTransaction);
            DB::table('journal_details')->insert($dataTransaction);
            DB::commit();

            } catch(\Exception $e){
                DB::rollback();
                throw $e;
            }
    }
    public function updatePurchaseJournalEntry($data)
    {
        // purhcase bayar db
        // purchase pelunasan
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
    public function deliveryJournalEntry($data,$is_manual,$mode){

    }
    public function salesJournalEntry($data,$is_manual,$mode)
    {
        if($mode != 'no-journal'){
            try {

                DB::beginTransaction();
                $transactionType =  DB::table('transaction_types')->where('code','05')->first();
                $sq = DB::table('journal_transactions')->max('id');
                $year = substr(date("y"),-2);
                $month = date("m");
                $no = str_pad($sq+1,4,"0",STR_PAD_LEFT);

                $payload = [
                    'transaction_date' => $data->order_date,
                    'transaction_number' => 'GL-'.$year.$month.'-'.$no,
                    'transaction_type' => $transactionType->id,
                    'ref_no' => $data->order_number,
                    'ref_id' => $data->id,
                    'entry_no' => 0,
                    'memo' => $transactionType->name,
                    'total_debit' => $data->total_amount,
                    'is_manual' => $is_manual,
                    'total_credit' => $data->total_amount
                ];

                $id = DB::table('journal_transactions')->insertGetId($payload);
                //$dataTransaction = [];
                $dataTransaction = [
                    [
                        'journal_id' => $id,
                        'account_id' => $this->piutangDagang->id,
                        'debit'    => $data->total_amount,
                        'credit' => 0,
                        'is_manual' => $is_manual,
                        'created_at' => now(),
                    ],
                    [
                        'journal_id' => $id,
                        'account_id' => $this->pendapatanDagang->id,
                        'debit'    => 0,
                        'credit' => $data->total_amount - $data->expedisi, // - ongkir TODO:
                        'is_manual' => $is_manual,
                        'created_at' => now(),
                    ],
                    [
                        'journal_id' => $id,
                        'account_id' => $this->HPP->id,
                        'debit'    => $data->total_hpp,
                        'credit' => 0,
                        'is_manual' => $is_manual,
                        'created_at' => now(),
                    ],
                    [
                        'journal_id' => $id,
                        'account_id' => $this->accPersediaanInternal->id, // TODO:
                        'debit'    => 0,
                        'credit' => $data->total_hpp,
                        'is_manual' => $is_manual,
                        'created_at' => now(),
                    ],

                 ];

                ## Jika ada diskon dan expedisi
                if($data->expedisi != 0){
                    $dataExpedisi = [
                        [
                            'journal_id' => $id,
                            'account_id' => $this->accExpedisi->id,
                            'debit'    => 0,
                            'credit' => $data->expedisi,
                            'is_manual' => $is_manual,
                            'created_at' => now(),
                        ]
                    ];

                    $dataTransaction = array_merge($dataTransaction,$dataExpedisi);


                }
                if($data->diskon != 0){
                    $dataDiskon =[
                        [
                            'journal_id' => $id,
                            'account_id' => $this->accDiskon->id,
                            'debit'    => $data->diskon,
                            'credit' => 0,
                            'is_manual' => $is_manual,
                            'created_at' => now(),
                        ]
                    ];

                    $dataTransaction = array_merge($dataTransaction,$dataDiskon);
                };

                DB::table('journal_details')->insert($dataTransaction);

                if($mode == 'paid'){
                     $this->paidSales((object)$data,(object)$data);
                } else {
                    // TODO:
                }

                DB::commit();
            } catch(\Exception $e){
                throw $e;
                DB::rollback();
                throw $e;
            }
        }

    }

    public function purchaseJournalEntry($data,$is_manual)
    {
        // bisa jg pakai list debit dan list credit need refactor later
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
            case 'delivery' :
                // Debit
                $uangMukaDebit = DB::table('chart_of_accounts')->where('code','201-1002')->first(); // Uang Muka Penjualan

                $hargaPokokDebit = DB::table('chart_of_accounts')->where('code','501-1001')->first();

                // Kredit
                $persediaanDagangKredit = DB::table('chart_of_accounts')->where('code','103-1001')->first();

                $pendapatanDagangKredit = DB::table('chart_of_accounts')->where('code','401-1001')->first(); // Pendapatan Dagang

                $pendapatanOngkir =  DB::table('chart_of_accounts')->where('code','401-2001')->first();



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
                'is_manual' => $is_manual,
                'total_credit' => $data->total_amount
            ];

            $id = DB::table('journal_transactions')->insertGetId($payload);

            if($data->module == 'delivery'){

                $dataTransaction = [
                    [
                        'journal_id' => $id,
                        'account_id' => $uangMukaDebit->id,
                        'debit'    => $data->subtotal + $data->expedition_cost,
                        'credit' => 0,
                        'is_manual' => $is_manual,
                        'created_at' => now(),
                    ],
                    [
                        'journal_id' => $id,
                        'account_id' => $persediaanDagangKredit->id,
                        'debit'    => 0,
                        'credit' => $data->subtotal, // harga modal,
                        'is_manual' => $is_manual,
                        'created_at' => now(),
                    ],
                    [
                        'journal_id' => $id,
                        'account_id' => $hargaPokokDebit->id,
                        'debit'    => $data->subtotal,
                        'credit' => 0,
                        'is_manual' => $is_manual,
                        'created_at' => now(),
                    ],
                    [
                        'journal_id' => $id,
                        'account_id' => $pendapatanDagangKredit->id,
                        'debit'    => 0,
                        'credit' => $data->subtotal,
                        'is_manual' => $is_manual,
                        'created_at' => now(),
                    ],
                    [
                        'journal_id' => $id,
                        'account_id' => $pendapatanOngkir->id,
                        'debit'    => 0,
                        'credit' => $data->expedition_cost,
                        'is_manual' => $is_manual,
                        'created_at' => now(),
                    ],
                ];
            }
            else
            {
            // insert debit & kredit
                    $dataTransaction = [
                        [
                            'journal_id' => $id,
                            'account_id' => $accountDebit->id,
                            'debit'    => $data->total_amount,
                            'credit' => 0,
                            'is_manual' => $is_manual,
                            'created_at' => now(),
                        ],
                        [
                            'journal_id' => $id,
                            'account_id' => $accountCredit->id,
                            'debit'    => 0,
                            'credit' => $data->total_amount,
                            'is_manual' => $is_manual,
                            'created_at' => now(),
                        ]
                    ];
            }
            DB::table('journal_details')->insert($dataTransaction);

            DB::commit();
        } catch(\Exception $e){
            DB::rollback();
            throw $e;
        }

    }

    public function generateNeraca($data,$reportType){

        // tgl i

        $tgl_akhirNeraca =  Carbon::createFromFormat('Y-m-d', $data['tgl_perolehan'])->format('Y-m-d');

        try {
            DB::beginTransaction();
            $neraca = DB::table('table_neraca')->where('report_type',$reportType)->get();

            DB::table('table_neraca')
                ->where('report_type','N')
                ->where('id','!=',60) // laba berjalan
                ->update([
                    'debit' => 0,
                    'credit' => 0,
                    'begining_balance' => 0,
                    'ending_balance' => 0
            ]);

                foreach($neraca as $key=>$value){
                        // cari dan hitung coa yang nge group dengan neraca_id
                        // echo $value->id. '--';
                        if($value->id != 60) // laba berjalan
                        {

                            $amoutPerAccount = DB::table('journal_transactions as trans')
                            ->select('detail.account_id','coa.neraca_code','coa.saldo_normal')
                            ->selectRaw('ifnull(sum(detail.debit),0) as debit,ifnull(sum(detail.credit),0) as credit')
                            ->join('journal_details as detail','detail.journal_id','trans.id')
                            ->join('chart_of_accounts as coa','coa.id','detail.account_id')
                            ->where('coa.neraca_code',$value->id)
                            ->whereRaw("DATE_FORMAT(trans.transaction_date, '%Y-%m-%d') <= '" . $tgl_akhirNeraca . "'")
                            ->groupBy('detail.account_id','coa.neraca_code','coa.saldo_normal')
                            ->get();

                        foreach($amoutPerAccount as $amount)
                        {
                            $saldoNormal = 0;

                            if($amount->saldo_normal == 'D'){
                                 $saldoNormal = $amount->debit - $amount->credit;
                            } else {
                                 $saldoNormal =  $amount->credit - $amount->debit;
                            }
                            // TODO:
                            DB::transaction(function() use ($amount,$saldoNormal){
                                DB::table('table_neraca')
                                ->where('account_id',$amount->account_id)
                                ->update([
                                    'debit' => $amount->debit,
                                    'credit' => $amount->credit,
                                    'ending_balance' => $saldoNormal,
                                ]);
                                DB::commit();
                            });

                        }
                        $debit = DB::table('journal_transactions as trans')
                                    ->join('journal_details as detail','detail.journal_id','trans.id')
                                    ->join('chart_of_accounts as coa','coa.id','detail.account_id')
                                    ->where('coa.neraca_code',$value->id)
                                    ->whereRaw("DATE_FORMAT(trans.transaction_date, '%Y-%m-%d') <= '" . $tgl_akhirNeraca . "'")
                                    ->sum('detail.debit');
                        $credit = DB::table('journal_transactions as trans')
                                    ->join('journal_details as detail','detail.journal_id','trans.id')
                                    ->join('chart_of_accounts as coa','coa.id','detail.account_id')
                                    ->where('coa.neraca_code',$value->id)
                                    ->whereRaw("DATE_FORMAT(trans.transaction_date, '%Y-%m-%d') <= '" . $tgl_akhirNeraca . "'")
                                    ->sum('detail.credit');

                        if($value->column_position === 'RIGH'){
                            $pengurang = (int)$credit - (int)$debit;
                        } else {

                            $pengurang =  (int)$debit - (int)$credit; // fixme:
                        }

                        DB::transaction(function() use ($value,$debit,$credit,$pengurang){
                                DB::table('table_neraca')
                                ->where('id',$value->id)
                                ->update([
                                    'debit' => $debit,
                                    'credit' => $credit,
                                    'ending_balance' => $pengurang
                                ]);
                                DB::commit();
                        });
                        //exit;

                        // untuk total sudah benar, tinggal counting per account nya
                        $totalAsset = DB::table('table_neraca')->whereIn('id',[5,8,11,14])
                            ->sum('ending_balance');
                        $totalLiability = DB::table('table_neraca')->whereIn('id',[53,54,55,56,57,58,59,60])
                            ->sum('ending_balance');

                        DB::transaction(function() use ($totalAsset,$totalLiability){
                                DB::table('table_neraca')
                                ->where('id',18)
                                ->update([
                                    'debit' => 0,
                                    'credit' => 0,
                                    'ending_balance' => $totalAsset
                                ]);

                                DB::table('table_neraca')
                                ->where('id',78)
                                ->update([
                                    'debit' => 0,
                                    'credit' => 0,
                                    'ending_balance' => $totalLiability
                                ]);
                                DB::commit();
                        });

                        DB::commit();
                        }


                } // end foreach


             } catch (\Exception $e) {
                DB::rollback();
                throw $e;
            }
    }
    public function generateRugiLaba($data,$reportType,$tgl_awal,$tgl_akhir,$generateFrom) : void
     {

        try {
            DB::beginTransaction();
            $neraca = DB::table('table_neraca')->where('report_type',$reportType)->get();
            DB::table('table_neraca')
                ->where('report_type','L')
                ->where('id',60) // laba berjalan
                ->update([
                    'debit' => 0,
                    'credit' => 0,
                    'begining_balance' => 0,
                    'ending_balance' => 0
            ]);

            foreach($neraca as $key=>$value){
                $amoutPerAccount = [];

                    // listed per id table neraca
                    $amoutPerAccount = DB::table('journal_transactions as trans')
                        ->select('detail.account_id','coa.neraca_code','coa.saldo_normal')
                        ->selectRaw('ifnull(sum(detail.debit),0) as debit,ifnull(sum(detail.credit),0) as credit')
                        ->join('journal_details as detail','detail.journal_id','trans.id')
                        ->join('chart_of_accounts as coa','coa.id','detail.account_id')
                        ->where('coa.neraca_code',$value->id)
                        ->where(function($query) use ($generateFrom,$tgl_awal,$tgl_akhir){
                            if($generateFrom == 'N'){
                                $query->whereRaw("DATE_FORMAT(trans.transaction_date, '%Y-%m-%d') <= '" . $tgl_awal . "'");
                            } else {
                                $query->whereRaw("DATE_FORMAT(trans.transaction_date, '%Y-%m-%d') >= '" . $tgl_awal . "' AND DATE_FORMAT(trans.transaction_date, '%Y-%m-%d') <= '" . $tgl_akhir . "'");
                            }

                        })
                        ->groupBy('detail.account_id','coa.neraca_code','coa.saldo_normal')->get();


                            foreach($amoutPerAccount as $amount)
                            {
                                $endingBalanace = 0;
                                //$endingBalanace = $amount->debit == 0 ? $amount->credit :  ($amount->debit - $amount->credit);
                                    if($amount->debit > $amount->credit){
                                        $endingBalanace = $amount->debit - $amount->credit;
                                    } else {
                                        $endingBalanace = $amount->credit - $amount->debit;
                                    }

                                    DB::transaction(function() use ($amount,$endingBalanace){
                                            DB::table('table_neraca')
                                                ->where('account_id',$amount->account_id)
                                                ->update([
                                                    'debit' => $amount->debit,
                                                    'credit' => $amount->credit,
                                                    'ending_balance' => $endingBalanace
                                                ]);
                                            DB::commit();
                                    });

                                // echo '<pre>'; print('Credit :'.$amount->account_id); echo '<pre>';
                                // echo '<pre>'; print('Credit :'.$amount->credit); echo '<pre>';
                                // echo '<pre>'; print('Hasil :'.$endingBalanace); echo '<pre>';
                                // dd($endingBalanace);
                            }


                }

                    DB::commit();
                } catch (\Exception $e) {
                    DB::rollback();
                    throw $e;
                }

                DB::transaction(function(){

                    $totalPendapatan =  DB::table('table_neraca as neraca')
                            ->join('chart_of_accounts as coa','coa.id','neraca.account_id')
                            ->where('coa.neraca_code','61')
                            ->sum('neraca.ending_balance');

                     DB::table('table_neraca')
                            ->where('id', 61)
                            ->update(['ending_balance' => $totalPendapatan]);

                    $totalHpp = DB::table('table_neraca as neraca')
                            ->join('chart_of_accounts as coa','coa.id','neraca.account_id')
                            ->where('coa.neraca_code','65')
                            ->sum('neraca.ending_balance');

                    DB::table('table_neraca')
                            ->where('id', 65)
                            ->update(['ending_balance' => $totalHpp]);

                    $totalBiaya = DB::table('table_neraca as neraca')
                                ->join('chart_of_accounts as coa','coa.id','neraca.account_id')
                                ->where('coa.neraca_code','69')
                                ->sum('neraca.ending_balance');

                    DB::table('table_neraca')
                                ->where('id', 69)
                                ->update(['ending_balance' => $totalBiaya]);

                    $labaKotor = (int)$totalPendapatan - (int)$totalHpp;
                    DB::table('table_neraca')
                            ->where('id', 68)
                            ->update(array('ending_balance' => $labaKotor));

                    $labaBersih = (int)$labaKotor - (int)$totalBiaya;

                    // update laba bersih, laba berjalan
                    DB::table('table_neraca')
                        ->whereIn('id',[60,76])
                        ->update(array('ending_balance' => $labaBersih));


                    DB::commit();
                });
    }
}
