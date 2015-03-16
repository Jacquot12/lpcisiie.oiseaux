function showLocalStorage() {
    console.group("LocalStorage");
    for (var j = 0; j < localStorage.length; j++) {
        console.log(localStorage.key(j) + ": " + localStorage.getItem(localStorage.key(j)));
    }
    console.groupEnd();
}