-- CREA UNA FN f_aleatorio QUE PERMITE GENERAR NUMEROS ALEATORIOS PASANDO COMO PARAMETROS UN MINIMO Y UN MACIMO
USE `empresa`;
DROP function IF EXISTS `f_aleatorio`;

DELIMITER $$
USE `empresa`$$
CREATE FUNCTION `f_aleatorio` (min INT, max INT)
RETURNS INTEGER
BEGIN

	DECLARE vresultado INT;
	
    SELECT 
		FLOOR(RAND() * (max - min + 1) + min) AS NUMERO_ALEATORIO
	INTO vresultado; 

RETURN vresultado;
END$$

DELIMITER ;

-- INVOCA A LA FN f_aleatorio
SELECT f_aleatorio(1,5);