<!DOCTYPE html>
<html lang="es">
    <head> 
<?php
if(isset($_GET['page'])){
    include("view/inc/top_page_". $_GET['page'] .".html");
}else{
    include("view/inc/top_page_home.html");
}
?>
<head>
<body>
    <header>
        <?php
            include("view/inc/header.php");
        ?>
    </header>
        <?php
            include("view/inc/menu.php");
        ?>

    <div id="page">
        <?php
            include("view/inc/pages.php");
        ?>
    </div>
    <footer>
        <?php
            include("view/inc/footer.php");
        ?>
    </footer>
    <?php
        include("view/inc/bottom_page.php")
    ?>
</body>










