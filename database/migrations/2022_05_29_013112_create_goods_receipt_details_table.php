<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsReceiptDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_receipt_details', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('good_receipt_id');
            $table->integer('product_id')->index();
            $table->string('lot_number')->nullable();
            $table->integer('qty_in');
            $table->boolean('is_store_vendor_location')->default(false);
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
        Schema::dropIfExists('goods_receipt_details');
    }
}
