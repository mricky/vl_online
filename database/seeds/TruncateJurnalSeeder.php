<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use crocodicstudio\crudbooster\helpers\CRUDBooster;

class TruncateJurnalSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      $this->emptyData();
      $this->setupProductLocation();
    }

    protected function setupProductLocation(){
        $products = DB::table('products')->get();

        foreach($products as $item) {
            $this->command->info('Please wait updating the data...');
            $price = 1000;
            DB::table('product_locations')->insert(
                [
                    'product_id' => $item->id,
                    'wh_location_id' => 1,
                    'qty_onhand' => 0,
                    'product_price' => $price++,
                    'created_by' => 'seed',
                    'created_at' => date('Y-m-d H:i:s')
                ]
            );
            $this->command->info("Insert Product Lot {$item->name}");
        }
    }
    protected function emptyData(){
        try {
            $this->command->info("Please Updating Data");

            // sales
            DB::table('sales_orders')->truncate();
            DB::table('sales_order_details')->truncate();
            // purchase
            DB::table('purchase_orders')->truncate();
            DB::table('purchase_order_details')->truncate();
            // receive
            DB::table('goods_receipt')->truncate();
            DB::table('goods_receipt_details')->truncate();
            // opname
            DB::table('stock_opnames')->truncate();
            DB::table('stock_opname_details')->truncate();
            DB::table('product_locations')->truncate();

            // jurnal
            DB::table('journal_transactions')->truncate();
            DB::table('journal_details')->truncate();

            DB::table('table_neraca')->update(
                [
                    'debit' => 0,
                    'credit' => 0,
                    'ending_balance' => 0
                ]
            );
            DB::commit();
        } catch(\Exception $e){
            throw $e;
        }
    }
}
