-- https://www.w3schools.com/sql/sql_ref_mysql.asp
USE jugos_ventas;

SELECT 
	(34 + 10 - 2) / (2 * 2) AS RESULTADO;
    
SELECT 
	CEILING(23.1);
    
SELECT 
	FLOOR(23.99);
    
SELECT 
	RAND();
    
SELECT 
	ROUND(25.411,2);
   
   
SELECT
	NUMERO,
    CANTIDAD,
    PRECIO,
    ROUND(CANTIDAD * PRECIO,2) AS FACTURACION
FROM
	items_facturas;