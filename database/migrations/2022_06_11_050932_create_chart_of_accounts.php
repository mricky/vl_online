<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateChartOfAccounts extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        
        if(!Schema::hasTable('chart_of_accounts')){
            Schema::create('chart_of_accounts', function (Blueprint $table) {
                $table->increments('id');
                $table->string('code')->nullable();
                $table->integer('coa_type_id');
                $table->string('account')->nullable();
                $table->integer('debit')->nullable();
                $table->integer('credit')->nullable();
                $table->integer('begining_balance')->nullable()->default(0);
                $table->integer('ending_balance')->nullable()->default(0);
                $table->string('created_by')->nullable();
                $table->string('report_type')->nullable();
                $table->timestamps();
            });
        }
     
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('chart_of_accounts');
    }
}
