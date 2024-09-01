USE empresa;

-- SELECCIONA LOS CODIGOS DE LOS PRODUCTOS 3.75
SELECT 
	a.codigo
FROM 
	productos a;
    
-- CONSULTA EL CODIGO DE LOS PRODUCTOS Y SU CANTIDAD EN LA TB items_facturas 26865.99
SELECT 
	a.codigo,
    c.cantidad
FROM 
	productos a
    INNER JOIN
    items c 
    ON c.codigo = a.codigo;
    
-- CONSULTA EL CODIGO DEL PRODUCTO, LA CANTIDAD Y LA FECHA DE FACTURACION 
SELECT 
	a.codigo,
    c.cantidad,
    YEAR(b.fecha) as AÑO
FROM 
	productos a
    INNER JOIN
    items c 
    ON c.codigo = a.codigo
    INNER JOIN
    facturas b
    ON b.numero = c.numero;
    
-- CONSULTA EL CODIGO DEL PRODUCTO, LA CANTIDAD Y LA FECHA DE FACTURACION Y LOS AGRUPA POR CODIGO Y AÑO 120583.56
SELECT 
	a.codigo,
    SUM(c.cantidad) AS CANTIDAD,
    YEAR(b.fecha) AS AÑO
FROM 
	productos a
    INNER JOIN
    items c 
    ON c.codigo = a.codigo
    INNER JOIN
    facturas b
    ON b.numero = c.numero
GROUP BY a.codigo, YEAR(b.fecha)
ORDER BY a.codigo, YEAR(b.fecha);