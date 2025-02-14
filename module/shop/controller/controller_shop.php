<?php
$path = $_SERVER['DOCUMENT_ROOT']."/componentes";
include($path."/module/shop/model/DAOShop.php");

if(! isset($_GET['op'])){
    include("module/shop/view/shop.html");
    return;
}
switch($_GET['op']){
    case 'list':
        include("module/shop/view/shop.html");
        break;

    case 'select_all_productos':
        try{
            $daoshop = new DAOShop();
            $select_all_productos = $daoshop->select_all_productos();
        }catch(Exception $e){
            echo json_encode("Error".$e);
        }
        echo json_encode($select_all_productos);
        break;
    case 'list_producto':
        try{
            $daoshop = new DAOShop();
            $select_one_producto = $daoshop->select_one_producto($_GET['id']);
        }catch(Exception $e){
            echo json_encode("Error".$e);
        }
        echo json_encode($select_one_producto);
        break;

        default;
        include("view/inc/error404.php");
        break;
}