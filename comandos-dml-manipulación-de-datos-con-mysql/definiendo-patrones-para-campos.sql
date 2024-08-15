USE VENTAS_JUGOS;

CREATE TABLE tb_default (
	id INT AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NULL,
    ciudad VARCHAR(50) DEFAULT 'monterrey',
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    
    PRIMARY KEY(id)
);