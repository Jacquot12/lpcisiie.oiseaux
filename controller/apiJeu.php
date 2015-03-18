<?php

namespace controller;
use model\Question;
use model\SousNiveau;

/**
 * Nombre de questions par sous-niveau
 */
const QUESTIONS_PAR_SS_NIVEAU = 5;

/**
 * Niveau de base
 */
const NIVEAU = 1;

/**
 * Sous-niveau de base
 */
const SOUS_NIVEAU = 1;

class apiJeu {

    /**
     * Créer une nouvelle partie au niveau 1.1
     * Renvoit le json correspondant au premier sous-niveau et ses questions.
     */
    static function createNewGame(){
        $questions = Question::select('Id_question')->distinct()->orderByRaw('RAND()')->limit(QUESTIONS_PAR_SS_NIVEAU)->where('Id_sous_niveau', '=', SOUS_NIVEAU)->get();
        foreach($questions as $q) {
            $q['Url'] = 'api/question/'.$q['Id_question'];
        }
        $nb_points = SousNiveau::select('Score_Validation', 'Sous_niveau_suivant')->where('Id_niveau', '=', NIVEAU)->where('Num_sous_niveau', '=', SOUS_NIVEAU)->get();
        $questions['Nb_questions'] = QUESTIONS_PAR_SS_NIVEAU;
        $questions['Nb_points_necessaires'] = (int)$nb_points[0]['attributes']['Score_Validation'];
        $questions['Niveau'] = NIVEAU;
        $questions['Sous_niveau'] = SOUS_NIVEAU;
        $questions['Sous_niveau_suivant'] = (int)$nb_points[0]['attributes']['Sous_niveau_suivant'];
        $questions['Utilisateur_points'] = 0;
        echo json_encode($questions);
    }

    /**
     * Renvoit le json correspondant au niveau suivant a celui fournit
     *
     * @param $niveau
     * Niveau actuel
     *
     * @param $sous_niveau
     * Sous niveau actuel
     */
    static function nextLevel($niveau, $sous_niveau) {
        $nb_points = SousNiveau::select('Id_sous_niveau', 'Sous_niveau_suivant', 'Score_Validation', 'Sous_niveau_suivant')->where('Id_niveau', '=', $niveau)->where('Num_sous_niveau', '=', $sous_niveau)->get();
        $questions = Question::select('Id_question')->distinct()->orderByRaw('RAND()')->limit(QUESTIONS_PAR_SS_NIVEAU)->where('Id_sous_niveau', '=', (int)$nb_points[0]['attributes']['Sous_niveau_suivant'])->get();
        foreach($questions as $q) {
            $q['Url'] = 'api/question/'.$q['Id_question'];
        }
        $questions['Nb_questions'] = QUESTIONS_PAR_SS_NIVEAU;
        $questions['Nb_points_necessaires'] = (int)$nb_points[0]['attributes']['Score_Validation'];
        $questions['Niveau'] = (int)$niveau;
        $questions['Sous_niveau'] = (int)$sous_niveau;
        $questions['Id_sous_niveau'] = (int)$nb_points[0]['attributes']['Id_sous_niveau'];
        $questions['Sous_niveau_suivant'] = (int)$nb_points[0]['attributes']['Sous_niveau_suivant'];
        echo json_encode($questions);
    }
}