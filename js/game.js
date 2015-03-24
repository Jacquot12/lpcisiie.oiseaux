var gameInfos = JSON.parse(localStorage.getItem("data"));
var pointSousNiveau = 0;

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

    $(document).on('click', '.proposition', function (e) {
        if ($(e.currentTarget).hasClass('selected')) {
            $(e.currentTarget).removeClass('selected');
        } else {
            $(e.currentTarget).addClass('selected');
        }
    })
});

/*
 * Countdown
  * clear l'interval
 */
$(function(data) {
    var timer = setInterval(function() {
        data.Countdown = gameInfos.Countdown--;
        $('#countdown').text(data.Countdown);
        if (data.Countdown == 0) {
            niveauSuivant();
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
    if (i < gameInfos.Nb_questions) {
        $.get(gameInfos[i].Url, function (data) {

            //$(function() {
            //    function Timer() {
            //        setTimeout(Timer, 1000) ;
            //        data.Countdown = gameInfos.Countdown--;
            //        $('#countdown').text(data.Countdown);
            //        if (data.Countdown == 0){
            //            niveauSuivant();
            //        }
            //    }
            //});

            //var timer = setInterval(function() {
            //    data.Countdown = gameInfos.Countdown--;
            //    $('#countdown').text(data.Countdown--);
            //    if (data.Countdown == 0) {
            //        niveauSuivant();
            //    }
            //}, 1000);



            shuffle(data.propositions);
            data.Num_question = i + 1;
            data.Total_questions = gameInfos.Nb_questions;
            data.Utilisateur_points = gameInfos.Utilisateur_points;
            data.Num_sous_niveau = gameInfos.Sous_niveau;
            data.Countdown = gameInfos.Countdown;
            var propsArr = data.propositions;
            for (var prop in propsArr) {
                //TODO Pour test, à retirer
                //----->
                if (propsArr[prop].pivot.res == 1) {
                    data.reponse = propsArr[prop].Espece_Ph;
                }
                //<-----
            }
            data.Niveau = gameInfos.Niveau;
            data.Description_sous_niveau = gameInfos.Description_sous_niveau;
            //TODO Appeler le bon template en fonction du type de la question
            //1 - QCM Réponse unique
            //2 - QCM Réponse multiple
            //3 - Oui/non
            //4 - Texte
            //5 - Autocomplétion
            switch (true) {
                case data.Type_Q == 1:
                    $.get('mustache/qcm', function (template) {
                        $('#main').html(Mustache.render(template, data));
                        $('#afficheAide').on('click', function () {
                            alert($('#idAide').val());
                        });
                        document.getElementById("validation").addEventListener('click', function () {
                            validerReponse(data);
                            questionSuivante(i);
                        });
                    })
                    break;
                case data.Type_Q == 2:
                    break;

                default:
                    console.log("default");
                    break;
            }
        });
    }
    else niveauSuivant();
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

    //TODO Validation des réponses
    // Defaut à faux (suivre tout pour comprendre)
    var bonneReponse = false;

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

    if (bonneReponse) {
        //TODO Retirer les 15 points ajoutés qui permettent de dépasser le nombre de points nécessaires
        data.Utilisateur_points = gameInfos.Utilisateur_points = gameInfos.Utilisateur_points + Number(data.Nb_points) + 15;
        pointSousNiveau = pointSousNiveau + Number(data.Nb_points) + 15;
        console.log(gameInfos.Utilisateur_points);
        console.log("bonne réponse");
    }
    else {
        console.log("mauvaise réponse");
    }
}

/**
 * Permet de terminer une série de questions et d'afficher le résultat.
 */
function niveauSuivant() {

    if (gameInfos.Utilisateur_points >= gameInfos.Nb_points_necessaires) {
        //alert("Félicitation, passage au niveau suivant.");
        $.get('mustache/fin_sous_niveau', function (template) {
            $('#main').html(Mustache.render(template, gameInfos));
            console.log(gameInfos);
        });

        $.get('api/game/' + gameInfos.Sous_niveau_suivant, function (data) {
            if (data.Niveau != gameInfos.Niveau) {
                //TODO Gérer le passage d'un niveau
                console.log("Niveau ++");
            }
            else {
                //TODO Gérer le passage d'un sous-niveau
                console.log("Sous-niveau ++");
                $("#next-level").click(function () {
                    gameInfos = data;
                    localStorage.setItem('data', JSON.stringify(data));
                    questionSuivante(-1);
                });

                $("#rejouer").click(function () {
                    questionSuivante(-1);
                });
            }
        })
    }
    else {
        //Nombre insuffisant de points, on recommence
        alert("Pas assez de bonne réponse, vous recommencez.");
        gameInfos.Utilisateur_points = gameInfos.Utilisateur_points - pointSousNiveau;
        pointSousNiveau = 0;
        gameInfos.Countdown = 15;
        questionSuivante(-1);
    }
}