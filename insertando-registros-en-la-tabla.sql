USE jugos;

-- INSERTAR REGISTROS DESDE UN ARCHIVO CSV
INSERT INTO productos(
	producto,
    nombre,
    envase,
    volumen,
    sabor,
    precio
) VALUES(
	"773912",
	"Clean",
	"Botella PET",
	"1 Lt",
	"naranja",
	8.01
);

-- CONSULTAR LOS REGISTROS DE LA TB productos
SELECT * FROM productos;