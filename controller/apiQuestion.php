<?php
/**
 * Created by PhpStorm.
 * User: ponicorn
 * Date: 02/03/15
 * Time: 16:47
 */
namespace controller;

class apiQuestion {
    static function getInfo(){
        $test = "tamer";
        echo json_encode($test);
    }
}