USE jugos;
SELECT * FROM productos;

-- CAMBIAR EL ENVASE DEL PRODUCTO CLEAN
UPDATE productos 
SET envase = "1 lt"
WHERE producto = '773912';