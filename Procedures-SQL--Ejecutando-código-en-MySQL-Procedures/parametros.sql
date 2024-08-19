-- CREA UN SP incluir_producto IMPLEMENTADO EL USO DE PARAMETROS
USE `jugos_ventas`;
DROP procedure IF EXISTS `incluir_producto_parametros`;

DELIMITER $$
USE `jugos_ventas`$$
CREATE PROCEDURE `incluir_producto_parametros` (codigo  VARCHAR(20), 
nombre  VARCHAR(20),
sabor  VARCHAR(20), 
tamano  VARCHAR(20),
envase  VARCHAR(20),
precio  DECIMAL(4,2)
)	
BEGIN
 INSERT INTO tabla_de_productos (CODIGO_DEL_PRODUCTO,NOMBRE_DEL_PRODUCTO,SABOR,TAMANO,ENVASE,PRECIO_DE_LISTA)
     VALUES (
     codigo,
     nombre,
     sabor,
     tamano,
     envase,
     precio);
END$$

DELIMITER ;

-- LLAMA AL SP incluir_producto_parametros
CALL incluir_producto_parametros('1000800','sabor del mar','700 ml','naranja','botella de vidrio',2.25);

SELECT * FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = '1000800';
