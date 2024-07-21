USE jugos;

-- CREAR TABLA CLIENTES 2
CREATE TABLE IF NOT EXISTS tbclientes_2(
	dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(150),
    direccion1 VARCHAR(150),
    direccion2 VARCHAR(250),
    barrio VARCHAR(50),
    ciudad VARCHAR(50),
    estado VARCHAR(50),
    cp VARCHAR(10),
    edad SMALLINT,
    sexo VARCHAR(1),
    limite_credito FLOAT,
    volumen_compra FLOAT,
    primera_compra BIT(1)
);

-- BORRAR TB'S
DROP TABLE tbclientes_2;