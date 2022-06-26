<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateClassClassDelegateTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('class_delegate', function (Blueprint $table) {
            $table->id();
            $table->string('stdId'); //matricule which will serve as student password
            $table->string('stdName');
            $table->string('classId'); //from table 'field'
            $table->string('std_email');//can also uniquely identify student, serve as login credential
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
        Schema::dropIfExists('class_class_delegate');
    }
}
