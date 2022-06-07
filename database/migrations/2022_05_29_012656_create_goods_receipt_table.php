<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsReceiptTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_receipt', function (Blueprint $table) {
            $table->increments('id');
            $table->string('code')->index();
            $table->integer('vendor_id');
            $table->string('purchase_order_id');
            $table->string('po_vendor')->nullable();
            $table->date('receipt_date');
            $table->string('description')->nullable();
            $table->string('created_by');
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
        Schema::dropIfExists('goods_receipt');
    }
}
