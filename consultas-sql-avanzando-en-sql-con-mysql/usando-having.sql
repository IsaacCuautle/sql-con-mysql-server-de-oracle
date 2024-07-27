USE jugos_ventas;

-- CONSULTA POR LA SUMA DE LIMITES DE CREDITO POR ESTADO Y DEVUELVE SOLO LOS QUE SEAN MAYOR A 300,000
SELECT
	estado,
    SUM(limite_de_credito) AS limite_total
FROM
	tabla_de_clientes
GROUP BY
	estado
HAVING
	limite_total > 300000;
    
--  CONSULTA EL PRECIO MAXIMO Y MINIMO DE PRODUCTOS CUYA SUMA DE PRECIOS SEA MAYOR A 80
SELECT
	envase,
    MAX(precio_de_lista) AS precio_maximo,
    MIN(precio_de_lista) AS precio_minimo,
    SUM(precio_de_lista) AS suma_precio
FROM
	tabla_de_productos
GROUP BY
	envase
HAVING
	SUM(precio_de_lista) > 80;
