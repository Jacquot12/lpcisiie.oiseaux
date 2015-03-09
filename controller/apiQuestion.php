<?php

namespace controller;
use model\Question;
use model\Q2P;
use model\SousNiveau;

class apiQuestion {
    static function getInfo($id){
        // Test de la table pivot
        // -> Trouver les propositions pour la question dont l'id est $id
        $query = Question::with('propositions')->find($id);
        echo json_encode($query);
    }
}