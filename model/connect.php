<?php
	class connect{
		
		public static function con(){
			$servidor = "localhost";
			$usuari = "root";
			$contraseña = "";
			$base = "componentes";
			$conexio = new mysqli($servidor,$usuari,$contraseña,$base );
			return $conexio;
		}
		public static function close($conexio){
			mysqli_close($conexio);
		}
	}