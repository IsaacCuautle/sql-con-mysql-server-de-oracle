USE `jugos_ventas`;
DROP procedure IF EXISTS `sp_contactenar`;

USE `jugos_ventas`;
DROP procedure IF EXISTS `jugos_ventas`.`sp_contactenar`;
;

DELIMITER $$
USE `jugos_ventas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_contactenar`()
BEGIN
	/*
		COMENTARIO MULTILINEA
    */
    
    -- COMENTARIO UNILINEA
    
    # COMENTAR ASI TAMBIEN ES VALIDO
	SELECT CONCAT("Hola mundo"," a todos","!", " este procedure concatena strings") AS RESULTADOS;
END$$

DELIMITER ;
;
