<?php

namespace controller;
use model\Question;
use model\SousNiveau;
use model\Aide;

//TODO Mettre ça dans un .ini
/**
 * Nombre de questions par sous-niveau
 */
const QUESTIONS_PAR_SS_NIVEAU = 10;

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
        $nb_points = SousNiveau::select('Score_Validation', 'Sous_niveau_suivant', 'Description_sous_niveau', 'Question_sous_niveau', 'Nb_questions')->where('Id_niveau', '=', NIVEAU)->where('Num_sous_niveau', '=', SOUS_NIVEAU)->get();
        $questions['Description_sous_niveau'] = $nb_points[0]['attributes']['Description_sous_niveau'];
        $questions['Question_sous_niveau'] = $nb_points[0]['attributes']['Question_sous_niveau'];
        $questions['Nb_questions'] = $nb_points[0]['attributes']['Nb_questions'];
        $questions['Nb_points_necessaires'] = (int)$nb_points[0]['attributes']['Score_Validation'];
        $questions['Niveau'] = NIVEAU;
        $questions['Sous_niveau'] = SOUS_NIVEAU;
        $questions['Sous_niveau_suivant'] = (int)$nb_points[0]['attributes']['Sous_niveau_suivant'];
        $questions['Points_sous_niveau'] = 0;
        $questions['Points_total'] = 0;
        $questions['Countdown'] = 59;
        echo json_encode($questions);
    }

    /**
     * Renvoit le json correspondant au niveau fournit
     *
     * @param $sous_niveau
     * L'id du sous_niveau dont on veut les infos (Sous_niveau_suivant)
     */
    static function nextLevel($sous_niveau) {

        $nb_points = SousNiveau::select()->where('Id_sous_niveau', '=', $sous_niveau)->get();

        switch ($sous_niveau)
        {
            case 1:
                $questions = Question::select('Id_question')->distinct()->where('Id_question', '<', 1000)->orderByRaw('RAND()')->limit(QUESTIONS_PAR_SS_NIVEAU)->where('Id_sous_niveau', '=', (int)$nb_points[0]['attributes']['Sous_niveau_suivant'])->get();
                foreach($questions as $q) {
                    $q['Url'] = 'api/question/'.$q['Id_question'];
                }
                break;

            case 2:
                $questions = Question::select('Id_question')->distinct()->where('Type_Q', '=', 3)->where('Media_Q', '=', 1)->orderByRaw('RAND()')->limit(QUESTIONS_PAR_SS_NIVEAU)->where('Id_sous_niveau', '=', (int)$nb_points[0]['attributes']['Num_sous_niveau'])->get();;
                foreach($questions as $q) {
                    $q['Url'] = 'api/question/'.$q['Id_question'];
                }
                break;

            case 3:
                $questions = Question::select('Id_question')->distinct()
                    ->where('Type_Q', '=', 1)
                    ->where('Media_Q', '=', 7)
                    ->orderByRaw('RAND()')
                    ->limit(QUESTIONS_PAR_SS_NIVEAU)
                    ->where('Id_sous_niveau', '=', (int)$nb_points[0]['attributes']['Num_sous_niveau'])
                    ->get();
                foreach($questions as $q) {
                    $q['Url'] = 'api/question/'.$q['Id_question'];
                }
                break;

        }

        $questions['Description_sous_niveau'] = $nb_points[0]['attributes']['Description_sous_niveau'];
        $questions['Question_sous_niveau'] = $nb_points[0]['attributes']['Question_sous_niveau'];
        $questions['Nb_questions'] = QUESTIONS_PAR_SS_NIVEAU;
        $questions['Nb_points_necessaires'] = (int)$nb_points[0]['attributes']['Score_validation'];
        $questions['Niveau'] = (int)$nb_points[0]['attributes']['Id_niveau'];
        $questions['Sous_niveau'] = (int)$nb_points[0]['attributes']['Num_sous_niveau'];
        $questions['Id_sous_niveau'] = (int)$nb_points[0]['attributes']['Id_sous_niveau'];
        $questions['Sous_niveau_suivant'] = (int)$nb_points[0]['attributes']['Sous_niveau_suivant'];
        $questions['Countdown'] = 59;
        echo json_encode($questions);

        // ------ OLD ------
        /*$nb_points = SousNiveau::select()->where('Id_sous_niveau', '=', $sous_niveau)->get();
        $questions = Question::select('Id_question')->distinct()->where('Id_question', '<', 1000)->orderByRaw('RAND()')->limit(QUESTIONS_PAR_SS_NIVEAU)->where('Id_sous_niveau', '=', (int)$nb_points[0]['attributes']['Sous_niveau_suivant'])->get();
        foreach($questions as $q) {
            $q['Url'] = 'api/question/'.$q['Id_question'];
        }
        $questions['Description_sous_niveau'] = $nb_points[0]['attributes']['Description_sous_niveau'];
        $questions['Question_sous_niveau'] = $nb_points[0]['attributes']['Question_sous_niveau'];
        $questions['Nb_questions'] = QUESTIONS_PAR_SS_NIVEAU;
        $questions['Nb_points_necessaires'] = (int)$nb_points[0]['attributes']['Score_validation'];
        $questions['Niveau'] = (int)$nb_points[0]['attributes']['Id_niveau'];
        $questions['Sous_niveau'] = (int)$nb_points[0]['attributes']['Num_sous_niveau'];
        $questions['Id_sous_niveau'] = (int)$nb_points[0]['attributes']['Id_sous_niveau'];
        $questions['Sous_niveau_suivant'] = (int)$nb_points[0]['attributes']['Sous_niveau_suivant'];
        $questions['Countdown'] = 59;
        echo json_encode($questions);*/
    }
}