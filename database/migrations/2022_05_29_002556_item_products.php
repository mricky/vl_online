<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ItemProducts extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_items', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('product_id');
            $table->string('code')->index();
            $table->string('name')->index();    
            $table->integer('vendor_id');
            $table->integer('category_id');
            $table->integer('brand_id');
            $table->float('product_cost');
            $table->float('product_price');
            $table->integer('qty_onhand')->default(0);
            $table->integer('qty_allocated')->default(0);
            $table->integer('qty_shipped')->default(0);
            $table->boolean('is_track_lot_number')->default(false);
            $table->string('lot_number')->nullable();
            $table->string('description')->nullable();
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
        Schema::dropIfExists('product_items');
    }
}
