<?php
	$path = $_SERVER['DOCUMENT_ROOT'] . '/componentes';
	include($path . "/model/connect.php");

    class DAOShop {

        function select_all_productos(){

            $sql = "
            select p.*,GROUP_CONCAT(i.imagen SEPARATOR ':') AS imagen_array 
            from productos p left join imagenes_productos i on p.id_producto = i.producto
			group by p.id_producto
            ";
            $conexion = connect::con();
			$resultado = mysqli_query($conexion,$sql);
			connect::close($conexion);
            $retrArray = array();
			$i=0;
			if (mysqli_num_rows($resultado) > 0) {
				while ($row = mysqli_fetch_assoc($resultado)) {
					$retrArray[] = $row;
					$retrArray[$i]["imagen_array"] = explode(":", $row['imagen_array']) ; 
					$i = $i + 1;
				}
			}
			return $retrArray;
        }
        function select_one_producto($id){
            $sql = "SELECT *,(select ico from tipos_productos where productos.tipo = nombre ) as ico_tipo
            FROM productos
            where id_producto =" . $id;
            $conexion = connect::con();
			$resultado = mysqli_query($conexion,$sql)->fetch_object();
			connect::close($conexion);
			return $resultado;
        }
        function select_product_images($id){
            $sql = "SELECT imagen
            FROM imagenes_productos
            where producto =" . $id;
            $conexion = connect::con();
			$resultado = mysqli_query($conexion,$sql);
			connect::close($conexion);
			$retrArray = array();
			if (mysqli_num_rows($resultado) > 0) {
				while ($row = mysqli_fetch_assoc($resultado)) {
					$retrArray[] = $row;
				}
			}
			return $retrArray;
        }
        function select_product_specs($id){
            $sql = "SELECT parametro,valor
            FROM especificaciones_productos
            where producto =" . $id;
            $conexion = connect::con();
			$resultado = mysqli_query($conexion,$sql);
			connect::close($conexion);
			$retrArray = array();
			if (mysqli_num_rows($resultado) > 0) {
				while ($row = mysqli_fetch_assoc($resultado)) {
					$retrArray[] = $row;
				}
			}
			return $retrArray;
        }





        
    }