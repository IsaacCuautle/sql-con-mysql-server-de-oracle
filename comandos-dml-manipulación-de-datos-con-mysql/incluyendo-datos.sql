USE VENTAS_JUGOS;

-- INSERTANDO DATOS
INSERT INTO 
	tb_producto
    (
		CODIGO,
        DESCRIPCION,
        SABOR,
        TAMAÑO,
        ENVASE,
        PRECIO_LISTA
    )
VALUES
	(
		'1040107',
        'Light',
        'Sandia',
        '350 ml',
        'lata',
        4.56
    );
    
-- CAMBIANDO EL ORDEN
INSERT INTO
	tb_producto
    (
		CODIGO,
        SABOR,
        DESCRIPCION,
        TAMAÑO,
        ENVASE,
        PRECIO_LISTA
    )
VALUES
	(
		'104010',
        'Guanabana',
        'Light',
        '350 ml',
        'Lata',
        4.56
    );

-- INSERCION MULTIPLE
INSERT INTO
	tb_producto
    (
		CODIGO,
        SABOR,
        DESCRIPCION,
        TAMAÑO,
        ENVASE,
        PRECIO_LISTA
    )
VALUES
	(
		'1040109',
        'Asai',
        'Light',
        '350 ml',
        'Lata',
        5.60
    ),
    (
		'1040110',
        'Manzana',
        'Light',
        '350 ml',
        'Lata',
        6.00
    ),
    (
		'1040111',
        'Mango',
        'Light',
        '350 ml',
        'Lata',
        3.50
    );