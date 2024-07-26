USE jugos_ventas;

-- CONSULTA TODOS LOS CAMPOS DE tabla de productos DISTINTOS A envase y tamano
SELECT
	DISTINCT
		envase,
		tamano
FROM 
	tabla_de_productos;
    
-- CONSULTA TODOS LOS CAMPOS DE tabla de productos DISTINTOS A envase, tamano Y sabor PERO QUE TENGAN sabor IGUAL A naranja 
SELECT
	DISTINCT
		envase,
		tamano,
        sabor
FROM 
	tabla_de_productos
WHERE
	sabor = 'NARANJA';
    