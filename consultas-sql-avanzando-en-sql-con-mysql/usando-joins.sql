USE jugos_ventas;

-- VENDEDORES
SELECT 
	*
FROM
	tabla_de_vendedores;
    
-- FACTURAS    
SELECT 
	*
FROM
	facturas;    
    
-- INNER JOIN
SELECT 
    V.NOMBRE,
    F.MATRICULA,
    COUNT(*) AS TOTAL_FACTURAS
FROM
    tabla_de_vendedores AS V
INNER JOIN
    facturas AS F 
	ON V.MATRICULA = F.MATRICULA
GROUP BY
	V.NOMBRE,
    F.MATRICULA;
    
-- CROSS JOIN
SELECT 
    V.NOMBRE,
    F.MATRICULA,
    COUNT(*) AS TOTAL_FACTURAS
FROM
    tabla_de_vendedores AS V,
    facturas AS F 
WHERE
	V.MATRICULA = F.MATRICULA
GROUP BY
	V.NOMBRE,
    F.MATRICULA;