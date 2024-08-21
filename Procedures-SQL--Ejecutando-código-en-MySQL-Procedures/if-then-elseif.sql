USE JUGOS_VENTAS;

SELECT * FROM tabla_de_productos;

/*
	PRECIO > 12 = PRODUCTO COSTOSO
	PRECIO > 7 & PRECIO < 12 = PRODUCTO ASEQUIBLE
	PRECIO < 7 = PRODUCTO BARATO; 
*/

SELECT precio_de_lista
	FROM tabla_de_productos
    WHERE codigo_del_producto = '1000800';
    
-- CREA UN SP QUE CATEGORIZA UN PRODUCTO
USE `jugos_ventas`;
DROP procedure IF EXISTS `precio_producto`;

USE `jugos_ventas`;
DROP procedure IF EXISTS `jugos_ventas`.`precio_producto`;
;

DELIMITER $$
USE `jugos_ventas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `precio_producto`(vcodigo VARCHAR(20))
BEGIN
	DECLARE vresultado VARCHAR(40);
    DECLARE vprecio FLOAT;
    
    SELECT precio_de_lista INTO vprecio
	FROM tabla_de_productos
    WHERE codigo_del_producto = vcodigo;
    
    IF vprecio >= 12
    THEN
		SET vresultado = "PRODUCTO COSTOSO";
	ELSEIF vprecio >= 7 AND vprecio < 12
	THEN
		SET vresultado = 'PRODUCTO ASEQUIBLE';
	ELSE
		SET vresultado= 'PRODUCTO BARATO';
    END IF;
    
    SELECT vresultado;
    
END$$

DELIMITER ;
;

-- LLAMA AL SP precio_producto
CALL precio_producto('1000801');
    
