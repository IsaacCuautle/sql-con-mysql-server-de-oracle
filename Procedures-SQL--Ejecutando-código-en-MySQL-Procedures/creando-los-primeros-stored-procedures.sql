-- CREA UN SP QUE IMPRIMA HOLA MUNDO
USE `jugos_ventas`;
DROP procedure IF EXISTS `hola_mundo`;

DELIMITER $$
USE `jugos_ventas`$$
CREATE PROCEDURE `hola_mundo` ()
BEGIN
	SELECT "HOLA MUNDO!";
END$$

DELIMITER ;

-- LLAMA AL SP hola_mundo
CALL hola_mundo;

-- CREA UN SP QUE MUESTRA EL RESULTADO DE UNA OPERACION
USE `jugos_ventas`;
DROP procedure IF EXISTS `muestra_numero`;

DELIMITER $$
USE `jugos_ventas`$$
CREATE PROCEDURE `muestra_numero` ()
BEGIN
 SELECT 9 + 5 * 2 AS RESULTADO;
END$$

DELIMITER ;

-- LLAMA AL SP muestra_numero
CALL muestra_numero;

-- CREA UN SP CON LA FUNCION CONCAT
USE `jugos_ventas`;
DROP procedure IF EXISTS `sp_contactenar`;

DELIMITER $$
USE `jugos_ventas`$$
CREATE PROCEDURE `sp_contactenar` ()
BEGIN
	SELECT CONCAT("Hola mundo"," ","!") AS RESULTADO;
END$$

DELIMITER ;

-- 	LLAMA AL SP sp_contactenar
CALL sp_contactenar;