<?php

namespace model;
use Illuminate\Database\Eloquent\Model;

class Q2P extends Model {
    protected $table = 'orni_q2p';
    protected $primaryKey = 'Id_q2p';
    public $timestamps = false;

    public function question()
    {
        return $this->belongsToMany('model\Question', 'Id_question');
    }

    public function proposition()
    {
        return $this->belongsToMany('model\Proposition', 'Id_proposition');
    }
}
?>