<?php
/**
 * Created by PhpStorm.
 * User: ponicorn
 * Date: 02/04/15
 * Time: 16:08
 */

namespace model;
use Illuminate\Database\Eloquent\Model;

class Score extends Model{
    protected $table = 'orni_score';
    protected $primaryKey = 'Id_score';
    public $timestamps = false;

}