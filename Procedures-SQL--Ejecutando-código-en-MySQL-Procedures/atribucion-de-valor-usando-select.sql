 SELECT * FROM tabla_de_productos;
 
 -- CREA EL SP mostrar_sabor
USE `jugos_ventas`;
DROP procedure IF EXISTS `mostrar_sabor`;

DELIMITER $$
USE `jugos_ventas`$$
CREATE PROCEDURE `mostrar_sabor` (codigo VARCHAR(15))
BEGIN
	DECLARE vsabor VARCHAR(20);

	SELECT sabor INTO vsabor
		FROM tabla_de_productos 
        WHERE codigo_del_producto = codigo;
        
	SELECT vsabor;
END$$

DELIMITER ;

-- LLAMA AL SP mostrar_sabor
CALL mostrar_sabor("1051518");


