drop database tienda;
create database tienda;
use tienda;


CREATE TABLE ventas (
    id_venta int NOT NULL,
    nombre varchar(100) NOT NULL,
    descripcion varchar(100) NOT NULL,
    precio int(10) NOT NULL,
    ciutat varchar(100) NOT NULL,
    estado varchar(100) NOT NULL,
    producto int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE ciutats (
    id_ciutat int NOT NULL,
    nombre varchar(100) NOT NULL,
    imatge varchar(100) NOT NULL,
    UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE estados (
    id_estado int NOT NULL,
    nombre varchar(100) NOT NULL,
    imatge varchar(100) NOT NULL,
    UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tipos_ventas (
    id_tipo_venta int NOT NULL,
    nombre varchar(100) NOT NULL,
    imatge varchar(100) NOT NULL,
    UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE ventas_tipo_ventas (
    venta int NOT NULL,
    tipo_venta int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE imagens_ventas (
    id_imagen_venta int NOT NULL,
    venta int NOT NULL,
    nombre varchar(100) NOT NULL,
    imatge varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE productos (
    id_producto int NOT NULL,
    nombre varchar(100) NOT NULL,
    tipo varchar(100) NOT NULL,
    marca varchar(100) NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tipos_productos (
    id_tipo_producto int NOT NULL,
    nombre varchar(100) NOT NULL,
    imatge varchar(100) NOT NULL,
    UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE marcas (
    id_marca int NOT NULL,
    nombre varchar(100) NOT NULL,
    imatge varchar(100) NOT NULL,
    UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE parametros (
    id_parametro int NOT NULL,
    nombre varchar(100) NOT NULL,
    imatge varchar(100) NOT NULL,
    UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE especificaciones_productos (
    producto int NOT NULL,
    parametro varchar(100) NOT NULL,
    valor varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

Alter Table ventas
    ADD PRIMARY KEY (id_venta),
    ADD KEY fk_ciutat (ciutat),
    ADD KEY fk_estado (estado),
    ADD KEY fk_producto (producto),
    MODIFY id_venta int NOT NULL AUTO_INCREMENT, 
    AUTO_INCREMENT=1;


Alter Table ciutats
    ADD PRIMARY KEY (id_ciutat),
    MODIFY id_ciutat int NOT NULL AUTO_INCREMENT, 
    AUTO_INCREMENT=1;

Alter Table estados
    ADD PRIMARY KEY (id_estado),
    MODIFY id_estado int  NOT NULL AUTO_INCREMENT, 
    AUTO_INCREMENT=1;

Alter Table tipos_ventas
    ADD PRIMARY KEY (id_tipo_venta),
    MODIFY id_tipo_venta int  NOT NULL AUTO_INCREMENT, 
    AUTO_INCREMENT=1;

Alter Table imagens_ventas
    ADD PRIMARY KEY (id_imagen_venta),
    ADD KEY fk_venta (venta),
    MODIFY id_imagen_venta int  NOT NULL AUTO_INCREMENT, 
    AUTO_INCREMENT=1;


Alter Table productos
    ADD PRIMARY KEY (id_producto),
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

Alter Table parametros
    ADD PRIMARY KEY (id_parametro),
    MODIFY id_parametro int  NOT NULL AUTO_INCREMENT, 
    AUTO_INCREMENT=1;

Alter Table ventas_tipo_ventas
    ADD KEY fk_tipo_venta (tipo_venta),
    ADD KEY fk_venta_pr (venta);

Alter Table especificaciones_productos
    ADD KEY fk_parametro (parametro),
    ADD KEY fk_producto_pri (producto);


Alter Table ventas 
    ADD CONSTRAINT fk_ciutat FOREIGN KEY (ciutat) REFERENCES ciutats (nombre),
    ADD CONSTRAINT fk_estado FOREIGN KEY (estado) REFERENCES
    estados(nombre),
    ADD CONSTRAINT fk_producto_ventas FOREIGN KEY (producto) REFERENCES
    productos(id_producto);


Alter Table productos 
    ADD CONSTRAINT fk_tipo FOREIGN KEY (tipo) REFERENCES tipos_productos (nombre),
    ADD CONSTRAINT fk_marca FOREIGN KEY (marca) REFERENCES
    marcas(nombre); 

Alter Table imagens_ventas 
    ADD CONSTRAINT fk_venta FOREIGN KEY (venta) REFERENCES ventas (id_venta);

Alter Table ventas_tipo_ventas 
    ADD CONSTRAINT fk_tipo_venta FOREIGN KEY (tipo_venta) REFERENCES
    tipos_ventas (id_tipo_venta),
    ADD CONSTRAINT fk_venta_pr FOREIGN KEY (venta) REFERENCES
    ventas (id_venta);

Alter Table especificaciones_productos 
    ADD CONSTRAINT fk_parametro FOREIGN KEY (parametro) REFERENCES
    parametros(nombre),
    ADD CONSTRAINT fk_producto_pri FOREIGN KEY (producto) REFERENCES
    productos(id_producto);

INSERT INTO tipos_productos ( nombre, imatge) VALUES
('cpu','/view/img/tipos/cpu.png'),
('gpu','/view/img/tipos/gpu.png'),
('placa base','/view/img/tipos/placa.png'),
('ram','/view/img/tipos/ram.png'),
('torre','/view/img/tipos/torre.png'),
('fuente de alimentacion','/view/img/tipos/psu.png');

INSERT INTO marcas ( nombre, imatge) VALUES
('amd','/view/img/marcas/amd.png'),
('intel','/view/img/marcas/intel.png'),
('nvidia','/view/img/marcas/nvidia.png');

INSERT INTO productos ( nombre, tipo, marca) VALUES
('ryzen 5 5500','cpu','amd');