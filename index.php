<?php
session_start();

require 'vendor/autoload.php';
use db\connection;
use controller\checkKey;

connection::createConn();

$app = new \Slim\Slim(array(
	'mode' => 'development',
	'templates.path' => './view'
));

//$app->add(new \Slim\Middleware\SessionCookie());
$app->get('/', function () use($app) {
	$app->render('main_menu.html');
})->name('index');

$app->get('/game', function () use($app) {
	$app->render('templates/game.html');
});

$app->get('/mustache/:n',function($n) use($app) {
    $app->render('templates/'.$n.'.mustache.html');
//    echo $n.'.mustache.html';
});

$app->group('/api',function() use($app){

    $app->get('/question/:n',function($id) use($app){
        $app->response->headers->set('Content-Type', 'application/json');
        controller\apiQuestion::getInfo($id);
    });
});



$app->run();
