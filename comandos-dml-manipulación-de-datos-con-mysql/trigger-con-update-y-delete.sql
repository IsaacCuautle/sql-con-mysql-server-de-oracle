SELECT * FROM tb_facturacion;
SELECT * FROM tb_factura1;
SELECT * FROM tb_items_facturas1;

UPDATE tb_items_facturas1 SET cantidad = 900
WHERE numero = '0103' AND codigo = '1004327';

DELETE FROM tb_items_facturas1
WHERE numero = '0103' AND codigo = '1004327';

-- TRIGGER CON DELETE
DELIMITER //
CREATE TRIGGER tg_facturacion_delete
AFTER DELETE ON tb_items_facturas1
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

-- FACTURACION UPDATE
DELIMITER //
CREATE TRIGGER tg_facturacion_update
AFTER UPDATE ON tb_items_facturas1
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