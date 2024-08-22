/*
	CREA UN SP cursor_1 QUE ASIGNE LOS 4 NOMBRES DE LA TB tabla_de_clientes 
	A UNA VARIABLE E IMPRIMA LA VARIABLE EN PANTALLA
*/
USE `jugos_ventas`;
DROP procedure IF EXISTS `cursor_1`;

DELIMITER $$
USE `jugos_ventas`$$
CREATE PROCEDURE `cursor_1` ()
BEGIN
	DECLARE vnombre VARCHAR(50);
    
    -- DECLARACION DEL CURSOR
    DECLARE c CURSOR 
    -- CONSULTA A ALMACENAR
    FOR 
		SELECT nombre FROM tabla_de_clientes 
        LIMIT 4;
        
	-- APERTURA DEL CURSOR
	OPEN c;
    
    -- RECORREMOS EL CURSOR
    FETCH c INTO vnombre;
    SELECT vnombre;
    FETCH c INTO vnombre;
    SELECT vnombre;
    FETCH c INTO vnombre;
    SELECT vnombre;
    FETCH c INTO vnombre;
    SELECT vnombre;
    
    -- FINALIZAMOS EL CURSOR
    CLOSE c;
END$$

DELIMITER ;

-- LLAMA AL SP cursor_1
CALL cursor_1;

SELECT nombre FROM tabla_de_clientes LIMIT 4;