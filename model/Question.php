<?php

namespace model;
use Illuminate\Database\Eloquent\Model;

class Question extends Model {
    protected $table = 'orni_question';
    protected $primaryKey = 'Id_question';
    public $timestamps = false;

    public function sous_niveau()
    {
        return $this->belongsTo('model\SousNiveau', 'Id_sous_niveau');
    }

    public function propositions()
    {
        return $this->belongsToMany('model\Proposition', 'orni_q2p', 'Id_question', 'Id_proposition');
    }

    public function aide(){
        return $this->belongsTo('model\Aide', 'Id_aide');
    }

    public function indice(){
        return $this->belongsTo('model\Indice', 'Id_indice');
    }
}
?>