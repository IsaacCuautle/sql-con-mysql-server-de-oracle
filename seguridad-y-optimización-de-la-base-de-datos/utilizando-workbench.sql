USE empresa;

-- SELECCIONA LOS CODIGOS DE LOS PRODUCTOS 3.75
SELECT 
	a.codigo
FROM 
	productos1 a;
    
-- CONSULTA EL CODIGO DE LOS PRODUCTOS Y SU CANTIDAD EN LA TB items_facturas 26865.99
SELECT 
	a.codigo,
    c.cantidad
FROM 
	productos1 a
    INNER JOIN
    items1 c 
    ON c.codigo = a.codigo;
    
-- CONSULTA EL CODIGO DEL PRODUCTO, LA CANTIDAD Y LA FECHA DE FACTURACION 
SELECT 
	a.codigo,
    c.cantidad,
    YEAR(b.fecha) as AÑO
FROM 
	productos1 a
    INNER JOIN
    items1 c 
    ON c.codigo = a.codigo
    INNER JOIN
    facturas1 b
    ON b.numero = c.numero;
    
-- CONSULTA EL CODIGO DEL PRODUCTO, LA CANTIDAD Y LA FECHA DE FACTURACION Y LOS AGRUPA POR CODIGO Y AÑO 120583.56
SELECT 
	a.codigo,
    SUM(c.cantidad) AS CANTIDAD,
    YEAR(b.fecha) AS AÑO
FROM 
	productos1 a
    INNER JOIN
    items1 c 
    ON c.codigo = a.codigo
    INNER JOIN
    facturas1 b
    ON b.numero = c.numero
GROUP BY a.codigo, YEAR(b.fecha)
ORDER BY a.codigo, YEAR(b.fecha);


CREATE TABLE `facturas1` (
  `numero` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `dni` varchar(11) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `matricula` varchar(5) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `impuesto` float DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;


CREATE TABLE `items1` (
  `numero` int NOT NULL,
  `codigo` varchar(10) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `cantidad` int DEFAULT NULL,
  `precio` float DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;


CREATE TABLE `productos1` (
  `codigo` varchar(10) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_es_0900_ai_ci DEFAULT NULL,
  `sabor` varchar(50) COLLATE utf8mb4_es_0900_ai_ci DEFAULT NULL,
  `tamaño` varchar(50) COLLATE utf8mb4_es_0900_ai_ci DEFAULT NULL,
  `envase` varchar(50) COLLATE utf8mb4_es_0900_ai_ci DEFAULT NULL,
  `precio` float DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;


INSERT INTO facturas1
SELECT 
	*
FROM
	facturas;
    
INSERT INTO items1
SELECT 
	*
FROM
	items;    
    
INSERT INTO productos1
SELECT 
	*
FROM
	productos;   