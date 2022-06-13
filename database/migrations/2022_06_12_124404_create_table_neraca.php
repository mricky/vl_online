<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableNeraca extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('table_neraca', function (Blueprint $table) {
            $table->increments('id');
            $table->string('report_type');
            $table->string('position');
            $table->integer('account_id');
            $table->string('account_label');
            $table->integer('begining_balance')->nullable()->default(0);
            $table->integer('debit')->nullable()->default(0);
            $table->integer('credit')->nullable()->default(0);
            $table->integer('ending_balance')->nullable()->default(0);
            $table->string('created_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('table_neraca');
    }
}
