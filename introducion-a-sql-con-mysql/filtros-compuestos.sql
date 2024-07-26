
-- BUSCA EN LA TB PRODUCTOS REGISTROS CON ENVASE "lata" O "botella pet"
SELECT * FROM tbproducto 
WHERE envase LIKE "Lata" OR envase LIKE "botella pet";

-- CONSULTA REGISTROS EN TB PRODUCTOS DONDE EL precio_lista SEA MAYOR A 15 Y MENOR A 25 
SELECT *
FROM tbproducto WHERE precio_lista >= 15 AND precio_lista <=25;

-- CONSULTA REGISTROS EN TB PRODUCTOS DONDE EL precio_lista SEA MAYOR A 15 Y MENOR A 25 O QUE SU envase SEA "Botella per"
SELECT *
FROM tbproducto WHERE (precio_lista >= 15 AND precio_lista <=25) OR envase = "botella pet";

-- CONSULTA REGISTROS EN TB PRODUCTOS DONDE EL precio_lista SEA MAYOR A 15 Y SU ENVASEA SEA IGUAL A "1LITRO" O QUE SU envase SEA "Botella pet"
SELECT *
FROM tbproducto WHERE (precio_lista >= 15 AND tamano = "1 Litro") OR envase = "botella pet";