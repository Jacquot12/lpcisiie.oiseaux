/**
 * Created by ponicorn on 09/03/15.
 */
$(function(){
    var template;
    var dataQ;
    var question;
    $.get('api/question/2',function(data){
        dataQ = data;
    }).done($.get('mustache/qcm',function(data){
        template = data;
        question = Mustache.render(template,dataQ);
        $('#main').append(question);
    }));
});