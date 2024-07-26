USE jugos_ventas;

-- CONSULTA PRODUCTOS CUYO SABOR SEA mango Y SU TAMAÑO SEA 470 ml
SELECT 
	*
FROM 
	tabla_de_productos
WHERE
	sabor = 'Mango'
    AND 
    tamano = '470 ml';

-- CONSULTA PRODUCTOS CUYO SABOR SEA mango O SU TAMAÑO SEA 470 ml
SELECT 
	*
FROM 
	tabla_de_productos
WHERE
	sabor = 'Mango'
    OR 
    tamano = '470 ml';
    
-- CONSULTA PRODUCTOS CUYO SABOR NO SEA mango Y SU TAMAÑO NO SEA 470 ml
SELECT 
	*
FROM 
	tabla_de_productos
WHERE
	NOT
		(
			sabor = 'Mango'
			AND 
			tamano = '470 ml'
		);
        
-- CONSULTA PRODUCTOS CUYO SABOR SEA mango O SU TAMAÑO SEA 470 ml
SELECT 
	*
FROM 
	tabla_de_productos
WHERE
	sabor = 'Mango'
    AND NOT
		(
			tamano = '470 ml'
		);
    
-- CONSULTA PRODUCTOS CUYO SABOR SEA mango O uva
SELECT 
	*
FROM 
	tabla_de_productos
WHERE
	sabor 
	IN
		(
			'mango',
            'uva'
        );
        
-- CONSULTA CLIENTES CUYO COIDAD SEA ciudad de mexico o guadalajara Y SEAN MAYORES A 21 AÑOS
SELECT 
	*
FROM 
	tabla_de_clientes
WHERE
	ciudad 
	IN
		(
			'ciudad de mexico',
            'guadalajara'
        )
	AND
		EDAD > 21;
        
-- CONSULTA CLIENTES CUYO COIDAD SEA ciudad de mexico o guadalajara Y ESTEN ENTRE 20 AÑOS A 25 AÑOS
SELECT 
	*
FROM 
	tabla_de_clientes
WHERE
	ciudad 
	IN
		(
			'ciudad de mexico',
            'guadalajara'
        )
	AND
		(
			edad 
			BETWEEN 
			20
			AND 
			25
		);