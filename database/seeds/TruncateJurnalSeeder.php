<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TruncateJurnalSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        try {
            $this->command->info("Please Updating Data");

            DB::table('journal_transactions')->truncate();
            DB::table('journal_details')->truncate();
            DB::commit();
        } catch(\Exception $e){
            throw $e;
        }
    }
}
