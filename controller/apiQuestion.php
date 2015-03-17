<?php

namespace controller;
use model\Question;
use model\Q2P;
use model\SousNiveau;

class apiQuestion {
    static function getInfo($id){
        $query = Question::with('propositions')->find($id);
        foreach($query->propositions as $p){
            $res = Q2P::select('Reponse')
                    ->where('Id_question','=',$p->pivot->Id_question)
                    ->where('Id_proposition','=',$p->pivot->Id_proposition)
                    ->get();
            $p->pivot->res = $res[0]->Reponse;


        }
        echo json_encode($query);

        // photo http://www.oiseaux.net/photos/a.ancel/images/manchot.empereur.aanc.1g.jpg
    }

    static function getValide($idQuest,$idProp){
        $query = Q2P::select('Reponse')
                ->where('Id_question','=',$idQuest)
                ->where('Id_proposition','=',$idProp)
                ->get();

        if($query[0]->Reponse==1){
            echo json_encode($res=true);
        }else{
            echo json_encode($res=false);
        };
    }
}