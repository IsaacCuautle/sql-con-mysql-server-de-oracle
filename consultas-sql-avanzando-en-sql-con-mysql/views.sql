-- CONSULTA EL ENVASE Y EL PRECIO MAXIMO CUANDO ES MAYOR A 10 DESDE UNA VW
SELECT 
	X.ENVASE,
    X.PRECIO_MAXIMO
FROM
	(
		VW_PRECIO_MAXIMO_ENVASES X
    )
WHERE PRECIO_MAXIMO >= 10;

-- CONSULTA NOMBRE, ENVASE Y VARIACION DE LOS PRECIOS MAXIMOS MAYORES A 10
SELECT
	A.NOMBRE_DEL_PRODUCTO,
    A.ENVASE,
    (( A.PRECIO_DE_LISTA / X.PRECIO_MAXIMO ) -1) *100 AS PROCENTAJE_DE_VARIACION
FROM
	(
		TABLA_DE_PRODUCTOS A
        INNER JOIN
		VW_PRECIO_MAXIMO_ENVASES X
        ON
        A.ENVASE = X.ENVASE
    )
WHERE PRECIO_MAXIMO >= 10;

