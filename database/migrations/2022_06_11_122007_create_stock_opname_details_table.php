<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStockOpnameDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stock_opname_details', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('stock_opname_id');
            $table->integer('product_id');
            $table->integer('adjust_qty');
            $table->integer('adjust_cost');
            $table->integer('adjust_price');
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
         Schema::dropIfExists('stock_opname_details');
    }
}
