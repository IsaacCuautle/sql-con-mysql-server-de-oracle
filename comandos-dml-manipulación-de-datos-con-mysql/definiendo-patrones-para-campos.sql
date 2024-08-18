USE VENTAS_JUGOS;

-- CREA UNA TABLA CON VALORES YA DEFINIDOS PARA ALGUNOS REGISTROS
CREATE TABLE IF NOT EXISTS tb_default 
(
	id INT AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NULL,
    ciudad VARCHAR(50) DEFAULT 'monterrey',
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    
    PRIMARY KEY(id)
);


-- INSERTA VALORES EN LA TB DEFAULT
INSERT INTO tb_default
(
	descripcion,
    direccion,
    ciudad,
    fecha_creacion
) VALUES
(
	'cliente x',
    'calle falsa 123',
    'cancun',
    '2021-01-01'
);

-- CONSULTA TODOS LOS REGISTROS DE TB DEFAULT
SELECT * FROM tb_default;


-- INSERTA SOLAMENTE VALORES QUE NO TENGAN UN PATRON DEFINIDO
INSERT INTO tb_default
(
	descripcion
) VALUES
(
	'cliente y'
);