-- CREA UNA FN f_cliente_aleatorio QUE RETORNA UN CLIENTE ALEATORIO DE LA TB 
USE `empresa`;
DROP function IF EXISTS `f_cliente_aleatorio`;

DELIMITER $$
USE `empresa`$$
CREATE FUNCTION `f_cliente_aleatiorio` ()
RETURNS VARCHAR(11)
BEGIN
		
		DECLARE v_resultado VARCHAR(11);
        DECLARE v_max INT;
        DECLARE v_aleatorio INT;
        
        SELECT 
			COUNT(*)
		INTO
			v_max
		FROM 
			clientes;
        
        SET v_aleatorio = f_aleatorio(1,v_max) - 1;
        
        SELECT 
			dni 
		INTO 
			v_resultado 
        FROM 
			clientes 
        LIMIT v_aleatorio, 1;

RETURN v_resultado;
END$$

DELIMITER ;

-- INVOCA A LA FUNCION f_cliente_aleatorio
SELECT f_cliente_aleatorio() AS CLIENTE_ALEATORIO;