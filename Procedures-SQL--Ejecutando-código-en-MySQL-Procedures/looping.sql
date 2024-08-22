USE jugos_ventas;

CREATE TABLE IF NOT EXISTS tb_looping
(
	id int
);

-- CREA EL SP looping. INSERTA UN RAGO DE VALORES EN LA TB tb_looping
USE `jugos_ventas`;
DROP procedure IF EXISTS `looping`;

DELIMITER $$
USE `jugos_ventas`$$
CREATE PROCEDURE `looping` (vinicial INT, vfinal INT)
BEGIN
	DECLARE vcontador INT;
    SET vcontador = vinicial;
    
    WHILE vcontador <= vfinal
    DO
		INSERT INTO tb_looping VALUES (vcontador);
        SET vcontador = vcontador + 1;
	END WHILE;
    
    SELECT * FROM tb_looping;
END$$

DELIMITER ;

-- LLAMA AL SP looping
CALL looping(1,10);