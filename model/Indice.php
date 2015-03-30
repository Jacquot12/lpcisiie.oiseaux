<?php

namespace model;
use Illuminate\Database\Eloquent\Model;

class Indice extends Model {
    protected $table = 'orni_indice';
    protected $primaryKey = 'Id_indice';
    public $timestamps = false;


    public function question()
    {
        return $this->belongsTo('model\Question', 'Id_indice');
    }
}
?>