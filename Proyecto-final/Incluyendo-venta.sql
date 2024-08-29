select f_cliente_aleatorio() AS cliente;
select f_producto_aleatorio() AS producto;
select f_vendedor_aleatorio() AS vendedor;

-- CREA UN SP sp_venta QUE GENERA UNA VENTA DADOS UNA fecha, maximo de items y cantidad maxima de dichos items

DROP procedure IF EXISTS `sp_venta`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_venta`(v_fecha DATE, v_maxItems INT, v_maxCantidad INT)
BEGIN
	
    DECLARE v_cliente VARCHAR(11);
    DECLARE v_producto VARCHAR(10);
    DECLARE v_vendedor VARCHAR(5);
    DECLARE 
		v_cantidad 
		,v_items 
		,v_nFactura
        ,v_numero_items INT;
	DECLARE v_contador INT DEFAULT 1;
    DECLARE v_precio FLOAT;
    
    
    -- OBTIENE EL ULTIMO NUMERO DE FACTURA
    SELECT 
		MAX(numero) + 1
    INTO v_nfactura
	FROM facturas;
    
    -- ASUGNA UN CLIENTE
    SET v_cliente = f_cliente_aleatorio();
    -- ASUGNA UN VENDEDOR
    SET v_vendedor = f_vendedor_aleatorio();
    
    -- CREA UNA NUEVA factura
    INSERT INTO 
		facturas
        (
			numero,
            fecha,
            dni,
            matricula,
            impuesto
        ) 
    VALUES 
    (
		v_nFactura,
        v_fecha,
        v_cliente,
        v_vendedor,
        0.16
    );
    
    -- ASIGNA UN NUMERO ALEATORIO DE items
    SET v_items = f_aleatorio(1,v_maxItems);
    
    -- ASIGNA ITEMS A LA NUEVA factura
    WHILE v_contador <= v_items
    DO
		
        SET v_producto = f_producto_aleatorio();
        
        -- EVITA QUE UN MISMO NUMERO DE PRODUCTO Y UN MISMO NUMERO DE FACTURA APAREZCAN EN LA MISMA VENTA (DUPLICIDAD)
        SELECT 
			COUNT(*) 
		INTO 
			v_numero_items 
        FROM 
			items 
        WHERE 
			codigo = v_producto AND numero = v_nFactura;
        
        
        IF v_numero_items = 0 
        THEN
        
			SET v_cantidad = f_aleatorio(1,v_maxCantidad);
			
			SELECT 
				precio INTO v_precio
			FROM productos 
			WHERE codigo = v_producto;
			
            -- GENERA UNA VENTA
			INSERT 
				INTO items
				(
					numero,
					codigo,
					cantidad,
					precio
				)
			VALUES
			(
				v_nFactura,
				v_producto,
				v_cantidad,
				v_precio
			);
        END IF;
        
        SET v_contador = v_contador + 1;
        
    END WHILE;
END
DELIMITER $$;



-- CREAR TB facturas
CREATE TABLE facturas
(
	numero INT NOT NULL,
    fecha DATE,
    dni VARCHAR(11) NOT NULL,
    matricula VARCHAR(5) NOT NULL,
    impuesto FLOAT,
    
    PRIMARY KEY(numero),
    
    FOREIGN KEY(dni) REFERENCES clientes(dni),
    FOREIGN KEY(matricula) REFERENCES vendedores(matricula)
);

-- CREAR TB items
CREATE TABLE items
(
	numero INT NOT NULL,
    codigo VARCHAR(10) NOT NULL,
    cantidad INT,
    precio FLOAT,
    
    PRIMARY KEY(codigo, numero),
    
    FOREIGN KEY (numero) REFERENCES facturas(numero),
    FOREIGN KEY (codigo) REFERENCES productos(codigo)
);

-- INSERTA DATOS EN TB items desde la BD jugos_ventas EN LA TB items_facturas
INSERT INTO items 
SELECT 
	* 
FROM jugos_ventas.items_facturas;

-- INSERTA DATOS EN LA TB factuas DESDE LA BD jugos_ventas EN LA TB facturas
INSERT INTO 
	facturas 
SELECT 
	numero,
    FECHA_VENTA AS FECHA ,
    dni,
    matricula,
    impuesto 
FROM jugos_ventas.facturas;

SELECT MAX(numero) FROM facturas;

-- LLAMA AL SP sp_venta
CALL sp_venta(
	'20240101', -- FECHA DE LA FACTURA
	5, -- NUMERO MAXIMO DE PRODUCTOS
	10 -- CANTIDAD MAXIMA DE LOS PRODUCTOS VENDIDOS
);

