USE JUGOS_VENTAS;
-- ALTERA EL SP producto_con_parametros PARA INCLUIR UN MENSAJE DE EXITO
USE `jugos_ventas`;
DROP procedure IF EXISTS `incluir_producto_parametros`;

USE `jugos_ventas`;
DROP procedure IF EXISTS `jugos_ventas`.`incluir_producto_parametros`;
;

DELIMITER $$
USE `jugos_ventas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `incluir_producto_parametros`(codigo  VARCHAR(20), 
nombre  VARCHAR(20),
sabor  VARCHAR(20), 
tamano  VARCHAR(20),
envase  VARCHAR(20),
precio  DECIMAL(4,2)
)
BEGIN
	DECLARE mensaje VARCHAR(40); 	
 INSERT INTO tabla_de_productos (CODIGO_DEL_PRODUCTO,NOMBRE_DEL_PRODUCTO,SABOR,TAMANO,ENVASE,PRECIO_DE_LISTA)
     VALUES (
     codigo,
     nombre,
     sabor,
     tamano,
     envase,
     precio);
     
     SET mensaje = 'Producto incluido con exito';
     SELECT mensaje;
END$$

DELIMITER ;
;

-- ALTERA EL SP producto_con_parametros AGREGANDO UN MANEJO DE EXEPCIONES AL ERROR 1062
USE `jugos_ventas`;
DROP procedure IF EXISTS `incluir_producto_parametros`;

USE `jugos_ventas`;
DROP procedure IF EXISTS `jugos_ventas`.`incluir_producto_parametros`;
;

DELIMITER $$
USE `jugos_ventas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `incluir_producto_parametros`(codigo  VARCHAR(20), 
nombre  VARCHAR(20),
sabor  VARCHAR(20), 
tamano  VARCHAR(20),
envase  VARCHAR(20),
precio  DECIMAL(4,2)
)
BEGIN
	DECLARE mensaje VARCHAR(40); 	
    DECLARE EXIT HANDLER FOR 1062
		BEGIN
			SET mensaje = 'Producto duplicado';
			SELECT mensaje;
        END;
        
	 INSERT INTO tabla_de_productos (CODIGO_DEL_PRODUCTO,NOMBRE_DEL_PRODUCTO,SABOR,TAMANO,ENVASE,PRECIO_DE_LISTA)
		 VALUES (
		 codigo,
		 nombre,
		 sabor,
		 tamano,
		 envase,
		 precio);
     
	 SET mensaje = 'Producto incluido con exito';
	 SELECT mensaje;
END$$

DELIMITER ;
;

-- LLAMA AL SP incluir_producto_parametros
CALL incluir_producto_parametros('1000800','sabor del mar','700 ml','naranja','botella de vidrio',2.25);
CALL incluir_producto_parametros('1000801','sabor del mar','700 ml','naranja','botella de vidrio',1.25);

SELECT * FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = '1000800';