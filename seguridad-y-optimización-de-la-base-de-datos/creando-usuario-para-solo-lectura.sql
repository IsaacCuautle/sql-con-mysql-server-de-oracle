-- CREA UN USURIO NORMAL
CREATE USER 'read01'@'localhost' IDENTIFIED BY 'read01';

-- OTROGA PERMISOS
GRANT SELECT, EXECUTE ON *.* TO 'read01'@'localhost';