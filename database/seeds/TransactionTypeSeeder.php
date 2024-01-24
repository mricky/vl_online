<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TransactionTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::transaction(function(){
            $type = [
                [
                    'id' => 1,
                    'code' => '01',
                    'scope' =>1,
                    'name' => 'Order Pembelian Non Uang Muka'
                ],
                [
                    'id' => 2,
                    'code' => '02',
                    'scope' =>1,
                    'name' => 'Order Pembelian + Uang Muka'
                ],
                [
                    'id' => 3,
                    'code' => '03',
                    'scope' =>1,
                    'name' => 'Pelunasan Uang Muka'
                ],
                [
                    'id' => 4,
                    'code' => '04',
                    'scope' =>1,
                    'name' => 'Penerimaan Barang'
                ],
                [
                    'id' => 5,
                    'code' => '05',
                    'scope' => 2,
                    'name' => 'Order Penjualan'
                ],
                [
                    'id' => 6,
                    'code' => '06',
                    'scope' =>2,
                    'name' => 'Pembayaran Piutang'
                ],
                [
                    'id' => 7,
                    'code' => '07',
                    'scope' =>3,
                    'name' => 'Jurnal Manual'
                ],
            ];

            foreach($type as $item) {
                DB::table('transaction_types')->updateOrInsert(
                    [
                        'id' => $item['id'],
                        'code' => $item['code']
                    ],
                    [
                        'code'  => $item['code'],
                        'scope' => $item['scope'],
                        'name' => $item['name']
                    ],

                );
            }
        });
    }
}
