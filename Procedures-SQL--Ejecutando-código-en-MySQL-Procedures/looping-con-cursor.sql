USE jugos_ventas;

-- CREA UN SP cursor_looping QUE MUESTRA TODOS LOS NOMBRES DE UNA TABLA EN CONSULTAS SEPARADAS UTILIZANDO UN CURSOR CON LOOPING
SELECT * FROM tabla_de_clientes LIMIT 4;

USE `jugos_ventas`;
DROP procedure IF EXISTS `cursor_looping`;

DELIMITER $$
USE `jugos_ventas`$$
CREATE PROCEDURE `cursor_looping` ()	
    BEGIN

		DECLARE vnombre VARCHAR(50);
		DECLARE vfinCursor INT DEFAULT 0;
		
		-- DECLARACION DEL CURSOR
		DECLARE c CURSOR 
		
		-- CONSULTA A ALMACENAR
		FOR 
			SELECT nombre FROM tabla_de_clientes;
			
		-- MANEJO DE ERROR CUANDO NO ENCUENTRE REGISTROS    
		DECLARE CONTINUE HANDLER FOR 
			NOT FOUND
				SET vfinCursor = 1;
			
		-- APERTURA DEL CURSOR
		OPEN c;
		
		-- RECORREMOS EL CURSOR
		WHILE vfinCursor = 0
		DO
			FETCH c INTO vnombre;
			
			IF vfinCursor = 0 THEN
				SELECT vnombre;
			END IF;
			
		END WHILE;
		-- FINALIZAMOS EL CURSOR
		CLOSE c;
	END;$$

DELIMITER ;

-- LLAMA AL SP cursor_looping
CALL cursor_looping;
SELECT NOMBRE FROM tabla_de_clientes;