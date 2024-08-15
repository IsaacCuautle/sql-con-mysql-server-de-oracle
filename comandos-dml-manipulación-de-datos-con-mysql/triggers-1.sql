CREATE TABLE `tb_factura1` (
  `NUMERO` varchar(5) NOT NULL,
  `FECHA` date NOT NULL,
  `DNI` varchar(11) NOT NULL,
  `MATRICULA` varchar(5) NOT NULL,
  `IMPUESTO` float DEFAULT NULL,
  PRIMARY KEY (`NUMERO`),
  KEY `FK_CLIENTE1` (`DNI`),
  KEY `FK_VENDEDOR1` (`MATRICULA`),
  CONSTRAINT `FK_CLIENTE1` FOREIGN KEY (`DNI`) REFERENCES `tb_cliente` (`DNI`),
  CONSTRAINT `FK_VENDEDOR1` FOREIGN KEY (`MATRICULA`) REFERENCES `tb_vendedor` (`MATRICULA`)
);


CREATE TABLE `tb_items_facturas1` (
  `NUMERO` varchar(5) NOT NULL,
  `CODIGO` varchar(10) NOT NULL,
  `CANTIDAD` int DEFAULT NULL,
  `PRECIO` float DEFAULT NULL,
  PRIMARY KEY (`NUMERO`,`CODIGO`),
  KEY `FK_PRODUCTO1` (`CODIGO`),
  CONSTRAINT `FK_FACTURA1` FOREIGN KEY (`NUMERO`) REFERENCES `tb_factura1` (`NUMERO`),
  CONSTRAINT `FK_PRODUCTO1` FOREIGN KEY (`CODIGO`) REFERENCES `tb_producto` (`CODIGO`)
);

SELECT * FROM tb_items_facturas1;
SELECT * FROM tb_factura1;
SELECT * FROM tb_cliente;
SELECT * FROM tb_vendedor;
SELECT * FROM tb_producto;

-- INGRESA UN REGISTRO EN LA TB factura1
INSERT INTO tb_factura1
VALUES
(
	'0100',
    '2021-01-01',
    '1471156710',
    '235',
    0.10
);

-- INGRESA UN REGISTRO EN LA TB items_factura_1
INSERT INTO tb_items_facturas1
VALUES
(
	'0100',
    '1000889',
    100,
    25
),
(
	'0100',
    '1002767',
    200,
    25
);

-- REGRESA LA FECHA Y LAS VENTAS TOTALES (FACTURACION)
SELECT
	a.fecha,
    SUM(b.cantidad * b.precio) AS FACTURACION
FROM
	tb_factura1 a
    INNER JOIN
    tb_items_facturas1 b
    ON a.numero = b.numero
GROUP BY a.fecha;