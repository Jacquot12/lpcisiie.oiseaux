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

}
?>