drop database  componentes;
create database componentes;
use componentes;


-- CREATE TABLE productos (
--     id_producto int NOT NULL,
--     nombre varchar(100) NOT NULL,
--     descripcion varchar(100) NOT NULL,
--     precio int(10) NOT NULL,
--     ciudad varchar(100) NOT NULL,
--     estado varchar(100) NOT NULL,
--     producto int NOT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE ciudades (
    id_ciudad int NOT NULL,
    nombre varchar(100) NOT NULL,
    imagen varchar(100) NOT NULL,
    UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE estados (
    id_estado int NOT NULL,
    nombre varchar(100) NOT NULL,
    imagen varchar(100) NOT NULL,
    UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tipos_ventas (
    id_tipo_venta int NOT NULL,
    nombre varchar(100) NOT NULL,
    imagen varchar(100) NOT NULL,
    UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE productos_tipo_ventas (
    tipo_venta varchar(100) NOT NULL,
    producto int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE imagenes_productos (
    producto int NOT NULL,
    id_imagen_producto int NOT NULL,
    -- nombre varchar(100) NOT NULL,
    imagen varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE productos (
    id_producto int NOT NULL,
    nombre varchar(100) NOT NULL,
    tipo varchar(100) NOT NULL,
    marca varchar(100) NOT NULL,
    descripcion varchar(100) NOT NULL,
    precio int(10) NOT NULL,
    ciudad varchar(100) NOT NULL,
    estado varchar(100) NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tipos_productos (
    id_tipo_producto int NOT NULL,
    nombre varchar(100) NOT NULL,
    imagen varchar(100) NOT NULL,
    ico varchar(100),
    UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE marcas (
    id_marca int NOT NULL,
    nombre varchar(100) NOT NULL,
    imagen varchar(100) NOT NULL,
    UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- CREATE TABLE parametros (
--     id_parametro int NOT NULL,
--     nombre varchar(100) NOT NULL,
--     imagen varchar(100) NOT NULL,
--     UNIQUE (nombre)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE especificaciones_productos (
    producto int NOT NULL,
    parametro varchar(100) NOT NULL,
    valor varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

Alter Table productos
    ADD PRIMARY KEY (id_producto),
    ADD KEY fk_ciudad (ciudad),
    ADD KEY fk_estado (estado),
    MODIFY id_producto int NOT NULL AUTO_INCREMENT, 
    AUTO_INCREMENT=1;

Alter Table ciudades
    ADD PRIMARY KEY (id_ciudad),
    MODIFY id_ciudad int NOT NULL AUTO_INCREMENT, 
    AUTO_INCREMENT=1;

Alter Table estados
    ADD PRIMARY KEY (id_estado),
    MODIFY id_estado int  NOT NULL AUTO_INCREMENT, 
    AUTO_INCREMENT=1;

Alter Table tipos_ventas
    ADD PRIMARY KEY (id_tipo_venta),
    MODIFY id_tipo_venta int  NOT NULL AUTO_INCREMENT, 
    AUTO_INCREMENT=1;

Alter Table imagenes_productos
    ADD KEY (id_imagen_producto),
    -- MODIFY id_imagen_producto int  NOT NULL AUTO_INCREMENT, 
    -- AUTO_INCREMENT=1,
    ADD KEY fk_producto (producto);


Alter Table productos
    ADD KEY fk_tipo (tipo),
    ADD KEY fk_marca (marca),
    MODIFY id_producto int  NOT NULL AUTO_INCREMENT, 
    AUTO_INCREMENT=1;

Alter Table tipos_productos
    ADD PRIMARY KEY (id_tipo_producto),
    MODIFY id_tipo_producto int  NOT NULL AUTO_INCREMENT, 
    AUTO_INCREMENT=1;

Alter Table marcas
    ADD PRIMARY KEY (id_marca),
    MODIFY id_marca int  NOT NULL AUTO_INCREMENT, 
    AUTO_INCREMENT=1;

-- Alter Table parametros
--     ADD PRIMARY KEY (id_parametro),
--     MODIFY id_parametro int  NOT NULL AUTO_INCREMENT, 
--     AUTO_INCREMENT=1;

Alter Table productos_tipo_ventas
    ADD KEY fk_tipo_venta (tipo_venta),
    ADD KEY fk_producto_tipo_venta (producto);

Alter Table especificaciones_productos
    -- ADD KEY fk_parametro (parametro),
    ADD KEY fk_producto_pri (producto);


Alter Table productos 
    ADD CONSTRAINT fk_ciudad FOREIGN KEY (ciudad) REFERENCES ciudades (nombre),
    ADD CONSTRAINT fk_estado FOREIGN KEY (estado) REFERENCES
    estados(nombre);


Alter Table productos 
    ADD CONSTRAINT fk_tipo FOREIGN KEY (tipo) REFERENCES tipos_productos (nombre),
    ADD CONSTRAINT fk_marca FOREIGN KEY (marca) REFERENCES
    marcas(nombre); 

Alter Table imagenes_productos 
    ADD CONSTRAINT fk_producto FOREIGN KEY (producto) REFERENCES productos (id_producto);

Alter Table productos_tipo_ventas
    ADD CONSTRAINT fk_tipo_venta FOREIGN KEY (tipo_venta) REFERENCES
    tipos_ventas (nombre),
    ADD CONSTRAINT fk_producto_tipo_venta FOREIGN KEY (producto) REFERENCES
    productos (id_producto);

Alter Table especificaciones_productos 
    -- ADD CONSTRAINT fk_parametro FOREIGN KEY (parametro) REFERENCES
    -- parametros(nombre),
    ADD CONSTRAINT fk_producto_pri FOREIGN KEY (producto) REFERENCES
    productos(id_producto);

INSERT INTO tipos_productos ( nombre, imagen,ico) VALUES
('Cpu','view/img/tipos/cpu.png','<i class="fa-solid fa-microchip" style="color: #2e6cd6;"></i>'),
('Gpu','view/img/tipos/gpu.png','<img class="ico" src="view/ico/tipos/gpu.png"> '),
('Placa base','view/img/tipos/placa.png','<img class="ico" src="view/ico/tipos/gpu.png"> '),
('Ram','view/img/tipos/ram.png','<img class="ico" src="view/ico/tipos/gpu.png"> '),
('Torre','view/img/tipos/torre.png','<img class="ico" src="view/ico/tipos/gpu.png"> '),
('Fuente de alimentacion','view/img/tipos/psu.png','<img class="ico" src="view/ico/tipos/gpu.png"> ');

INSERT INTO marcas ( nombre, imagen) VALUES
('Amd','view/img/marcas/amd.png'),
('Intel','view/img/marcas/intel.png'),
('Nvidia','view/img/marcas/nvidia.png'),
('Msi','view/img/marcas/msi.png'),
('Asus','view/img/marcas/asus.png'),
('Corsair','view/img/marcas/corsair.png'),
('Evga','view/img/marcas/evga.png'),
('Nzxt','view/img/marcas/nzxt.png'),
('Gskill','view/img/marcas/gskill.png');

INSERT INTO ciudades ( nombre, imagen) VALUES
('valencia','view/img/ciudades/valencia.png'),
('madrid','view/img/ciudades/madrid.png'),
('barcelona','view/img/ciudades/barcelona.png');

INSERT INTO estados ( nombre, imagen) VALUES
('nuevo','view/img/estados/nuevo.png'),
('casi nuevo','view/img/estados/casi_nuevo.png'),
('bueno','view/img/estados/bueno.png');

INSERT INTO tipos_ventas ( nombre, imagen) VALUES
('normal','view/img/tipos_ventas/normal.png'),
('subasta','view/img/tipos_ventas/subasta.png'),
('negociable','view/img/tipos_ventas/negociable.png');


INSERT INTO productos ( nombre, tipo, marca,descripcion,precio,ciudad,estado) VALUES
('Ryzen 5 5500','cpu','Amd','Procesador de medio rendimiento',100,'valencia','nuevo'),
('Ryzen 7 5800X', 'cpu', 'Amd', 'Procesador de alto rendimiento', 250, 'madrid', 'nuevo'),
('Intel Core i7-12700K', 'cpu', 'Intel', 'Procesador de 12ª generación', 320, 'barcelona', 'nuevo'),
('NVIDIA RTX 3060', 'Gpu', 'Nvidia', 'Tarjeta gráfica de 12GB', 350, 'valencia', 'casi nuevo'),
('NVIDIA RTX 3080', 'Gpu', 'Nvidia', 'Tarjeta gráfica de alto rendimiento', 750, 'madrid', 'bueno'),
('MSI B450 Tomahawk', 'Placa base', 'Msi', 'Placa base para Ryzen', 120, 'barcelona', 'nuevo'),
('ASUS ROG Strix B550-F', 'Placa base', 'Asus', 'Placa base gaming', 180, 'valencia', 'casi nuevo'),
('Corsair Vengeance 16GB', 'Ram', 'Corsair', 'Memoria Ram DDR4 3200MHz', 80, 'madrid', 'nuevo'),
('G.Skill Trident Z 32GB', 'Ram', 'Gskill', 'Memoria Ram DDR4 3600MHz', 150, 'barcelona', 'bueno'),
('NZXT H510', 'Torre', 'Nzxt', 'Caja ATX con diseño minimalista', 100, 'valencia', 'nuevo'),
('Corsair 4000D', 'Torre', 'Corsair', 'Torre con buen flujo de aire', 110, 'madrid', 'casi nuevo'),
('Corsair RM750x', 'Fuente de alimentacion', 'Corsair', 'Fuente de 750W 80+ Gold', 130, 'barcelona', 'nuevo'),
('EVGA 650W 80+ Bronze', 'Fuente de alimentacion', 'Evga', 'Fuente eficiente y económica', 80, 'valencia', 'bueno');



INSERT INTO especificaciones_productos ( producto ,parametro,valor ) VALUES

(1, 'nucleos', '6'),
(1, 'hilos', '12'),
(1, 'socket', 'AM4'),
(1, 'frecuencia base', '3.6GHz'),
(1, 'frecuencia maxima', '4.2GHz'),
(1, 'consumo', '65W'),

(2, 'nucleos', '8'),
(2, 'hilos', '16'),
(2, 'socket', 'AM4'),
(2, 'frecuencia base', '3.8GHz'),
(2, 'frecuencia maxima', '4.7GHz'),
(2, 'consumo', '105W'),


(3, 'nucleos', '12 (8P+4E)'),
(3, 'hilos', '20'),
(3, 'socket', 'LGA1700'),
(3, 'frecuencia base', '3.6GHz'),
(3, 'frecuencia maxima', '5.0GHz'),
(3, 'consumo', '125W'),


(5, 'frecuencia base', '1.44GHz'),
(5, 'frecuencia maxima', '1.71GHz'),
(5, 'memoria', '10GB'),
(5, 'tipo de memoria', 'GDDR6X'),
(5, 'consumo', '320W'),

(4, 'frecuencia base', '1.32GHz'),
(4, 'frecuencia maxima', '1.78GHz'),
(4, 'memoria', '12GB'),
(4, 'tipo de memoria', 'GDDR6'),
(4, 'consumo', '170W'),


(7, 'socket', 'AM4'),
(7, 'chipset', 'B550'),
(7, 'factor de forma', 'ATX'),
(7, 'ram soportada', 'DDR4'),


(6, 'socket', 'AM4'),
(6, 'chipset', 'B450'),
(6, 'factor de forma', 'ATX'),
(6, 'ram soportada', 'DDR4'),


(9, 'tamaño', '16GB'),
(9, 'cantidad', '2'),
(9, 'frecuencia', '3600MHz'),
(9, 'latencia', 'CL16'),


(8, 'tamaño', '8GB'),
(8, 'cantidad', '2'),
(8, 'frecuencia', '3200MHz'),
(8, 'latencia', 'CL16'),

(11, 'factor de forma', 'ATX:MicroATX:Mini-ITX'),
(11, 'altura', '450mm'),
(11, 'anchura', '220mm'),
(11, 'peso', '7Kg'),


(10, 'factor de forma', 'ATX:MicroATX:Mini-ITX'),
(10, 'altura', '460mm'),
(10, 'anchura', '210mm'),
(10, 'peso', '6.6Kg'),


(13, 'voltaje', '650W'),
(13, 'certificacion', '80+ Bronze'),
(13, 'modular', 'no'),

(12, 'voltaje', '750W'),
(12, 'certificacion', '80+ Gold'),
(12, 'modular', 'si');

INSERT INTO imagenes_productos (producto,id_imagen_producto,imagen) VALUES

(1, 1, "view/img/productos/1/1.png"),
(1, 2, 'view/img/productos/1/2.png'),
(1, 3, 'view/img/productos/1/3.png'),

(2, 1, 'view/img/productos/2/1.png'),
(2, 2, 'view/img/productos/2/2.png'),
(2, 3, 'view/img/productos/2/3.png'),

(3, 1, 'view/img/productos/3/1.png'),
(3, 2, 'view/img/productos/3/2.png'),
(3, 3, 'view/img/productos/3/3.png'),


(4, 1, 'view/img/productos/4/1.png'),
(4, 2, 'view/img/productos/4/2.png'),
(4, 3, 'view/img/productos/4/3.png'),

(5, 1, 'view/img/productos/5/1.png'),
(5, 2, 'view/img/productos/5/2.png'),
(5, 3, 'view/img/productos/5/3.png'),

(6, 1, 'view/img/productos/6/1.png'),
(6, 2, 'view/img/productos/6/2.png'),
(6, 3, 'view/img/productos/6/3.png'),

(7, 1, 'view/img/productos/7/1.png'),
(7, 2, 'view/img/productos/7/2.png'),
(7, 3, 'view/img/productos/7/3.png'),

(8, 1, 'view/img/productos/8/1.png'),
(8, 2, 'view/img/productos/8/2.png'),
(8, 3, 'view/img/productos/8/3.png'),

(9, 1, 'view/img/productos/9/1.png'),
(9, 2, 'view/img/productos/9/2.png'),
(9, 3, 'view/img/productos/9/3.png'),

(10, 1, 'view/img/productos/10/1.png'),
(10, 2, 'view/img/productos/10/2.png'),
(10, 3, 'view/img/productos/10/3.png'),

(11, 1, 'view/img/productos/11/1.png'),
(11, 2, 'view/img/productos/11/2.png'),
(11, 3, 'view/img/productos/11/3.png'),

(12, 1, 'view/img/productos/12/1.png'),
(12, 2, 'view/img/productos/12/2.png'),
(12, 3, 'view/img/productos/12/3.png'),

(13, 1, 'view/img/productos/13/1.png'),
(13, 2, 'view/img/productos/13/2.png'),
(13, 3, 'view/img/productos/13/3.png');


INSERT INTO productos_tipo_ventas ( producto , tipo_venta ) VALUES
('1','normal'),
('2','normal'),
('3','normal'),
('4','subasta'),
('5','normal'),
('6','subasta'),
('7','normal'),
('8','subasta'),
('9','normal'),
('10','normal'),
('11','subasta'),
('12','normal'),
('13','subasta');