<?php

namespace model;
use Illuminate\Database\Eloquent\Model;

class SousNiveau extends Model {
    protected $table = 'orni_sous_niveau';
    protected $primaryKey = 'Id_sous_niveau';
    public $timestamps = false;

    public function sous_niveau()
    {
        return $this->belongsTo('model\Niveau', 'Id_niveau');
    }

}
?>