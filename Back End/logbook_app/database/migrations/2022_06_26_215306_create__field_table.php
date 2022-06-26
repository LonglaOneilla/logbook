<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFieldTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('_field', function (Blueprint $table) {
            $table->id();
            $table->string('classId'); //class id will include accronym and level eg SWE1
            $table->string('className');
            $table->string('Cyvle'); //eg btech, masters, etc
            $table->string('Level');
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
        Schema::dropIfExists('_field');
    }
}
