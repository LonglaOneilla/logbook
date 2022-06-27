<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateClassLogbookEntryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('logbook_entry', function (Blueprint $table) {
            $table->id();
            $table->string('logbookID');
            $table->string('T_email');
            $table->string('courseId');
            $table->date('date');
            $table->time('startTime');
            $table->time('endTime');
            $table->integer('hours');
            $table->string('Status'); //represents seignature status, either pending or signed.
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
        Schema::dropIfExists('class__logbook_entry');
    }
}
