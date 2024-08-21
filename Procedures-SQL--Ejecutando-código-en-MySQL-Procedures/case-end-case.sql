SELECT 
DISTINCT CODIGO_DEL_PRODUCTO,sabor FROM tabla_de_productos;


/*
    FRUTILLA = RICO
    UVA = RICO
    CEREZA = RICO

	MARACUYA = NORMAL
    SANDIA = NORMAL
    LIMON = NORMAL
    
    !* = COMUN
*/

-- CREA EL SP define_sabor
USE `jugos_ventas`;
DROP procedure IF EXISTS `define_sabor`;

DELIMITER $$
USE `jugos_ventas`$$
CREATE PROCEDURE `define_sabor` (vcodigo VARCHAR(20))
BEGIN
	DECLARE vsabor VARCHAR(20);
    
    SELECT sabor INTO vsabor
    FROM tabla_de_productos
    WHERE codigo_del_producto = vcodigo;
    
    CASE vsabor
    WHEN "MARACULLA"
    THEN
		SELECT "RICO";
	WHEN "UVA"
	THEN
		SELECT "MUY RICO";
	ELSE
		SELECT "COMUN";
    END CASE;
END$$

DELIMITER ;

-- LLAMA AL SP define_sabor
CALL define_sabor('1000889');
