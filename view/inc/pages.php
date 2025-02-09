<?php

    if(!isset($_GET['page'])){
        include("module/home/controller/controller_home.php");
    } else{
        switch ($_GET['page']) {
            case 'home':
                include("module/home/controller/controller_home.php");
                break;
            
            default:
                include("module/home/controller/controller_home.php");
                break;
        }

    }
?>