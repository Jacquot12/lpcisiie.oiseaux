<?php
/**
 * Created by PhpStorm.
 * User: ponicorn
 * Date: 02/04/15
 * Time: 16:08
 */

namespace controller;
use model\Score;
use model\Photos;
class apiScore {
    static function getScore(){
        $query = Score::select('Nom','Score')
                ->orderBy('Score','DESC')
                ->take(100)
                ->get();
        echo $query->toJson();
    }

    //Ajoute un socre SI le nombre de top score <100 ou si il est plus
    //grand que le plus petit actuel, il l'ajoute et retire alors le dernier
    //pour garder une base de 100 top score
    static function addScore($nom,$score){
        $count = Score::count();
        $minScore= Score::select('Id_score','Score')
                ->orderBy('Score','ASC')
                ->first();
        if($count<100){
            $newScore = new Score();
            $newScore->Nom = $nom;
            $newScore->Score = $score;
            $newScore->save();
        } elseif($minScore->Score<$score) {
            $newScore = new Score();
            $newScore->Nom = $nom;
            $newScore->Score = $score;
            $newScore->save();
            User::destroy($minScore->Id_score);
        }
    }
}