$.get('api/game', function (data) {
    //On vide le LocalStorage avant une nouvelle partie.
    localStorage.clear();

    //Chaque Url de chaque question est stockée en LS avec une variable dynamiquement générée.
    for (var i = 0; i < data.Nb_questions; i++) {
        localStorage.setItem('Question' + i, data[i].Url);
    }

    //On stocke les autres variables qui ne sont pas des objets en LS également.
    //Permet de modifier plus facilement l'api car c'est dynamique.
    for (var v in data) {
        if (typeof data[v] !== "object") {
            localStorage.setItem(v, data[v]);
        }
    }
    window.location.replace("game");
});

