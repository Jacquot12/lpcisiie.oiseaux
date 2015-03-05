<?php
/**
 * Created by PhpStorm.
 * User: ponicorn
 * Date: 02/03/15
 * Time: 16:47
 */
namespace controller;
use model\Question;
use model\Q2P;
use model\SousNiveau;

class apiQuestion {
    static function getInfo($id){
        $q = Question::select('Id_sous_niveau', 'Forme_Q', 'Type_Q', 'Nb_points', 'Temps_limite')->find($id);
        $q->Sous_niveau = SousNiveau::find($q->Id_sous_niveau);
        echo json_encode($q);
    }
}