/**
 * Affiche tout le contenu du LocalStorage dans la console.
 */
function showLocalStorage() {
    console.group("LocalStorage");
    for (var j = 0; j < localStorage.length; j++) {
        console.log('(' + typeof localStorage.getItem(localStorage.key(j)) + ') ' + localStorage.key(j) + ": " + localStorage.getItem(localStorage.key(j)));
    }
    console.groupEnd();
}

/**
 * Renvoit l'url parente de là où est appelé la fonction.
 * @return {string}
 */
function getParentUrl() {
    var parentPath = window.location.pathname.split("/");
    parentPath.pop();
    return parentPath.join("/");
}