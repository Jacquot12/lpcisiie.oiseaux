<?php

namespace model;
use Illuminate\Database\Eloquent\Model;

class Niveau extends Model {
    protected $table = 'orni_niveau';
    protected $primaryKey = 'Id_niveau';
    public $timestamps = false;

    public function sous_niveau()
    {
        return $this->belongsTo('model\SousNiveau', 'Id_sous_niveau');
    }

}
?>