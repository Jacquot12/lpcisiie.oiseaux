$(function () {
    $.get('api/question/2', function (data) {
        $.get('mustache/qcm', function (template) {
            $('#main').append(Mustache.render(template, data));
        })
    });
});