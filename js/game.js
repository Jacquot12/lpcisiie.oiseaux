var gameInfos = JSON.parse(localStorage.getItem("data"));
/**
 * On vérifie qu'une partie existe sinon on renvoit l'utilisateur au menu principal.
 */
if (gameInfos === null) {
    alert("Vous n'avez pas de partie active, retour au menu principal");
    window.location.replace(getParentUrl());
}

$(function () {
    var i = -1;

    questionSuivante(i);

    /**
     * Demande à l'utilisateur si il veut vraiment quitter ou rafraîchir la page.
     */
        //TODO Décommenter lorsqu'on aura bien progressé.
        //window.onbeforeunload = function (evt) {
        //    var message = 'Vous allez perdre votre progression, êtes-vous sûr de vouloir continuer ?';
        //    if (typeof evt == 'undefined') {
        //        evt = window.event;
        //    }
        //    if (evt) {
        //        evt.returnValue = message;
        //    }
        //    return message;
        //}

    $(document).on('click', '.proposition, .radio-group', function (e) {
        $(".proposition").removeClass("selected");
        $(this).addClass("selected");

        $(".radio-group").removeClass("selected");
        $(this).addClass("selected");
    });

    //$(document).on('click', '.radio-btn', function (e) {
    //    $(".radio-btn").removeClass("tamer");
    //    $(this).addClass("tamer");
    //});
});


/**
 * Countdown
 * clear l'interval
 * Source: http://stackoverflow.com/questions/13440691/jquery-chronometer-plugin
 * Demarrer le timer (pour chaque question) quand les images sont chargés
 */
var time = new Date(gameInfos.Countdown * 1000);
var timer;
$(function () {
    timer = setInterval(function () {
        $('#countdown').text(time.getSeconds());
        time = new Date(time - 1000);
        if (time < 0) {
            clearInterval(timer);
            timeOut();
        }
    }, 1000);
});

/**
 * Fonction qui affiche la question suivante. A appeler une première fois avec -1 (pour commencer à la question 0).
 *
 * @param i
 * Numéro de la question actuelle (donc l'ancienne).
 */
function questionSuivante(i) {
    i++;
    console.log(gameInfos);
    if (i < gameInfos.Nb_questions) {
        $.get(gameInfos[i].Url, function (data) {
//            console.log(data);
            shuffle(data.propositions);
            data.Num_question = i + 1;
            data.Total_questions = gameInfos.Nb_questions;
            data.Points_sous_niveau = gameInfos.Points_sous_niveau;
            data.Num_sous_niveau = gameInfos.Sous_niveau;
            data.Countdown = gameInfos.Countdown;
            var propsArr = data.propositions;
            for (var prop in propsArr) {
                if (propsArr[prop].pivot.res == 1) {
                    data.bonne_rep = propsArr[prop].url;
                    //TODO Pour test, à retirer
                    //----->
                    data.reponse = propsArr[prop].Espece_Ph;
                    //<-----
                }
            }
            data.Niveau = gameInfos.Niveau;
            data.Description_sous_niveau = gameInfos.Description_sous_niveau;
            data.Question_sous_niveau = gameInfos.Question_sous_niveau;
            //TODO Appeler le bon template en fonction du type de la question
            //1 - QCM Réponse unique
            //2 - QCM Réponse multiple
            //3 - Oui/non
            //4 - Texte
            //5 - Autocomplétion
            switch (true) {
                case data.Type_Q == 1:
                    switch (true){
                        case data.Media_Q == 1:
                            $.get('mustache/qcm_1_1', function (template) {
                                $('#on_orniQuizz').html(Mustache.render(template, data));
                                displayIndice(data);
                                boutonValidation(data, i);
                            });
                            break;

                        case data.Media_Q == 5:
                            $.get('mustache/qcm_1_5', function (template) {
                                $('#on_orniQuizz').html(Mustache.render(template, data));
                                displayIndice(data);
                                boutonValidation(data, i);
                            });
                            break;

                        case data.Media_Q == 7:
                            $.get('mustache/qcm_1_7', function (template) {
                                $('#on_orniQuizz').html(Mustache.render(template, data));
                                displayIndice(data);
                                boutonValidation(data, i);
                            });
                            break;
                    }
                    break;
                case data.Type_Q == 2:
                    break;

                case data.Type_Q == 3:
                    switch (true){
                        case data.Media_Q == 1:
                            $.get('mustache/3_1', function (template) {
                                $('#on_orniQuizz').html(Mustache.render(template, data));
                                displayIndice(data);
                                boutonValidation(data, i);
                            });
                            break;
                    }

                case data.Type_Q == 4:
                    switch (true) {
                        case data.Media_Q == 9:
                            $.get('mustache/qcm_1_9', function (template) {
                                $('#on_orniQuizz').html(Mustache.render(template, data));
                                displayIndice(data);
                                boutonValidation(data, i);
                            })
                            break;
                    }
                    break;

                case data.Type_Q == 5:
                    switch (true) {
                        case data.Media_Q == 5:
                            $.get('mustache/qcm_5_5', function (template) {
                                $('#on_orniQuizz').html(Mustache.render(template, data));
                                displayIndice(data);
                                boutonValidation(data, i);
                            })
                            break;
                    }
                    break;

                default:
                    console.log("default");
                    break;
            }
        });
    } else niveauSuivant();
}

