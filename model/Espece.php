<?php

namespace model;
use Illuminate\Database\Eloquent\Model;

class Espece extends Model {
    protected $table = 'orni_espece';
    protected $primaryKey = 'Id_esp';
    public $timestamps = false;

}
?>