<?php
$path = $_SERVER['DOCUMENT_ROOT']."/componentes";
include($path."/module/home/model/DAOHome.php");

if(! isset($_GET['op'])){
    include("module/home/view/home.html");
    return;
}

switch($_GET['op']){
    case 'list':
        include("module/home/view/home.html");
        break;

    case 'home_tipo_producto':
        try{
            $DAOHome = new DAOHome();
            $select_tipo_producto = $DAOHome->select_tipos_producto();
        }catch(Exception $e){
            echo json_encode("Error".$e);
        }
        echo json_encode($select_tipo_producto);
        break;
    case 'home_marca':
        try{
            $DAOHome = new DAOHome();
            $select_marca = $DAOHome->select_marcas();
        }catch(Exception $e){
            echo json_encode("Error".$e);
        }
        echo json_encode($select_marca);
        break;




    default;
    include("view/inc/error404.html");
    break;
}

