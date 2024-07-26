USE jugos_ventas;

-- CONSULTA PRODUCTOS QUE CONTENGAN 'Manzana' EN SU SOBOR Y SU ENVASE SEA BOTELLA PET
SELECT 
	*
FROM 
	tabla_de_productos
WHERE
	sabor LIKE '%manzana';
    
-- CONSULTA PRODUCTOS QUE CONTENGAN 'Manzana' EN SU SOBOR
SELECT 
	*
FROM 
	tabla_de_productos
WHERE
	sabor 
		LIKE 
			'%manzana'
		AND 
			envase = 'Botella pet';
    
    