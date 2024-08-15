USE VENTAS_JUGOS;

INSERT INTO 
	ventas_jugos.tb_vendedor
    (
		MATRICULA,
        NOMBRE,
        BARRIO,
        COMISION,
        FECHA_ADMISION,
        DE_VACACIONES
    ) VALUES (
		'256',
		'FERNANDO ROUIZ',
        'OBLATOS',
        0.1,
        '2015-06-14',
        0
	);
SELECT * FROM tb_vendedor;

-- INICIA UNA TRANSACCION
START TRANSACTION;

INSERT INTO 
	ventas_jugos.tb_vendedor
    (
		MATRICULA,
        NOMBRE,
        BARRIO,
        COMISION,
        FECHA_ADMISION,
        DE_VACACIONES
    ) VALUES (
		'257',
		'FERNANDO ROJAS',
        'OBLATOS',
        0.1,
        '2015-06-14',
        0
	);
    
ROLLBACK;

UPDATE tb_vendedor SET COMISION = COMISION * 1.05;
COMMIT;