<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmployeesTable extends Migration
{
    public function up()
    {
        Schema::create('employees', function (Blueprint $table) {
            $table->increments('id');

            $table->string('NomPrenom');
            $table->string('lieuInscription')->nullable();
            $table->string('Groupe');
            $table->string('Specialite')->nullable();
            $table->string('Datedenaissance');
            $table->string('Lieudenaissance');
            $table->string('CIN')->nullable();
            $table->string('Delivree');
            $table->string('Numphone1')->nullable();
            $table->string('Numphone2');
            $table->string('DateInscription')->nullable();
            $table->string('Fraisinscrit');
            $table->string('fraisForm')->nullable();
            $table->string('etat');
            $table->string('Attestations')->nullable();	
            $table->string('casier');
            $table->string('DescriptionCandidat')->nullable();					
			$table->string('photo')->nullable();	
			 
            $table->timestamps();

            $table->softDeletes();
        });
    }
}
