<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->increments('id');
            $table->string('code')->index();
            $table->string('name')->index();
            $table->boolean('is_track_lot_number')->default(false);
            $table->integer('category_id');
            $table->integer('brand_id');
            $table->float('product_cost');
            $table->float('product_price');
            $table->integer('qty_onhand')->default(0);
            $table->integer('qty_allocated')->default(0);
            $table->integer('qty_shipped')->default(0);
            $table->string('description')->nullable();
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
       Schema::dropIfExists('products');
    }
}
