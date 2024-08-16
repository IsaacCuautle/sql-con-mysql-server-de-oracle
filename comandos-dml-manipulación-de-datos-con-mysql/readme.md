# Comandos DML manipulación de datos con MySql
Este curso proporciona una introducción detallada a los comandos de manipulación de datos (DML) en MySQL. Se cubrirán los siguientes temas:

- Definición de esquemas: 
	Creación y gestión de tablas, incluyendo claves primarias y foráneas.
- Operaciones CRUD: 
	Inserción, actualización y eliminación de registros.
- Transacciones: 
	Control de cambios en la base de datos para asegurar la integridad de los datos.
- Triggers: 
	Automatización de tareas y creación de reglas de negocio.

## Revisión Sobre Entidades
### ¿Cómo esta organizada una base de datos?
Base de datos -> 
	[[#View (Vista]]
	Tablas -> 
		[[#Clave Primaria]] & [[#Clave Externa (Foránea)]] ->
			Índices
		[[#Campos]] ->
			[[#Registros]]
	[[#Procedures (Procedimientos)]]
	[[#Trigger (Disparador)]]

**Se debe definir:**
- Cuantos campos se tendrán?
- Que tipo de datos se asignaran a cada campo?
  - Texto: *char, varchar, text...*
  - Numerico: *int, bigint, smallint, float, bool...*
  - Fecha: *date, datetime, timestamp...*

 Si no se introduce la información de acuerdo al tipo de campo definido, se generaran errores
### Campos
- Definido al momento de su creación
- Numero limitado
- No admite datos que no fueran especificados
### Registros
- Son los datos contenidos en los campos
- Numero limitado
- Limite máximo dado por la capacidad de almacenamiento disponible en el disco
- Al momento de la creación de la Base de datos se pueden establecer políticas de crecimiento
### Clave Primaria
- No es obligatoria
- Su combinación no se puede repetir en ningún otro registro de la tabla
### Clave Externa (Foránea)
- Campo que relaciona las tablas
- Garantiza la integridad de los datos
### View (Vista)
- Consultas de *n* tablas al mismo tiempo
- Alto costo de procesamiento
### Consulta
- Unir tablas a través de un join
- Creamos filtros
### Procedures (Procedimientos)
- Lógica estructurada con lenguaje nativo del mismo SQL (if, while, for...)
- Permite crear funciones
``` MySQL
IF a > 0 THEN
	X = y + z
	z = INSTR(z + 1);
	
SELECT * FROM alpha
	PUT alpha IN TABLE X;
```
### Trigger (Disparador)
- Avisos automáticos cuando sucede un cambio en la base de datos o en la tabla
- Ejecuta una función o procedimiento cuando la condición del trigger se satisface
## Revisión Sobre Tipos de Datos
### Creando una tabla
![tabla de numeros enteros|500](data:image/png;base64,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)

### Números enteros
  **unsigned: Sin signo (+/-)**
- Números decimales
  **coma flotante**
  Ej. Si declaramos un `FLOAT(6,4)` e incluimos el numero  76.0009 el valor almacenado será 76.0001
  Es un numero fijo se declaramos `DECIMAL(5,3)` solo podemos almacenar desde -99.999 hasta 99.999
  
- Bit
  Ej. `BIT(1)` puede ser 1 o 0
  `BIT(3)` puede ser 000, 001, 011, 100...
#### Atributos de los campos numéricos
- `SIGNED` o `UNSIGNED`: 
  Con signo o sin signo
- `ZEROFILL`: 
  Llena los espacios con cero
  Ej. `INT(5)`; si almacenamos 54, el capo quedara como 00054
- `AUTO_INCREMENT`: 
  Realiza un incremento secuencial: 1,2,3...
- `OUT OF RANGE`:
  Error que se presenta cuando los valores se salen de los limites
### Fecha y hora
- `DATE`:
  1000-01-01 hasta 9999-12-31
- `DATETIME`:
  1000-01-01 00:00:00 hasta 9999-12-31 23:59:59
- `TIMESTAMP`:
  1970-01-01 00:00:01 UTC hasta 2038-01-19 UTC
- `TIME`:
  -838:59:59 hasta 839:59:59
- `YEAR`:
  1901 hasta 2155 (puede expresarse en formato de 2 y 4 dígitos)
### String
- `CHAR`
  Cadena de caracteres con valor fijo de 0 a 255
  Ej. `CHAR(4)` = "aa" -> "··aa"
- `VARCHAR`
  Cadena de caracteres con valor variable de 0 a 255
  Ej. `VARCHAR(4)` = "aa" -> "aa"
- `BINARY`
  Cadena de caracteres con valor fijo de 0 a 255 (Con números binarios - bits
- `VARBINARY`
  Cadena de caracteres con valor variable de 0 a 255 (Con números binarios - bits)
- `BLOB`
  Binarios largos
  `TINYBLOB(255 B)`, `MEDIUMBLOB(+16,7E6 B)`, `LONGBLOB(+4,29E9 B)`
- `TEXT`
  Texto largo
  `TINYTEXT(255 c)`, `MEDIUMTEXT(+16,7E6 c)`, `LONGTEXT(+4,29E9  c)`
- `ENUM`
  Definir opciones en una lista predefinida
  Talla `ENUM('pequeño','medio','grande')`
#### Atributos de los Strings
- SET y COLLATE 
  Tipo de conjunto de caracteres que se aceptara utf-8, utf16...
### Campos espaciales (GPS)
- `GEOMETRY`
  Área
- `LINESTRING`
  Línea
- `POINT`
  Punto
- `POLYGON`
  Área
## Modelaje
### Proyectando una base de datos
1. Análisis de los requisitos
   - Entender las reglas del negocio
   - Realizar entrevistas y reuniones
   - Diseñar un modelo que corresponda con la realidad
2. Modelo conceptual
   - Construir el diagrama ER
   - Establece la cardinalidad de las entidades (Numero de entidades con las cuales una determinada entidad puede asociarse 1-1, 1-N, N-N)
3. Atributos de las entidades 
   - Establecer las características de las entidades
4. Transformar el diagrama de entidades en un esquema de tablas
   - Transformar cada entidad en una o mas tablas físicas
   - Cada conexión del modelaje será una relación en las tablas de la base de datos
5. Construir la base de datos
   - Podemos emplear herramientas CASE (Computer-Aide Software Engineering); Star UML, Astah, ERWin
   - Nuestro objetivo es trabajar con MySQL
   - MySQL Workbench ofrece asistentes
___
## Creando una base de datos
- `CHARACTER SET`
  Especifica el conjunto de caracteres de la base de datos por defecto
## Eliminando una base de datos
- `CREATE` y `DROP`
  Pueden ejecutarse utilizando el asistente de Workbench
___
## Creación de Tabla con PK
```MySQL
-- CREAR UNA TB TEMPORAL
CREATE [TEMPORARY] TABLE [IF NOT EXIST] TB_NAME
	(create_definition...)
	[table_options]
	[partition_options]

-- CREAR TB CON PARTICIONES
CREATE [TEMPORARY] TABLE [IF NOT EXIST] TB_NAME
	(create_definition...)
	[table_options]
	[partition_options]
	[IGNORE | REPLACE]
	[AS] QUERY_EXPRESION

-- CREAR UNA TB COMO OTRA TB
CREATE [TEMPORARY] TABLE [IF NOT EXIST] TB_NAME
	{LIKE OLD_TB_NAME | (LIKE OLD_TB_NAME)}
```

Es posible crear y eliminar tablas utilizando el asistente de Workbench
___
## **Insertando Datos en Tablas MySQL**
### **Sintaxis Básica**
```SQL
INSERT INTO nombre_tabla (columna1, columna2, ...)
VALUES (valor1, valor2, ...);
```
- **`INSERT INTO`**: Indica que queremos insertar datos en una tabla.
- **`nombre_tabla`**: El nombre exacto de la tabla donde se insertarán los datos.
- **`(columna1, columna2, ...)`**: La lista de columnas donde se introducirán los valores.
- **`VALUES (valor1, valor2, ...)`**: Los valores a insertar en cada columna correspondiente.

**Ejemplo:**
```SQL
INSERT INTO tb_producto (codigo, descripcion, sabor, tamaño, envase, precio_lista)
VALUES ('1040107', 'Light', 'Sandía', '350 ml', 'Lata', '4.56');
```
### **Insertando Múltiples Registros**
```SQL
INSERT INTO nombre_tabla (columna1, columna2, ...)
VALUES
  (valor1_1, valor1_2, ...),
  (valor2_1, valor2_2, ...),
  (valor3_1, valor3_2, ...);
```
### **Puntos Clave**
- **Orden:** El orden de las columnas en la cláusula `INSERT` debe coincidir con el orden de los valores.
- **Tipos de Datos:** Asegúrate de que los valores que estás insertando coincidan con los tipos de datos definidos en la tabla.
- **Valores de Texto:** Encierra los valores de texto entre comillas simples (').
- **Valores Numéricos:** Los valores numéricos no necesitan comillas.
___
## Importando Datos desde CSV
### Proceso
1. **Identificación del archivo:**
    - Localizar el archivo CSV (e.g., `vendedores.csv`) en el directorio del proyecto.
    - Revisar su estructura: primera fila como encabezado, datos separados por comas.
2. **Workbench:**
    - Crear un nuevo script SQL.
    - Seleccionar la tabla destino (e.g., `tb_vendedor`).
    - **Importar datos:**
        - Acceder al `Table Data Import Wizard`.
        - Seleccionar el archivo CSV.
        - Confirmar la tabla destino y la opción de truncamiento (si aplica).
        - **Encoding:** Verificar el encoding (recomendado: utf-8).
        - **Mapeo de columnas:** Asignar las columnas del CSV a las de la tabla.
        - **Ejecutar:** Iniciar el proceso de importación.
### Ejemplo de código SQL (simplificado):
```MYSQL
LOAD DATA INFILE 'ruta/hacia/vendedores.csv'
INTO TABLE tb_vendedor
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
```
___
## Comando UPDATE
Permite modificar los datos existentes en una tabla.

**Sintaxis:**
```mysql
UPDATE nombre_tabla
SET columna1 = nuevo_valor1, columna2 = nuevo_valor2, ...
WHERE condición;
````

**Ejemplos:**
- **Actualizar precio de un producto:**    ```
```MYSQL
UPDATE productos
SET precio = 10
WHERE id_producto = 123;
```
- **Actualizar varios campos de un cliente:**
```MYSQL
UPDATE clientes
SET nombre = 'Nuevo Nombre', dirección = 'Nueva Dirección'
WHERE id_cliente = 456;
```
---
## Triggers en MySQL

**¿Qué es un Trigger?**
- Un procedimiento almacenado que se ejecuta automáticamente en respuesta a un evento en una tabla (INSERT, UPDATE, DELETE).
- Permite automatizar tareas y mantener la integridad de los datos.

**Sintaxis Básica:**
```mysql
CREATE TRIGGER nombre_trigger
BEFORE/AFTER evento ON tabla
FOR EACH ROW
BEGIN
    -- Código a ejecutar
END;
```
- **BEFORE:** El trigger se ejecuta antes del evento.
- **AFTER:** El trigger se ejecuta después del evento.
- **evento:** INSERT, UPDATE o DELETE.
- **tabla:** La tabla sobre la que se activará el trigger.
- **FOR EACH ROW:** Indica que el trigger se ejecutará para cada fila afectada por el evento.

**Ejemplo Práctico:**
```mysql
CREATE TRIGGER tr_log_inserciones
AFTER INSERT ON mi_tabla
FOR EACH ROW
BEGIN
    INSERT INTO tabla_log (id, accion, fecha)
    VALUES (NEW.id, 'Inserción', NOW());
END;
```
- Este trigger inserta un registro en una tabla de log cada vez que se inserta un nuevo registro en la tabla "mi_tabla".

**Usos Comunes de los Triggers:**
- **Auditar cambios:** Registrar modificaciones en los datos.
- **Validar datos:** Asegurar que los datos insertados cumplen con ciertas condiciones.
- **Cascadas:** Actualizar automáticamente otras tablas relacionadas.
- **Calcular valores:** Realizar cálculos complejos basados en los datos modificados.
## Más allá de los comandos DML
En este curso exploramos los fundamentos de la manipulación de datos en MySQL utilizando los comandos DML. No obstante, es crucial conocer las herramientas y técnicas más avanzadas para trabajar con grandes volúmenes de datos en entornos reales.

- **Stored Procedures:**
    
    - Permiten crear bloques de código reutilizables para realizar operaciones comunes.
    - Ofrecen mayor estructura y organización a la base de datos.
    - Son ideales para implementar reglas de negocio y automatizar tareas.
- **Herramientas ETL:**
    
    - Extraen, transforman y cargan datos entre diferentes sistemas.
    - Facilitan la integración de datos provenientes de diversas fuentes.
    - Ejemplos: Informatica, Pentaho, Talend.
- **Programación:**
    
    - Lenguajes como Python, Java, C# permiten una interacción más flexible con la base de datos.
    - Ofrecen mayor control sobre la manipulación de datos y la implementación de algoritmos complejos.

Si bien los comandos DML son fundamentales, es esencial conocer las herramientas y técnicas avanzadas para trabajar con datos de manera eficiente y eficaz. Los stored procedures, las herramientas ETL y la programación ofrecen mayor flexibilidad y potencia para enfrentar los desafíos del manejo de datos en la actualidad.
