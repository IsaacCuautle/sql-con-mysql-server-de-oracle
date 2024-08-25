USE jugos_ventas;

-- HABILITA LA CREACION DE FUNCIONES POR PARTE DEL USUARIO
SET GLOBAL log_bin_trust_function_creators = 1;

-- CREA UNA FUNCION f_define_sabor
USE `jugos_ventas`;
DROP function IF EXISTS `f_define_sabor`;

DELIMITER $$
USE `jugos_ventas`$$
CREATE FUNCTION `f_define_sabor` (vsabor VARCHAR(40))
RETURNS VARCHAR(40)
BEGIN
	
    DECLARE vretorno VARCHAR(40) DEFAULT ' ';
    
    CASE vsabor
    WHEN "MARACUYA"
    THEN
		SET vretorno = "RICO";
	WHEN "UVA"
	THEN
		SET vretorno = "MUY RICO";
	ELSE
		SET vretorno = "COMUN";
    END CASE;
    
RETURN vretorno;
END$$

DELIMITER ;

-- INVOCA A LA FUNCION
SELECT f_define_sabor("MARACUYA");

-- SELECCIONA EL SABOR Y SU DEFINICION DE LA TB tb_de_productos EN DONDE SU DEFINICION SEA IGUAL A MUY RICO
SELECT 
	SABOR,
    f_define_sabor(sabor) AS DEFINICION 
FROM tabla_de_productos
WHERE
	f_define_sabor(sabor) = 'MUY RICO';

