$(function () {
    $.get('api/question/2', function (data) {
        $.get('mustache/qcm', function (template) {
            $('#main').append(Mustache.render(template, data));
        })
    });

    $(document).on('click','.proposition',function(e){

        if($( e.currentTarget).hasClass('selected')){
            $( e.currentTarget).removeClass('selected');
        }else{
            $( e.currentTarget).addClass('selected');
        }

    })
});