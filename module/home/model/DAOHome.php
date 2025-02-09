<?php
	$path = $_SERVER['DOCUMENT_ROOT'] . '/componentes';
	include($path . "/model/connect.php");

    class DAOHome {

        function select_tipos_producto(){
            $sql = "select * from tipos_productos";
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