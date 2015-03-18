$.get('api/game', function (data) {
    //On vide le LocalStorage avant une nouvelle partie.
    localStorage.clear();

    //On stocke l'objet en JSON en LS pour le parse ensuite. Beaucoup plus simple et pratique qu'avant.
    localStorage.setItem("data", JSON.stringify(data));

    window.location.replace("game");
});

