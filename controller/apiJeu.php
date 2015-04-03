<?php

namespace controller;
use model\Question;
use model\SousNiveau;
use model\Aide;

// Niveau de base
const NIVEAU = 1;

//Sous-niveau de base
const SOUS_NIVEAU = 1;

const COUNTDOWN = 30;




class apiJeu {

    /**
     * Créer une nouvelle partie au niveau 1.1
     * Renvoit le json correspondant au premier sous-niveau et ses questions.
     */

    static function createNewGame(){

        //Initialisation des variables
        $config = parse_ini_file("config/gameConfig.ini");
        $questions_par_ss_niveau = $config['questions_par_ss_niveau'];
        $niveau = $config['niveau'];
        $sous_niveau = $config['sous_niveau'];
        $countdown = $config['countdown'];

        $questions = Question::select('Id_question')->distinct()
            ->orderByRaw('RAND()')
            ->limit($questions_par_ss_niveau)
            ->where('Id_sous_niveau', '=', $sous_niveau)
            ->get();
        foreach($questions as $q) {
            $q['Url'] = 'api/question/'.$q['Id_question'];
        }
        $nb_points = SousNiveau::select('Score_Validation', 'Sous_niveau_suivant', 'Description_sous_niveau', 'Question_sous_niveau', 'Nb_questions')
            ->where('Id_niveau', '=', $niveau)
            ->where('Num_sous_niveau', '=', $sous_niveau)
            ->get();

        $questions['Description_sous_niveau'] = $nb_points[0]['attributes']['Description_sous_niveau'];
        $questions['Question_sous_niveau'] = $nb_points[0]['attributes']['Question_sous_niveau'];
        $questions['Nb_questions'] = $nb_points[0]['attributes']['Nb_questions'];
        $questions['Nb_points_necessaires'] = (int)$nb_points[0]['attributes']['Score_Validation'];
        $questions['Niveau'] = $niveau;
        $questions['Sous_niveau'] = $sous_niveau;
        $questions['Sous_niveau_suivant'] = (int)$nb_points[0]['attributes']['Sous_niveau_suivant'];
        $questions['Points_sous_niveau'] = 0;
        $questions['Points_total'] = 0;
        $questions['Countdown'] = $countdown;
        echo json_encode($questions);
    }

    /**
     * Renvoit le json correspondant au niveau fournit
     *
     * @param $sous_niveau
     * L'id du sous_niveau dont on veut les infos (Sous_niveau_suivant)
     */
    static function nextLevel($sous_niveau) {

        //Initialisation des variables
        $config = parse_ini_file("config/gameConfig.ini");
        $questions_par_ss_niveau = $config['questions_par_ss_niveau'];
        $countdown = $config['countdown'];

        $nb_points = SousNiveau::select()->where('Id_sous_niveau', '=', $sous_niveau)->get();
        $questions = Question::select('Id_question')->distinct()
            ->where('Id_question', '<', 700)
            ->orderByRaw('RAND()')
            ->limit($questions_par_ss_niveau)
            ->where('Id_sous_niveau', '=', (int)$nb_points[0]['attributes']['Num_sous_niveau'])
            ->get();

        foreach($questions as $q) {
            $q['Url'] = 'api/question/'.$q['Id_question'];
        }
        $questions['Description_sous_niveau'] = $nb_points[0]['attributes']['Description_sous_niveau'];
        $questions['Question_sous_niveau'] = $nb_points[0]['attributes']['Question_sous_niveau'];
        $questions['Nb_questions'] = $questions_par_ss_niveau;
        $questions['Nb_points_necessaires'] = (int)$nb_points[0]['attributes']['Score_validation'];
        $questions['Niveau'] = (int)$nb_points[0]['attributes']['Id_niveau'];
        $questions['Sous_niveau'] = (int)$nb_points[0]['attributes']['Num_sous_niveau'];
        $questions['Id_sous_niveau'] = (int)$nb_points[0]['attributes']['Id_sous_niveau'];
        $questions['Sous_niveau_suivant'] = (int)$nb_points[0]['attributes']['Sous_niveau_suivant'];
        $questions['Countdown'] = $countdown;
        echo json_encode($questions);
    }
}