USE jugos;

-- CREAR TABLA VENDEDORES
CREATE TABLE IF NOT EXISTS tabla_de_vendedores
(
	matricula VARCHAR(5),
    nombre VARCHAR(100),
    porcentaje_comision SMALLINT
);