SELECT
	*
FROM
	tabla_de_productos;
    
-- CONSULTA PRODUCTOS Y LES ASIGNA UNA ETIQUETA SEGUN SU PRECIO DE LISTA  
SELECT 
	nombre_del_producto,
    precio_de_lista,
    CASE 
		WHEN 
			precio_de_lista >= 12
		THEN
			'COSTOSO'
		WHEN
			precio_de_lista >= 5
            AND
            precio_de_lista < 12
		THEN
			'ASEQUIBLE'
		ELSE
			'BARATO'
	END 
	AS ETIQUETA
FROM
	tabla_de_productos;
    
-- MUESTRA PRODUCTOS CUYO ENVASE SEA DE 700 ML Y ASIGNA UNA TIQUETA SEGUN SU PRECIO MINIMO 

SELECT 
    envase,
    CASE
        WHEN precio_de_lista >= 12 THEN 'COSTOSO'
        WHEN
            precio_de_lista >= 5
                AND precio_de_lista < 12
        THEN
            'ASEQUIBLE'
        ELSE 'BARATO'
    END AS etiqueta,
    MIN(precio_de_lista) AS precio_minimo
FROM
    tabla_de_productos
WHERE
    tamano = '700 ml'
GROUP BY envase , CASE
    WHEN precio_de_lista >= 12 THEN 'COSTOSO'
    WHEN
        precio_de_lista >= 5
            AND precio_de_lista < 12
    THEN
        'ASEQUIBLE'
    ELSE 'BARATO'
END
ORDER BY envase;
	