<?php

namespace controller;

use model\Photos;

class apiPhotos
{
    static function getPhotos($id)
    {
        $query = Photos::select(
            'Num_Ph',
            'Espece_S_Acc',
            'Remarque1',
            'Photographe',
            'Num_Img',
            'Url_Ph'
        )->where('Espece_S_Acc', '=', $id)->get();
        echo json_encode($query);
        // photo http://www.oiseaux.net/photos/a.ancel/images/manchot.empereur.aanc.1g.jpg
    }

    static function getPhotosPhotographe($espece, $photographe)
    {
        $query = Photos::select(
            'Num_Ph',
            'Espece_S_Acc',
            'Remarque1',
            'Photographe',
            'Num_Img',
            'Url_Ph'
        )->where('Espece_S_Acc', '=', $espece)
            ->where('Photographe', '=', $photographe)
            ->get();
        echo json_encode($query);
    }

    static function getSpecificPhoto($espece, $photographe, $id)
    {
        $query = Photos::select(
            'Num_Ph',
            'Espece_S_Acc',
            'Remarque1',
            'Photographe',
            'Num_Img',
            'Url_Ph'
        )->where('Espece_S_Acc', '=', $espece)
            ->where('Photographe', '=', $photographe)
            ->where('Num_Img', '=', $id)
            ->get();
        echo json_encode($query);
    }
}