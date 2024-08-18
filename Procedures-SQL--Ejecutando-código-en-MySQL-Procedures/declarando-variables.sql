-- CREA UN SP exibir_variable
USE `jugos_ventas`;
DROP procedure IF EXISTS `exibir_variable`;

DELIMITER $$
USE `jugos_ventas`$$
CREATE PROCEDURE `exibir_variable` ()
BEGIN
DECLARE texto CHAR(12) DEFAULT "HOLA MUNDO!!!";
SELECT texto;
END$$

DELIMITER ;

-- LLAMA AL SP exibir_variable
CALL exibir_variable;

-- CREA UN SP CON VARIAS VARIABLES
USE `jugos_ventas`;
DROP procedure IF EXISTS `variables`;

DELIMITER $$
USE `jugos_ventas`$$
CREATE PROCEDURE `variables` ()
BEGIN
DECLARE v VARCHAR(30) DEFAULT "CARACTERES VARIABLES";
DECLARE i INTEGER DEFAULT 564;
DECLARE d DECIMAL(5,3) DEFAULT 89.650;
DECLARE f DATE DEFAULT '2021-01-01';
DECLARE ts TIMESTAMP DEFAULT current_timestamp();

SELECT v,i,d,f,ts;
END$$

DELIMITER ;

-- LLAMA AL SP new_procedure
CALL variables;

-- CREA UN SP SIN DECLARACION
USE `jugos_ventas`;
DROP procedure IF EXISTS `sin_declaracion`;

DELIMITER $$
USE `jugos_ventas`$$
CREATE PROCEDURE `sin_declaracion` ()
BEGIN
SELECT TEXTO;
END$$

DELIMITER ;

-- LLAMA AL SP sin_declaracion (da un error)
CALL sin_declaracion;

-- CREA UN SP QUE ASIGNA DIFERENTES VALORES A UNA VARIABLE
USE `jugos_ventas`;
DROP procedure IF EXISTS `asignar_valores`;

DELIMITER $$
USE `jugos_ventas`$$
CREATE PROCEDURE `asignar_valores` ()
BEGIN
	DECLARE i INTEGER DEFAULT 967;
    SELECT i;
    SET i = 1000;
    SELECT i;
END$$

DELIMITER ;

-- LLAMA AL SP asignar_valores
CALL asignar_valores;