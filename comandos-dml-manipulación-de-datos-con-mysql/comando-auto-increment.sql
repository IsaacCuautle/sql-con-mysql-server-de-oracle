USE jugos_ventas;

-- CREAR LA TABLA DE IDENTIFICACION
CREATE TABLE tb_identificacion
(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(50) NULL,
    
    PRIMARY KEY(ID)
);

-- AGREGAR REGISTROS A LA TABLA
INSERT INTO
	tb_identificacion
    (
		descripcion
    )
VALUES 
(
	"CLIENTE A"
);

INSERT INTO
	tb_identificacion
    (
		descripcion
    )
VALUES 
(
	"CLIENTE B"
);

INSERT INTO
	tb_identificacion
    (
		descripcion
    )
VALUES 
(
	"CLIENTE C"
);

-- ELIMINA AL REGISTRO CON ID 1
DELETE FROM tb_identificacion WHERE id = 1;

-- AGREGA UN REGISTRO CON EL ID 1
INSERT INTO
	tb_identificacion
    (	
		id,
		descripcion
    )
VALUES 
(
	1,
	"CLIENTE A"
);

-- CONSULTAR REGISTROS DE LA TB identificacion
SELECT * FROM tb_identificacion;

