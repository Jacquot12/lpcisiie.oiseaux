<?php

namespace controller;
use model\Question;

const QUESTIONS_PAR_SS_NIVEAUX = 10;

class apiJeu {

    /**
     * Créer une nouvelle partie au niveau 1.1
     * Renvoit le json correspondant aux questions
     */
    static function createNewGame(){
        $questions = Question::select()->distinct()->orderByRaw('RAND()')->limit(QUESTIONS_PAR_SS_NIVEAUX)->get();
        echo json_encode($questions);
    }
}