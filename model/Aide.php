<?php

namespace model;
use Illuminate\Database\Eloquent\Model;

class Aide extends Model {
    protected $table = 'orni_aide';
    protected $primaryKey = 'Id_aide';
    public $timestamps = false;


    public function question()
    {
        return $this->belongsTo('model\Question', 'Id_aide');
    }

//    public function photo()
//    {
//        return $this->hasMany('model\Photo', 'id_photo');
//    }

}
?>