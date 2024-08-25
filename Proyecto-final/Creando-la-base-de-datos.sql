-- CREAR LA BD empresa
CREATE SCHEMA `empresa` 
DEFAULT CHARACTER 
SET utf8mb4 COLLATE utf8mb4_es_0900_ai_ci ;

USE empresa;

-- CREA TB clientes
CREATE TABLE clientes
(
	dni VARCHAR(11) NOT NULL,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
	barrio VARCHAR(150),
    ciudad VARCHAR(150),
    estado VARCHAR(150),
    codigo_postal VARCHAR(10),
    fecha_nacimiento DATE,
    edad SMALLINT,
    sexo VARCHAR(1),
    limite_credito FLOAT,
    volumen_compra FLOAT,
    primera_compra BIT,
    
    PRIMARY KEY(DNI)
);

-- CREAR TB vendedor
CREATE TABLE `empresa`.`vendedores` (
  `matricula` VARCHAR(5) NOT NULL,
  `nombre` VARCHAR(100) NULL,
  `barrio` VARCHAR(50) NULL,
  `comision` FLOAT NULL,
  `fecha_admision` DATE NULL,
  `vaciones` BIT(1) NULL,
  PRIMARY KEY (`matricula`));

-- CREAR TB producto
CREATE TABLE productos
(
	codigo VARCHAR(10) NOT NULL,
    descripcion VARCHAR(100),
    sabor VARCHAR(50),
    tamaño VARCHAR(50),
    envase VARCHAR(50),
    precio FLOAT,
    
    PRIMARY KEY(codigo)
);

-- CREAR TB facturas
CREATE TABLE facturas
(
	numero VARCHAR(5) NOT NULL,
    fecha DATE,
    dni VARCHAR(11) NOT NULL,
    matricula VARCHAR(5) NOT NULL,
    impuesto FLOAT,
    
    PRIMARY KEY(numero),
    
    FOREIGN KEY(dni) REFERENCES clientes(dni),
    FOREIGN KEY(matricula) REFERENCES vendedores(matricula)
);

-- CREAR TB items
CREATE TABLE items
(
	numero VARCHAR(5) NOT NULL,
    codigo VARCHAR(10) NOT NULL,
    cantidad INT,
    precio FLOAT,
    
    PRIMARY KEY(codigo, numero),
    
    FOREIGN KEY (numero) REFERENCES facturas(numero),
    FOREIGN KEY (codigo) REFERENCES productos(codigo)
);

SELECT * FROM clientes;
