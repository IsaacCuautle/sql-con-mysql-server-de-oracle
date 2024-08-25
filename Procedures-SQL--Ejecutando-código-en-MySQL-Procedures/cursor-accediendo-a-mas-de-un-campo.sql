-- CREA UN SP cursor_looping_varios_campos QUE PERMITE TRAER VARIOS CAMPOS DE LA TB tabla_de_clientes
USE `jugos_ventas`;
DROP procedure IF EXISTS `cursor_looping_varios_campos`;

USE `jugos_ventas`;
DROP procedure IF EXISTS `jugos_ventas`.`cursor_looping_varios_campos`;
;

DELIMITER $$
USE `jugos_ventas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_looping_varios_campos`()
BEGIN
	
    DECLARE vnombre VARCHAR(50);
    DECLARE vdireccion VARCHAR(150);
    DECLARE 
		vbarrio, 
		vciudad,
		vcodigoPostal 
	VARCHAR(50);
    
	DECLARE vfinCursor INT DEFAULT 0;
		
		-- DECLARACION DEL CURSOR
		DECLARE c CURSOR 
		
		-- CONSULTA A ALMACENAR
		FOR 
			SELECT 
				nombre,
                DIRECCION_1,
                BARRIO,
                CIUDAD,
                CP
			FROM tabla_de_clientes;
			
		-- MANEJO DE ERROR CUANDO NO ENCUENTRE REGISTROS    
		DECLARE CONTINUE HANDLER FOR 
			NOT FOUND
				SET vfinCursor = 1;
			
		-- APERTURA DEL CURSOR
		OPEN c;
		
		-- RECORREMOS EL CURSOR
		WHILE vfinCursor = 0
		DO
			FETCH c INTO 
				vnombre,
                vdireccion,
                vciudad,
                vbarrio,
                vcodigoPostal;
			
			IF vfinCursor = 0 THEN
				SELECT 
					concat(
						vnombre,
                        " ",
						vdireccion,
                        " ",
						vbarrio,
                        " ",
						vcodigoPostal
                    );
			END IF;
			
		END WHILE;
		-- FINALIZAMOS EL CURSOR
		CLOSE c;
    
END$$

DELIMITER ;
;

-- LLAMA AL SP cursor_looping_varios_campos
CALL cursor_looping_varios_campos;

-- CONSULTA TODOS LOS REGISTROS DE LA TB tabla_de_clientes;
SELECT * FROM tabla_de_clientes;
