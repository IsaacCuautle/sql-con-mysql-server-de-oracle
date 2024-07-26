USE jugos;
show tables;
-- AÑADIR PK EN LA TB tb-clientes
ALTER TABLE  tbclientes 
ADD
PRIMARY KEY(dni) ;

-- COLOCAR UN NUEVO CAMPO EN TB CLIENTES
ALTER TABLE tbclientes 
ADD 
COLUMN(fecha_nacimiento DATE);

-- AGREGAR UN NUEVO REGISTRO A LA TB CLIENTES5
INSERT INTO tbclientes(
	dni,
    nombre,
    direccion1,
    direccion2,
    barrio,
    ciudad,
    estado,
    cp,
    edad,
    sexo,
    limite_credito,
    volumen_compra,
    primera_compra,
    fecha_nacimiento
) VALUES (
	"456879548",
    'Jhon Doe',
    'Fake Street, 2',
    '',
    'Los Laureles',
    'CDMX',
    'ESTADO DE MEXICO',
    '57130',
    50,
    'M',
    10000,
    20000,
    0,
    '1971-05-15'
);