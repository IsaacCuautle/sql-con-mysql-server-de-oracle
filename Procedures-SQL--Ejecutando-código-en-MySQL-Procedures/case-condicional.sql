-- CREA EL SP precio_producto_case PARA CATEGORIZAR LOS PRODUCTOS SEGUN SU PRECIO UTILIZANDO CASE
USE `jugos_ventas`;
DROP procedure IF EXISTS `precio_producto_case`;

DELIMITER $$
USE `jugos_ventas`$$
CREATE PROCEDURE `precio_producto_case` (vcodigo VARCHAR(20))
BEGIN
	DECLARE vresultado VARCHAR(40);
    DECLARE vprecio FLOAT;
    
    SELECT precio_de_lista INTO vprecio
	FROM tabla_de_productos
    WHERE codigo_del_producto = vcodigo;
    
    CASE vprecio
	WHEN vprecio >= 12
		THEN
		SET vresultado = "PRODUCTO COSTOSO";
	WHEN vprecio >= 7 AND vprecio < 12
		THEN
		SET vresultado = 'PRODUCTO ASEQUIBLE';
	ELSE
		SET vresultado= 'PRODUCTO BARATO';
    END CASE;
    
    SELECT vresultado;
END$$

DELIMITER ;

-- LLAMA AL SP precio_producto_case
CALL precio_producto_case('1000801');