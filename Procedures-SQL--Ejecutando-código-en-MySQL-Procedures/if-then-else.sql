SELECT * FROM tabla_de_clientes;

-- CREA EL SP edad_clientes QUE CATEGORIZA A UN CLIENTE DEPENDIENDO DE SU EDAD
DELIMITER $$
CREATE PROCEDURE `edad_clientes` (VDNI VARCHAR(20))
BEGIN
	DECLARE vresultado VARCHAR(50);
    DECLARE vfecha DATE;
    
    SELECT fecha_de_nacimiento INTO vfecha
		FROM tabla_de_clientes
		WHERE dni = vdni; 
        
	IF vfecha < '1995-01-01'
    THEN
		SET vresultado = 'cliente viejo';
    ELSE
		SET vresultado = 'cliente joven';
    END IF;
    
    SELECT vresultado;
END;
$$

-- LLAMA AL SP edad_clientes
CALL edad_clientes('1471156710');

