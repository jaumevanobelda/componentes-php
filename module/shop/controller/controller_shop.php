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
    case 'select_one_producto':
        try{
            $daoshop = new DAOShop();
            $select_images = $daoshop->select_product_images($_GET['id']);
        }catch(Exception $e){
            echo json_encode("Error".$e);
        }
        try{
            $daoshop = new DAOShop();
            $select_one_producto = $daoshop->select_one_producto($_GET['id']);
        }catch(Exception $e){
            echo json_encode("Error".$e);
        }
        try{
            $daoshop = new DAOShop();
            $select_specs = $daoshop->select_product_specs($_GET['id']);
        }catch(Exception $e){
            echo json_encode("Error".$e);
        }

        $resultado = array();
        $resultado[0] = $select_images;
        $resultado[1] = $select_one_producto;
        $resultado[2] = $select_specs;
        echo json_encode($resultado);
        break;

        default;
        include("view/inc/error404.html");
        break;
}