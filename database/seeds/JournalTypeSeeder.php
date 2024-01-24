<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class JournalTypeSeeder extends Seeder
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
                    'journal_scope' =>1,
                    'journal_type' => 'Order Pembelian Non Uang Muka'
                ],
                [
                    'id' => 2,
                    'journal_scope' =>1,
                    'journal_type' => 'Order Pembelian + Uang Muka'
                ],
                [
                    'id' => 3,
                    'journal_scope' =>1,
                    'journal_type' => 'Pelunasan Uang Muka'
                ],
                [
                    'id' => 4,
                    'journal_scope' =>1,
                    'journal_type' => 'Penerimaan Barang'
                ],
                [
                    'id' => 5,
                    'journal_scope' => 2,
                    'journal_type' => 'Order Penjualan'
                ],
                [
                    'id' => 6,
                    'journal_scope' =>2,
                    'journal_type' => 'Pembayaran Piutang'
                ],
            ];

            foreach($type as $item) {
                DB::table('journal_type')->updateOrInsert(
                    ['id' => $item['id']],
                    ['journal_scope' => $item['journal_scope']],
                    ['journal_type' => $item['journal_type']]
                );
            }
        });
    }
}
