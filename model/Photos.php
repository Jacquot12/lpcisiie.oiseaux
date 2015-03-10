<?php

namespace model;
use Illuminate\Database\Eloquent\Model;

class Photos extends Model {
    protected $table = 'ois_photos';
    protected $primaryKey = 'Num_Ph';
    public $timestamps = false;

}
?>