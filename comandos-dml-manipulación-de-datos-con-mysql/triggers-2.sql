USE VENTAS_JUGOS;

/*
 CREA UN DISPARADOR QUE SE ACTIVA AL INSERTAR NUEVOS REGISTROS EN LA TB tb_items_facturas1
 BORRA LOS REGISTROS ANTERIORES Y POSTERIORMENTE  CALCULA LA FACTURACION TOTAL
*/

DELIMITER //
CREATE TRIGGER tg_facturacion_insert
AFTER INSERT ON tb_items_facturas1
FOR EACH ROW BEGIN
	DELETE FROM tb_facturacion;
	INSERT INTO
		tb_facturacion
		(
			SELECT
				a.fecha,
				SUM(b.cantidad * b.precio) AS FACTURACION
			FROM
				tb_factura1 a
				INNER JOIN
				tb_items_facturas1 b
				ON a.numero = b.numero
			GROUP BY a.fecha
		);
END //

-- AGREGA NUEVOS REGISTROS A LA TB tb_factura1
INSERT INTO tb_factura1
VALUES ('0103','2021-01-01','1471156710','235',0.10);

INSERT INTO tb_factura1
VALUES ('0104','2021-01-01','1471156710','235',0.10);

-- AGREGA NUEVOS REGISTROS A LA TB tb_items_facturas1
INSERT INTO tb_items_facturas1
VALUES
(
	'0103',
    '1000889',
    100,
    25
),
(
	'0103',
    '1004327',
    100,
    25
),
(
	'0103',
    '1013793',
    100,
    25
);

INSERT INTO tb_items_facturas1
VALUES
(
	'0104',
    '1000889',
    100,
    25
),
(
	'0104',
    '1004327',
    100,
    30
),
(
	'0104',
    '1013793',
    100,
    25
);

-- CONSULTA TODOS LOS REGISTROS DE LA TB tb_facturacion
SELECT * FROM tb_items_facturas1;
SELECT * FROM tb_facturacion;