function tmp() {
    $('.selected').each(function (e) {
        var el = $(".selected:eq(" + e + ") input:first").val();
    });
}

/**
 * Valide la réponse et attribut les points. Gère la fin d'une série de questions. Lance la question suivante.
 * Y'a moyen qu'il faille réorganiser.
 *
 * @param data
 * Les données retournées dans questionSuivante()
 *
 */
function validerReponse(data) {
    var nbQuestions = gameInfos.Nb_questions;

    // Defaut à faux (suivre tout pour comprendre)
    var bonneReponse = false;

    //TODO Validation des réponses
    switch (true) {
        case data.Type_Q == 1:

            $('.selected').each(function (e) {
                var el = $(".selected:eq(" + e + ") input.res").val();
                console.log(el);
                if (el == 0) {
                    bonneReponse = false
                }else {
                    bonneReponse = true;
                }
            });
            break;

        case data.Type_Q == 2:
            // Si au moins une reponse selectionnée, juste
            if ($('.selected').length > 0) {
                bonneReponse = true;
            } else {
                alert("Vous devez sélectionner une réponse...");
            }

            //Si une réponse est fausse, pas de point
            $('.selected').each(function (e) {
                var el = $(".selected:eq(" + e + ") input:first").val();
                if (el == 0) {
                    bonneReponse = false
                }
            });
            break;

        case data.Type_Q == 3:
            if( ($('#oui').is(':checked') && data.propositions[0].pivot.res == 1) ||
                ($('#non').is(':checked') && data.propositions[0].pivot.res == 0) ) {
                bonneReponse = true;
            }
            break;

        case data.Type_Q == 4:
            // Pareil que Type_Q = 5
            break;

        case data.Type_Q == 5:
            // Transformer en minuscules en supprimant les accents puis les majuscules.
            var to_min_user = noAccent($('#rep_text').val());
            to_min_user = to_min_user.toLowerCase();

            var to_min_rep = noAccent(data.propositions[0].Espece_Ph);
            to_min_rep = to_min_rep.toLowerCase();

            if(to_min_user === to_min_rep) {
                bonneReponse = true;
            }

            break;
    }


    if (bonneReponse) {
        //TODO Retirer les 15 points ajoutés qui permettent de dépasser le nombre de points nécessaires
        gameInfos.Points_sous_niveau = gameInfos.Points_sous_niveau + Number(data.Nb_points) + 15;
        console.log("bonne réponse");
    }
    else {
        console.log("mauvaise réponse");
    }
}

/**
 * Permet de terminer une série de questions et d'afficher le résultat.
 */
function niveauSuivant(number) {
    if (gameInfos.Points_sous_niveau || number >= gameInfos.Nb_points_necessaires) {

        $.get('api/game/' + gameInfos.Sous_niveau_suivant, function (data) {
            if (data.Niveau != gameInfos.Niveau) {
                //TODO Gérer le passage d'un niveau
                console.log("Niveau ++");
            }
            else {
                gameInfos.Points_total += gameInfos.Points_sous_niveau;
                //TODO Gérer le passage d'un sous-niveau
                $.get('mustache/fin_sous_niveau', function (template) {
                    $('#on_orniQuizz').html(Mustache.render(template, gameInfos));
                    console.log(gameInfos);
                    $("#next-level").click(function () {
                        data.Points_total = gameInfos.Points_total;
                        data.Points_sous_niveau = 0;
                        gameInfos = data;
                        localStorage.setItem('data', JSON.stringify(data));
                        questionSuivante(-1);
                    });

                    $("#rejouer").click(function () {
                        questionSuivante(-1);
                    });
                });
            }
        })
    }
    else {
        //Nombre insuffisant de points, on recommence
        alert("Pas assez de bonne réponse, vous recommencez.");
        gameInfos.Points_sous_niveau = 0;
        gameInfos.Countdown = 15;
        questionSuivante(-1);
    }
}
/**
 * Gère la fin de temps d'un niveau, et fait recommencer l'utilisateur
 */
function timeOut() {
    //alert("Temps écoulé...");
    console.log("Temps écoulé...");
    //questionSuivante(-1);
}

function displayIndice(data) {
    var $indice = data.indice.Html_indice;
    $('#afficheIndice').one('click', function () {
        $("#contenu-indice").append($indice);
        gameInfos.Points_sous_niveau = gameInfos.Points_sous_niveau-5;
    });
}

function boutonValidation(data, i) {
    document.getElementById("validation").addEventListener('click', function () {
        validerReponse(data);
        questionSuivante(i);
    });
}

function preg_replace (array_pattern, array_pattern_replace, string)  {
    var new_string = String (string);
    for (i=0; i<array_pattern.length; i++) {
        var reg_exp= RegExp(array_pattern[i], "gi");
        var val_to_replace = array_pattern_replace[i];
        new_string = new_string.replace (reg_exp, val_to_replace);
    }
    return new_string;
}

function noAccent (string) {
    var new_string = "";
    var pattern_accent = new Array("é", "è", "ê", "ë", "ç", "à", "â", "ä", "î", "ï", "ù", "ô", "ó", "ö");
    var pattern_replace_accent = new Array("e", "e", "e", "e", "c", "a", "a", "a", "i", "i", "u", "o", "o", "o");
    if (string && string!= "") {
        new_string = preg_replace(pattern_accent, pattern_replace_accent, string);
    }
    return new_string;
}