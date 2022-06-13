<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateJournalTransactions extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('journal_transactions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('transaction_type_id');
            $table->date('transaction_date');
            $table->string('transaction_number');
            $table->integer('entry_no');
            $table->string('ref_no')->nullable();
            $table->integer('account_id');
            $table->string('d_k');
            $table->integer('account_reverse_id');
            $table->integer('total');
            $table->string('memo')->nullable();
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
        Schema::dropIfExists('journal_transactions');
    }
}
