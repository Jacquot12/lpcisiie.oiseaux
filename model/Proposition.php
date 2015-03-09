<?php

namespace model;
use Illuminate\Database\Eloquent\Model;

class Proposition extends Model {
    protected $table = 'orni_proposition';
    protected $primaryKey = 'Id_proposition';
    public $timestamps = false;

    public function sous_niveau()
    {
        return $this->belongsTo('model\SousNiveau', 'Id_sous_niveau');
    }
}
?>