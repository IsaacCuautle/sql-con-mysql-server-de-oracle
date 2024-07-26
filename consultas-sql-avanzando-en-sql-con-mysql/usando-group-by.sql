-- CONSULTA LA SUMA DE LIMITE DE CREDITO POR ESTADO
SELECT
	estado,
    SUM(limite_de_credito) AS limite_total
FROM
	tabla_de_clientes
GROUP BY
	estado;

-- CONSULTA EL PRECIO DE LISTA MAXIMO POR ENVASE
SELECT
	envase,
    MAX(precio_de_lista) AS limite_total
FROM
	tabla_de_productos
GROUP BY
	envase;
    
-- CONSULTA EL CUANTOS REGISTROS HAY POR ENVASE
SELECT
	envase,
    COUNT(*) AS total
FROM
	tabla_de_productos
GROUP BY
	envase;
    
-- CONSULTA LA SUMA DEL LIMITE DE CREDITO POR BARRIO
SELECT
	barrio,
    SUM(limite_de_credito) AS total_credito
FROM
	tabla_de_clientes
GROUP BY
	barrio;

-- CONSULTA LA SUMA DEL LIMITE DE CREDITO POR BARRIO EN LA CIUDAD DE MEXICO
SELECT
	barrio,
    SUM(limite_de_credito) AS total_credito
FROM
	tabla_de_clientes
WHERE 
	ciudad = 'ciudad de mexico'
GROUP BY
	barrio;
    
-- CONSULTA LA SUMA DEL LIMITE DE CREDITO POR BARRIO EN LA CIUDAD DE MEXICO
SELECT
	estado,
	barrio,
    MAX(limite_de_credito) AS limite,
    edad
FROM
	tabla_de_clientes
WHERE 
	edad >= 20
GROUP BY
	estado,
	barrio,
    edad
ORDER BY 
	edad;