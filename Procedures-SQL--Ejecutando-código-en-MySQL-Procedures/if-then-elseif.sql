SELECT * FROM tabla_de_productos;

/*
	PRECIO > 12 = PRODUCTO COSTOSO
	PRECIO > 7 & PRECIO < 12 = PRODUCTO ASEQUIBLE
	PRECIO < 7 = PRODUCTO BARATO; 
*/

SELECT precio_de_lista
	FROM tabla_de_productos
    WHERE codigo_del_producto = '1000800';