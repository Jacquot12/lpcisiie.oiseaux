<?php

namespace controller;
use model\Question;
use model\Q2P;
use model\SousNiveau;

class apiQuestion {
    static function getInfo($id){
        $query = Question::with('propositions')->find($id);
        echo json_encode($query);

        // photo http://www.oiseaux.net/photos/a.ancel/images/manchot.empereur.aanc.1g.jpg
    }
}