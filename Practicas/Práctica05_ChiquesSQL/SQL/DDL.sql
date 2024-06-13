/*
Script para la creación de la base de datos 'Hoteles Luna'
Equipo: ChiquesSQL
*/

-- Creación del esquema
-- Este fragmento de código asegura que el esquema "public" exista en la base de datos PostgreSQL, eliminándolo primero si ya existe y luego creándolo nuevamente.
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;



-- OBSERVACIÓN: Se agregan estas restricciones para la base de datos (se mencionaron en la Práctica04). Adicionalmente, 
-- en la tablas donde se tiene una columna "horario" se optó por separarla en dos (horarioInicio, horarioFin)
-- No habrá valores de tipo NULL.
-- La evaluación en las columnas Recomendacion, servicioRecibido, Limpieza y VolverHospedar será de tipo entero entre 1 a 5.
-- Para el atributo numeroInterior se permitirán valores enteros o ’SN’ para el caso donde no se tenga el dato.
-- El atributo Genero solo permitirá los valores ’M’ (mujer) o ’H’ (hombre).
-- petfriendly y activa solo permitirá los valores ’SI’ Y ’NO’.
-- En variables de tipo entero o flotante solo se recibirán valores mayores o iguales a cero.


-------------------------------- Tabla tarjeta --------------------------------


-- Creación de la tabla tarjeta
CREATE TABLE tarjeta (
    idFormaTarjeta VARCHAR(20),            -- Identificador de la forma de pago
    numeroTarjeta VARCHAR(20),      -- Número de la tarjeta
    vencimiento DATE               -- Fecha de vencimiento de la tarjeta
);

-- Se agrega la llave primaria 
ALTER TABLE tarjeta ADD CONSTRAINT tarjetat_pkey 
PRIMARY KEY (idFormaTarjeta); 

-- Restricciones para la tabla tarjeta
ALTER TABLE tarjeta ALTER COLUMN idFormaTarjeta SET NOT NULL;          -- La columna idForma no puede ser NULL
ALTER TABLE tarjeta ALTER COLUMN numeroTarjeta SET NOT NULL;    -- La columna numeroTarjeta no puede ser NULL
ALTER TABLE tarjeta ALTER COLUMN vencimiento SET NOT NULL;      -- La columna vencimiento no puede ser NULL

ALTER TABLE tarjeta ADD CONSTRAINT numerotarjeta_valido CHECK(length(numeroTarjeta::text) = 16 AND numeroTarjeta::text ~ '^[0-9]{16}$');
-- Se asegura de rebicir 16 dígitos entre 0 y 9 cada uno
 

-------------------------------- Tabla hotel --------------------------------


-- Tabla hotel
CREATE TABLE hotel (
    idHotel VARCHAR(20),
    nombreEstablecimiento VARCHAR(50),
    horaCheckIn TIME,
    horaCheckOut TIME,
    petFriendly CHAR(2),
    servicio VARCHAR(100),
    numeroInterior VARCHAR(10),
    numeroExterior INT,
    colonia VARCHAR(60),
    calle VARCHAR(70),
    estado VARCHAR(50)
);

-- OBSERVACIÓN: ALTER TABLE es una declaración en SQL que se utiliza para modificar una tabla existente en una base de datos relacional

-- Se agrega la llave primaria 
 ALTER TABLE hotel ADD CONSTRAINT hotel_pkey 
 PRIMARY KEY (idHotel);

--Restricciones hotel
--Dominio

ALTER TABLE hotel ADD CONSTRAINT hotel_nombre_no_vacio -- Se asegura que el nombre del establecimiento no sea la cadena vacía
CHECK(nombreEstablecimiento <> '');

ALTER TABLE hotel ADD CONSTRAINT hotel_checkIn_no_null -- Se asegura que la hora de check-in no sea NULL
CHECK(horaCheckIn IS NOT NULL);

ALTER TABLE hotel ADD CONSTRAINT hotel_checkOut_no_null -- Se asegura que la hora de check-out no sea NULL
CHECK(horaCheckOut IS NOT NULL);

ALTER TABLE hotel ADD CONSTRAINT hotel_petfriendly_no_vacio -- Se asegura que petFriendly no sea la cadena vacía
CHECK(petFriendly <> '');

ALTER TABLE hotel -- Se asegura que la columna petFriendly solo acepte los valores 'SI' y 'NO'
ADD CONSTRAINT petfriendly_valores_permitidos CHECK (petFriendly IN ('SI', 'NO'));

ALTER TABLE hotel ADD CONSTRAINT hotel_servicio_no_vacio -- Se asegura que servicio no sea la cadena vacía
CHECK(servicio <> '');

ALTER TABLE hotel ADD CONSTRAINT hotel_numeroInterior_no_vacio -- Se asegura que numeroInterior no sea la cadena vacía
CHECK(numeroInterior <> '');

ALTER TABLE hotel ADD CONSTRAINT hotel_numeroExterior_no_null -- Se asegura que numeroExterior no sea NULL
CHECK(numeroExterior IS NOT NULL);

ALTER TABLE hotel ADD CONSTRAINT hotel_colonia_no_vacia -- Se asegura que la colonia no sea la cadena vacía
CHECK(colonia <> '');

ALTER TABLE hotel ADD CONSTRAINT hotel_calle_no_vacia -- Se asegura que la calle no sea la cadena vacía
CHECK(calle <> '');

ALTER TABLE hotel ADD CONSTRAINT hotel_estado_no_vacio -- Se asegura que el estado no sea la cadena vacía
CHECK(estado <> '');

ALTER TABLE hotel ALTER COLUMN numeroInterior -- Se escribe ’SN’ para el caso donde no se tenga el dato
SET DEFAULT('SN');

ALTER TABLE hotel ADD CONSTRAINT numeroExterior_check CHECK(numeroExterior > 0); -- Se asegura de que el número exterior solo reciba valores 
	-- positivos

-------------------------------- Tabla personaldDeApoyo --------------------------------


-- Creación de la tabla personalDeApoyo
CREATE TABLE personalDeApoyo (
    idPersona VARCHAR(20),          -- Identificador de la persona
    idHotel VARCHAR(20),            -- Identificador del hotel
    RFC VARCHAR(13),               -- Registro Federal de Contribuyentes de la persona
    idEmpleado VARCHAR(13),                 -- Identificador del empleado (si es empleado)
    nombre VARCHAR(100),          -- Nombre de la persona
    apellidoPaterno VARCHAR(100), -- Apellido paterno de la persona
    apellidoMaterno VARCHAR(100), -- Apellido materno de la persona
    fechaNacimiento DATE,          -- Fecha de nacimiento de la persona
    genero CHAR(1),               -- Género de la persona
    fechaContratacion DATE,       -- Fecha de contratación del empleado (si es empleado)
    horarioInicio TIME,           -- Hora de inicio de trabajo del empleado (si es empleado)
	horarioFin TIME,               -- Hora de fin de trabajo del empleado (si es empleado)
    numeroInterior VARCHAR(10),    -- Número interior de la dirección (se permite 'SN' si no se tiene el dato)
    numeroExterior INT,            -- Número exterior de la dirección
    colonia VARCHAR(60),           -- Colonia de la dirección
    calle VARCHAR(70),             -- Calle de la dirección
    estado VARCHAR(50)            -- Estado de la dirección
);

-- Se agrega la llave primaria 
ALTER TABLE personalDeApoyo ADD CONSTRAINT personalDeApoyo_pkey 
PRIMARY KEY (idPersona); 

-- Referencial para la tabla personalDeApoyo
ALTER TABLE personalDeApoyo ADD CONSTRAINT personalDeApoyo_hotel_fkey
FOREIGN KEY (idHotel) REFERENCES hotel (idHotel);


-- Restricciones para la tabla personalDeApoyo
-- Dominio
-- No habrá valores de tipo NULL
ALTER TABLE personalDeApoyo ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE personalDeApoyo ALTER COLUMN apellidoPaterno SET NOT NULL;
ALTER TABLE personalDeApoyo ALTER COLUMN apellidoMaterno SET NOT NULL;
ALTER TABLE personalDeApoyo ALTER COLUMN fechaNacimiento SET NOT NULL;
ALTER TABLE personalDeApoyo ALTER COLUMN genero SET NOT NULL;
ALTER TABLE PersonalDeApoyo ALTER COLUMN horarioInicio SET NOT NULL; -- Restricción NOT NULL para la columna horarioInicio
ALTER TABLE PersonalDeApoyo ALTER COLUMN horarioFin SET NOT NULL;
ALTER TABLE personalDeApoyo ALTER COLUMN RFC SET NOT NULL;
ALTER TABLE personalDeApoyo ALTER COLUMN numeroExterior SET NOT NULL;
ALTER TABLE personalDeApoyo ALTER COLUMN colonia SET NOT NULL;
ALTER TABLE personalDeApoyo ALTER COLUMN calle SET NOT NULL;
ALTER TABLE personalDeApoyo ALTER COLUMN estado SET NOT NULL;
ALTER TABLE personalDeApoyo ALTER COLUMN idHotel SET NOT NULL;

ALTER TABLE personalDeApoyo ALTER COLUMN numeroInterior
SET DEFAULT('SN');

ALTER TABLE personalDeApoyo ADD CONSTRAINT RFC_check CHECK(RFC ~ '[A-Z]{4}[0-9]{6}[A-Z]{2}[0-9]{1}'); -- Se asegura de que los 13 dígitos
-- del RFC coincidan con la estructura usual

ALTER TABLE personalDeApoyo ADD CONSTRAINT genero_valido
CHECK (genero IN ('M', 'H')); -- Restricción CHECK para asegurar que el género sea 'M' o 'H'

ALTER TABLE personalDeApoyo ADD CONSTRAINT numeroExterior_check CHECK(numeroExterior > 0); -- Se asegura de que el número exterior solo reciba valores 
-- positivos


-------------------------------- Tabla servicioComida --------------------------------


-- Creación de la tabla servicioComida
CREATE TABLE servicioComida (
    idPersona VARCHAR(20),           -- Identificador de la persona
    idHotel VARCHAR(20),            -- Identificador del hotel
    RFC VARCHAR(13),              -- RFC de la persona
    idEmpleado VARCHAR(13),       -- Identificador del empleado 
    nombre VARCHAR(100),          -- Nombre de la persona
    apellidoPaterno VARCHAR(100), -- Apellido paterno de la persona
    apellidoMaterno VARCHAR(100), -- Apellido materno de la persona
    fechaNacimiento DATE,          -- Fecha de nacimiento de la persona
    genero CHAR(1),               -- Género de la persona
    fechaContratacion DATE,       -- Fecha de contratación del empleado (si es empleado)
    horarioInicio TIME,            -- Horario de inicio de trabajo del empleado (si es empleado)
	horarioFin TIME,               -- Horario de finalización de trabajo del empleado (si es empleado)
    numeroInterior VARCHAR(10),    -- Número interior de la dirección (se permite 'SN' si no se tiene el dato)
    numeroExterior INT,            -- Número exterior de la dirección
    colonia VARCHAR(60),           -- Colonia de la dirección
    calle VARCHAR(70),             -- Calle de la dirección
    estado VARCHAR(50)            -- Estado de la dirección
);

-- Se agrega la llave primaria 
ALTER TABLE servicioComida ADD CONSTRAINT servicioComida_pkey 
PRIMARY KEY (idPersona); 

-- Referencial para la tabla servicioComida
ALTER TABLE servicioComida ADD CONSTRAINT servicioComida_hotel_fkey
FOREIGN KEY (idHotel) REFERENCES hotel (idHotel);


-- Restricciones para la tabla servicioComida
-- Dominio
-- No habrá valores de tipo NULL
ALTER TABLE servicioComida ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN apellidoPaterno SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN apellidoMaterno SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN fechaNacimiento SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN genero SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN RFC SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN horarioInicio SET NOT NULL; -- Restricción NOT NULL para la columna horarioInicio
ALTER TABLE servicioComida ALTER COLUMN horarioFin SET NOT NULL; -- Restricción NOT NULL para la columna horarioFin
ALTER TABLE servicioComida ALTER COLUMN numeroExterior SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN colonia SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN calle SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN estado SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN idHotel SET NOT NULL;

ALTER TABLE servicioComida ADD CONSTRAINT RFC_check CHECK(RFC ~ '[A-Z]{4}[0-9]{6}[A-Z]{2}[0-9]{1}'); -- Se asegura de que los 13 dígitos
-- del RFC coincidan con la estructura usual

ALTER TABLE servicioComida ADD CONSTRAINT genero_valido
CHECK (genero IN ('M', 'H')); -- Restricción CHECK para asegurar que el género sea 'M' o 'H'

ALTER TABLE servicioComida ALTER COLUMN numeroInterior
SET DEFAULT('SN');

ALTER TABLE servicioComida ADD CONSTRAINT numeroExterior_check CHECK(numeroExterior > 0); -- Se asegura de que el número exterior solo reciba valores 
-- positivos


-------------------------------- Tabla Recepcionista --------------------------------


-- Creación de la tabla recepcionista
CREATE TABLE recepcionista (
    idPersona VARCHAR(20)	,     -- Identificador de la persona
    idHotel VARCHAR(20),            -- Identificador del hotel
    RFC VARCHAR(13),               -- Registro Federal de Contribuyentes de la persona
    idEmpleado VARCHAR(13),                 -- Identificador del empleado (si es empleado)
    nombre VARCHAR(100),          -- Nombre de la persona
    apellidoPaterno VARCHAR(100), -- Apellido paterno de la persona
    apellidoMaterno VARCHAR(100), -- Apellido materno de la persona
    fechaNacimiento DATE,          -- Fecha de nacimiento de la persona
    genero CHAR(1),               -- Género de la persona
    fechaContratacion DATE,        -- Fecha de contratación del empleado (si es empleado)
    horarioInicio TIME,            -- Inicio de horario de trabajo del empleado (si es empleado)
	horarioFin TIME,               -- Fin de horario de trabajo del empleado (si es empleado)
    numeroInterior VARCHAR(10),    -- Número interior de la dirección (se permite 'SN' si no se tiene el dato)
    numeroExterior INT,            -- Número exterior de la dirección
    colonia VARCHAR(60),           -- Colonia de la dirección
    calle VARCHAR(70),             -- Calle de la dirección
    estado VARCHAR(50)            -- Estado de la dirección
);

-- Se agrega la llave primaria 
ALTER TABLE recepcionista ADD CONSTRAINT recepcionista_pkey 
PRIMARY KEY (idPersona); 

-- Referencial para la tabla recepcionista
ALTER TABLE recepcionista ADD CONSTRAINT recepcionista_hotel_fkey
FOREIGN KEY (idHotel) REFERENCES hotel (idHotel);


-- Restricciones para la tabla recepcionista
-- Dominio
-- No habrá valores de tipo NULL
ALTER TABLE recepcionista ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN apellidoPaterno SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN apellidoMaterno SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN fechaNacimiento SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN genero SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN RFC SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN horarioInicio SET NOT NULL; -- Restricción NOT NULL para la columna horarioInicio
ALTER TABLE recepcionista ALTER COLUMN horarioFin SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN numeroExterior SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN colonia SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN calle SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN estado SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN idHotel SET NOT NULL;

ALTER TABLE recepcionista ALTER COLUMN numeroInterior
SET DEFAULT('SN');

ALTER TABLE recepcionista ADD CONSTRAINT RFC_check CHECK(RFC ~ '[A-Z]{4}[0-9]{6}[A-Z]{2}[0-9]{1}'); -- Se asegura de que los 13 dígitos
-- del RFC coincidan con la estructura usual

ALTER TABLE recepcionista ADD CONSTRAINT genero_valido
CHECK (genero IN ('M', 'H')); -- Restricción CHECK para asegurar que el género sea 'M' o 'H'

ALTER TABLE recepcionista ADD CONSTRAINT numeroExterior_check CHECK(numeroExterior > 0); -- Se asegura de que el número exterior solo reciba valores 
	-- positivos


-------------------------------- Tabla limpiezaInterna--------------------------------


-- Creación de la tabla limpiezaInterna
CREATE TABLE limpiezaInterna (
    idPersona VARCHAR(20),          -- Identificador de la persona
    idHotel VARCHAR(20),            -- Identificador del hotel
    RFC VARCHAR(13),               -- Registro Federal de Contribuyentes de la persona
    idEmpleado VARCHAR(13),                 -- Identificador del empleado (si es empleado)
    nombre VARCHAR(100),          -- Nombre de la persona
    apellidoPaterno VARCHAR(100), -- Apellido paterno de la persona
    apellidoMaterno VARCHAR(100), -- Apellido materno de la persona
    fechaNacimiento DATE,          -- Fecha de nacimiento de la persona
    genero CHAR(1),                -- Género de la persona
    fechaContratacion DATE,        -- Fecha de contratación del empleado (si es empleado)
    horarioInicio TIME,            -- Hora de inicio de trabajo del empleado (si es empleado)
	horarioFin TIME,               -- Hora de fin de trabajo del empleado (si es empleado)
    numeroInterior VARCHAR(10),    -- Número interior de la dirección (se permite 'SN' si no se tiene el dato)
    numeroExterior INT,            -- Número exterior de la dirección
    colonia VARCHAR(60),           -- Colonia de la dirección
    calle VARCHAR(70),             -- Calle de la dirección
    estado VARCHAR(50)            -- Estado de la dirección
);

-- Se agrega la llave primaria 
ALTER TABLE limpiezaInterna ADD CONSTRAINT limpiezaInterna_pkey 
PRIMARY KEY (idPersona); 

-- Referencial para la tabla limpiezaInterna
ALTER TABLE limpiezaInterna ADD CONSTRAINT limpiezaInterna_hotel_fkey
FOREIGN KEY (idHotel) REFERENCES hotel (idHotel);


-- Restricciones para la tabla limpiezaInterna
-- Dominio
-- No habrá valores de tipo NULL
ALTER TABLE limpiezaInterna ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN apellidoPaterno SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN apellidoMaterno SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN fechaNacimiento SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN genero SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN horarioInicio SET NOT NULL; -- Restricción NOT NULL para la columna horarioInicio
ALTER TABLE limpiezaInterna ALTER COLUMN horarioFin SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN RFC SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN numeroExterior SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN colonia SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN calle SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN estado SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN idHotel SET NOT NULL;

ALTER TABLE limpiezaInterna ALTER COLUMN numeroInterior
SET DEFAULT('SN');

ALTER TABLE limpiezaInterna ADD CONSTRAINT RFC_check CHECK(RFC ~ '[A-Z]{4}[0-9]{6}[A-Z]{2}[0-9]{1}'); -- Se asegura de que los 13 dígitos
-- del RFC coincidan con la estructura usual

ALTER TABLE limpiezaInterna ADD CONSTRAINT genero_valido
CHECK (genero IN ('M', 'H')); -- Restricción CHECK para asegurar que el género sea 'M' o 'H'

ALTER TABLE limpiezaInterna ADD CONSTRAINT numeroExterior_check CHECK(numeroExterior > 0); -- Se asegura de que el número exterior solo reciba valores 
-- positivos
-------------------------------- Tabla telefonoHotel --------------------------------


-- Definición de la tabla telefonoHotel
CREATE TABLE telefonoHotel (
    idHotel VARCHAR(20),
    telefonoHotel VARCHAR(20)
);

-- Referencial 
-- Se agrega una restricción de clave externa (foreign key constraint) llamada 'telefonoHotel_fkey' a la tabla telefonoHotel. 
ALTER TABLE telefonoHotel ADD CONSTRAINT telefonoHotel_fkey
FOREIGN KEY(idHotel) REFERENCES hotel(idHotel);

--Restricciones telefonoHotel 
--Dominio
ALTER TABLE telefonoHotel
ADD CONSTRAINT telefonoHotel_no_vacio CHECK (telefonoHotel <> ''); -- Restricción CHECK para garantizar que el campo telefonoHotel no esté vacío
ALTER TABLE telefonoHotel ADD CONSTRAINT telefonoHotel_valido CHECK(length(telefonoHotel::text) = 10 AND telefonoHotel::text ~ '^[0-9]{10}$');
-- Se asegura de rebicir 10 dígitos entre 0 y 9 cada uno

/*
-------------------------------- Tabla persona --------------------------------
-- Se agrega la tabla persona porque se hace referencia en algunas tablas a algunos atributos de ésta, a saber, en las llaves primarias


CREATE TABLE persona (
	idPersona VARCHAR(20),
    nombre VARCHAR(100),
    paterno VARCHAR(100),
    materno VARCHAR(100),
    fechaNacimiento DATE,
    genero CHAR(1)
);

-- Se agrega la llave primaria 
ALTER TABLE persona ADD CONSTRAINT persona_pkey 
PRIMARY KEY (idPersona);

--Restricciones persona
--Dominio
ALTER TABLE persona ALTER COLUMN nombre SET NOT NULL; -- Establece que el campo "nombre" no puede ser nulo.
ALTER TABLE persona ALTER COLUMN paterno SET NOT NULL; -- Establece que el campo "paterno" no puede ser nulo.
ALTER TABLE persona ALTER COLUMN materno SET NOT NULL; -- Establece que el campo "materno" no puede ser nulo.
ALTER TABLE persona ALTER COLUMN fechaNacimiento SET NOT NULL; -- Establece que el campo "fechaNacimiento" no puede ser nulo.
ALTER TABLE persona ALTER COLUMN genero SET NOT NULL; -- Establece que el campo "genero" no puede ser nulo.

ALTER TABLE persona ADD CONSTRAINT genero_valido CHECK (genero IN ('M', 'H')); -- Añade una restricción que asegura que el valor del campo "genero" solo puede ser 'M' o 'H'.
*/

-------------------------------- Tabla telefonoServicioComida --------------------------------


-- Definición de la tabla telefonoServicioComida
CREATE TABLE telefonoServicioComida (
    idPersona VARCHAR(20),
    telefonoServicioComida VARCHAR(20)
);

-- Referencial 
ALTER TABLE telefonoServicioComida ADD CONSTRAINT telefonoServicioComida_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES servicioComida(idPersona);

-- Se agrega la llave primaria 
ALTER TABLE telefonoServicioComida ADD CONSTRAINT telefonoServicioComida_pkey 
PRIMARY KEY (idPersona, telefonoServicioComida);

--Restricciones telefonoServicioComida
--Dominio
ALTER TABLE telefonoServicioComida ADD CONSTRAINT telefonoServicioComida_no_vacio CHECK (telefonoServicioComida <> ''); -- Restricción CHECK para garantizar que el campo telefonoPersona no esté vacío
ALTER TABLE telefonoServicioComida ADD CONSTRAINT telefonoServicioComida_valido CHECK(length(telefonoServicioComida::text) = 10 AND telefonoServicioComida::text ~ '^[0-9]{10}$');
-- Se asegura de rebicir 10 dígitos entre 0 y 9 cada uno


-------------------------------- Tabla telefonoRecepcionista --------------------------------


-- Definición de la tabla telefonoRecepcionista
CREATE TABLE telefonoRecepcionista (
    idPersona VARCHAR(20),
    telefonoRecepcionista VARCHAR(10)
);

-- Referencial 
ALTER TABLE telefonoRecepcionista ADD CONSTRAINT telefonoRecepcionista_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES recepcionista(idPersona);

-- Se agrega la llave primaria 
ALTER TABLE telefonoRecepcionista ADD CONSTRAINT telefonoRecepcionista_pkey 
PRIMARY KEY (idPersona, telefonoRecepcionista);

--Restricciones telefonoRecepcionista
--Dominio
ALTER TABLE telefonoRecepcionista ADD CONSTRAINT telefonoRecepcionista_no_vacio CHECK (telefonoRecepcionista <> ''); -- Restricción CHECK para garantizar que el campo telefonoPersona no esté vacío
ALTER TABLE telefonoRecepcionista ADD CONSTRAINT telefonoRecepcionista_valido CHECK(length(telefonoRecepcionista::text) = 10 AND telefonoRecepcionista::text ~ '^[0-9]{10}$');
-- Se asegura de rebicir 10 dígitos entre 0 y 9 cada uno


-------------------------------- Tabla telefonoPersonalApoyo --------------------------------


-- Definición de la tabla telefonoPersonalApoyo
CREATE TABLE telefonoPersonalApoyo (
    idPersona VARCHAR(20),
    telefonoPersonalApoyo VARCHAR(10)
);

-- Referencial 
ALTER TABLE telefonoPersonalApoyo ADD CONSTRAINT telefonoPersonalApoyo_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES personalDeApoyo(idPersona);

-- Se agrega la llave primaria 
ALTER TABLE telefonoPersonalApoyo ADD CONSTRAINT telefonoPersonalApoyo_pkey 
PRIMARY KEY (idPersona, telefonoPersonalApoyo);

--Restricciones telefonoPersonalApoyo
--Dominio
ALTER TABLE telefonoPersonalApoyo ADD CONSTRAINT telefonoPersonalApoyo_no_vacio CHECK (telefonoPersonalApoyo <> ''); -- Restricción CHECK para garantizar que el campo telefonoPersona no esté vacío
ALTER TABLE telefonoPersonalApoyo ADD CONSTRAINT telefonoPersonalApoyo_valido CHECK(length(telefonoPersonalApoyo::text) = 10 AND telefonoPersonalApoyo::text ~ '^[0-9]{10}$');
-- Se asegura de rebicir 10 dígitos entre 0 y 9 cada uno


-------------------------------- Tabla telefonoLimpiezaInterna --------------------------------


-- Definición de la tabla telefonoLimpiezaInterna
CREATE TABLE telefonoLimpiezaInterna (
    idPersona VARCHAR(20),
    telefonoLimpiezaInterna VARCHAR(10)
);

-- Referencial 
ALTER TABLE telefonoLimpiezaInterna ADD CONSTRAINT telefonoLimpiezaInterna_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES limpiezaInterna(idPersona);

-- Se agrega la llave primaria 
ALTER TABLE telefonoLimpiezaInterna ADD CONSTRAINT telefonoLimpiezaInterna_pkey 
PRIMARY KEY (idPersona, telefonoLimpiezaInterna);

--Restricciones telefonoLimpiezaInterna
--Dominio
ALTER TABLE telefonoLimpiezaInterna ADD CONSTRAINT telefonoLimpiezaInterna_no_vacio CHECK (telefonoLimpiezaInterna <> ''); -- Restricción CHECK para garantizar que el campo telefonoPersona no esté vacío
ALTER TABLE telefonoLimpiezaInterna ADD CONSTRAINT telefonoLimpiezaInterna_valido CHECK(length(telefonoLimpiezaInterna::text) = 10 AND telefonoLimpiezaInterna::text ~ '^[0-9]{10}$');
-- Se asegura de rebicir 10 dígitos entre 0 y 9 cada uno


-------------------------------- Tabla correoPersonalApoyo --------------------------------


-- Definición de la tabla correoPersonalApoyo
CREATE TABLE correoPersonalApoyo (
    idPersona VARCHAR(20),
    correoPersonalApoyo VARCHAR(100)
);

-- Referencial 
ALTER TABLE correoPersonalApoyo ADD CONSTRAINT correoPersonalApoyo_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES personalDeApoyo(idPersona);

-- Se agrega la llave primaria 
ALTER TABLE correoPersonalApoyo ADD CONSTRAINT correoPersonalApoyo_pkey 
PRIMARY KEY (idPersona, correoPersonalApoyo);

-- Restricciones correoPersonalApoyo
-- Dominio
ALTER TABLE correoPersonalApoyo
ADD CONSTRAINT correoPersonalApoyo_no_vacio -- Restricción CHECK para garantizar que el campo correoPersonalApoyo no esté vacío
CHECK (correoPersonalApoyo <> '');


-------------------------------- Tabla correoServicioComida --------------------------------


-- Definición de la tabla correoServicioComida
CREATE TABLE correoServicioComida (
    idPersona VARCHAR(20),
    correoServicioComida VARCHAR(100)
);

-- Referencial 
ALTER TABLE correoServicioComida ADD CONSTRAINT correoServicioComida_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES servicioComida(idPersona);

-- Se agrega la llave primaria 
ALTER TABLE correoServicioComida ADD CONSTRAINT correoServicioComida_pkey 
PRIMARY KEY (idPersona, correoServicioComida);

-- Restricciones correoServicioComida
-- Dominio
ALTER TABLE correoServicioComida
ADD CONSTRAINT correoServicioComida_no_vacio -- Restricción CHECK para garantizar que el campo correoServicioComida no esté vacío
CHECK (correoServicioComida <> '');


-------------------------------- Tabla correoRecepcionista --------------------------------


-- Definición de la tabla correoRecepcionista
CREATE TABLE correoRecepcionista (
    idPersona VARCHAR(20),
    correoRecepcionista VARCHAR(100)
);

-- Referencial 
ALTER TABLE correoRecepcionista ADD CONSTRAINT correoRecepcionista_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES recepcionista(idPersona);

-- Se agrega la llave primaria 
ALTER TABLE correoRecepcionista ADD CONSTRAINT correoRecepcionista_pkey 
PRIMARY KEY (idPersona, correoRecepcionista);

-- Restricciones correoRecepcionista
-- Dominio
ALTER TABLE correoRecepcionista
ADD CONSTRAINT correoRecepcionista_no_vacio -- Restricción CHECK para garantizar que el campo correoRecepcionista no esté vacío
CHECK (correoRecepcionista <> '');


-------------------------------- Tabla correoLimpiezaInterna --------------------------------


-- Definición de la tabla correoLimpiezaInterna
CREATE TABLE correoLimpiezaInterna (
    idPersona VARCHAR(20),
    correoLimpiezaInterna VARCHAR(100)
);

-- Referencial 
ALTER TABLE correoLimpiezaInterna ADD CONSTRAINT correoLimpiezaInterna_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES limpiezaInterna(idPersona);

-- Se agrega la llave primaria 
ALTER TABLE correoLimpiezaInterna ADD CONSTRAINT correoLimpiezaInterna_pkey 
PRIMARY KEY (idPersona, correoLimpiezaInterna);

-- Restricciones correoLimpiezaInterna
-- Dominio
ALTER TABLE correoLimpiezaInterna
ADD CONSTRAINT correoLimpiezaInternaa_no_vacio -- Restricción CHECK para garantizar que el campo correoLimpiezaInterna no esté vacío
CHECK (correoLimpiezaInterna <> '');


/*
-------------------------------- Tabla empleado --------------------------------
-- Se agrega la tabla empleado porque se hace referencia en algunas tablas a algunos atributos de ésta, a saber, en las llaves primarias


-- Creación de la tabla empleado
CREATE TABLE empleado (
    RFC VARCHAR(13),			  -- Definición de la columna RFC como la llave primaria
    nombre VARCHAR(100),          -- Nombre del empleado
    paterno VARCHAR(100),         -- Apellido paterno del empleado
    materno VARCHAR(100),         -- Apellido materno del empleado
    fechaNacimiento DATE,         -- Fecha de nacimiento del empleado
    genero CHAR(1),               -- Género del empleado
    horarioInicio TIME,           -- Inicio del horario laboral del empleado
	horarioFin TIME,              -- Fin del horario laboral del empleado
    numeroInterior VARCHAR(10),   -- Número interior de la dirección del empleado
    numeroExterior INT,           -- Número exterior de la dirección del empleado
    colonia VARCHAR(60),          -- Colonia de la dirección del empleado
    calle VARCHAR(70),            -- Calle de la dirección del empleado
    estado VARCHAR(50),           -- Estado de la dirección del empleado
    fechaContratacion DATE,        -- Fecha de contratación del empleado
	idPersona VARCHAR(20)         -- ID de persona 
);

-- Se agrega la llave primaria 
ALTER TABLE empleado ADD CONSTRAINT empleado_pkey 
PRIMARY KEY (idPersona);

-- Restricciones empleado
-- Dominio
ALTER TABLE empleado ALTER COLUMN RFC SET NOT NULL; -- Restricción NOT NULL para la columna RFC
ALTER TABLE empleado ALTER COLUMN nombre SET NOT NULL; -- Restricción NOT NULL para la columna nombre
ALTER TABLE empleado ALTER COLUMN paterno SET NOT NULL; -- Restricción NOT NULL para la columna paterno
ALTER TABLE empleado ALTER COLUMN materno SET NOT NULL; -- Restricción NOT NULL para la columna materno
ALTER TABLE empleado ALTER COLUMN fechaNacimiento SET NOT NULL; -- Restricción NOT NULL para la columna fechaNacimiento
ALTER TABLE empleado ALTER COLUMN genero SET NOT NULL; -- Restricción NOT NULL para la columna genero
ALTER TABLE empleado ALTER COLUMN horarioInicio SET NOT NULL; -- Restricción NOT NULL para la columna horarioInicio
ALTER TABLE empleado ALTER COLUMN horarioFin SET NOT NULL; -- Restricción NOT NULL para la columna horarioFin
ALTER TABLE empleado ALTER COLUMN numeroInterior SET NOT NULL; -- Restricción NOT NULL para la columna numeroInterior
ALTER TABLE empleado ALTER COLUMN numeroExterior SET NOT NULL; -- Restricción NOT NULL para la columna numeroExterior
ALTER TABLE empleado ALTER COLUMN colonia SET NOT NULL; -- Restricción NOT NULL para la columna colonia
ALTER TABLE empleado ALTER COLUMN calle SET NOT NULL; -- Restricción NOT NULL para la columna calle
ALTER TABLE empleado ALTER COLUMN estado SET NOT NULL; -- Restricción NOT NULL para la columna estado
ALTER TABLE empleado ALTER COLUMN fechaContratacion SET NOT NULL; -- Restricción NOT NULL para la columna fechaContratacion
ALTER TABLE empleado ALTER COLUMN idPersona SET NOT NULL; -- Restricción NOT NULL para la columna idPersona

ALTER TABLE empleado ADD CONSTRAINT genero_valido
CHECK (genero IN ('M', 'H')); -- Restricción CHECK para asegurar que el género sea 'M' o 'H'

ALTER TABLE empleado ALTER COLUMN numeroInterior -- Se escribe ’SN’ para el caso donde no se tenga el dato
SET DEFAULT('SN');

ALTER TABLE empleado ADD CONSTRAINT RFC_check CHECK(RFC ~ '[A-Z]{4}[0-9]{6}[A-Z]{2}[0-9]{1}'); -- Se asegura de que los 18 dígitos
-- del RFC coincidan con la estructura usual

ALTER TABLE empleado ADD CONSTRAINT numeroExterior_check CHECK(numeroExterior > 0); -- Se asegura de que el número exterior solo reciba valores 
	-- positivos
*/


-------------------------------- Tabla efectivo --------------------------------


-- Creación de la tabla EFECTIVO
CREATE TABLE efectivo (
    idFormaEfectivo VARCHAR(20) -- Identificador de la forma de pago en efectivo
);

-- Establecer la llave primaria con ALTER TABLE
ALTER TABLE efectivo ADD CONSTRAINT efectivo_pkey PRIMARY KEY (idFormaEfectivo);

-- Restricciones para la tabla EFECTIVO
ALTER TABLE efectivo ALTER COLUMN idFormaEfectivo SET NOT NULL; -- La columna idForma no puede ser null

-------------------------------- Tabla huesped --------------------------------


-- Creación de la tabla huesped
CREATE TABLE huesped (
    idPersona VARCHAR(8), 				-- id del huésped
    idHotel VARCHAR(20),
    nombre VARCHAR(100),			     -- Nombre del huésped
    paterno VARCHAR(100),    -- Apellido paterno del huésped
    materno VARCHAR(100),    -- Apellido materno del huésped
    fechaNacimiento DATE,     -- Fecha de nacimiento del huésped
    genero CHAR(1),          -- Género del huésped
    nacionalidad VARCHAR(50),          -- Nacionalidad del huésped
    idpago VARCHAR(8),                  -- ID de pago del huésped
    idFormaEfectivo VARCHAR(20),                 -- ID de la forma de pago en efectivo del huésped
	idFormaTarjeta VARCHAR(20)                 -- ID de la forma de pago en tarjeta del huésped
);

-- Se agrega la llave primaria 
ALTER TABLE huesped ADD CONSTRAINT huesped_pkey 
PRIMARY KEY (idPersona); -- llave idPersona 

-- Referencial para la tabla persona
ALTER TABLE huesped ADD CONSTRAINT huesped_hotel_fkey
FOREIGN KEY (idHotel) REFERENCES hotel (idHotel);

-- Referencial para la tabla efectivo
ALTER TABLE huesped ADD CONSTRAINT huesped_formaEfectivo_fkey
FOREIGN KEY (idFormaEfectivo) REFERENCES efectivo (idFormaEfectivo);

-- Referencial para la tabla tarjeta
ALTER TABLE huesped ADD CONSTRAINT huesped_formaTarjeta_fkey
FOREIGN KEY (idFormaTarjeta) REFERENCES tarjeta (idFormaTarjeta);

-- Restricciones NOT NULL para la tabla huesped
ALTER TABLE huesped ALTER COLUMN nombre SET NOT NULL;          -- Establece que el campo "nombre" no puede ser nulo.
ALTER TABLE huesped ALTER COLUMN paterno SET NOT NULL;         -- Establece que el campo "paterno" no puede ser nulo.
ALTER TABLE huesped ALTER COLUMN materno SET NOT NULL;         -- Establece que el campo "materno" no puede ser nulo.
ALTER TABLE huesped ALTER COLUMN fechaNacimiento SET NOT NULL; -- Establece que el campo "fechaNacimiento" no puede ser nulo.
ALTER TABLE huesped ALTER COLUMN genero SET NOT NULL;          -- Establece que el campo "genero" no puede ser nulo.
ALTER TABLE huesped ALTER COLUMN idFormaEfectivo SET NOT NULL;          -- Establece que el campo "idForma" no puede ser nulo.
ALTER TABLE huesped ALTER COLUMN idFormaTarjeta SET NOT NULL;          -- Establece que el campo "idForma" no puede ser nulo.

ALTER TABLE huesped ADD CONSTRAINT genero_valido
CHECK (genero IN ('M', 'H')); -- Restricción CHECK para asegurar que el género sea 'M' o 'H'


-------------------------------- Tabla telefonoHuesped --------------------------------


-- Definición de la tabla telefonoPersona
CREATE TABLE telefonoHuesped (
    idPersona VARCHAR(20),
    telefonoHuesped VARCHAR(20)
);

-- Referencial 
ALTER TABLE telefonoHuesped ADD CONSTRAINT telefonoHuesped_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES huesped(idPersona); -- Cambio de referencia a la tabla huesped

-- Se agrega la llave primaria 
 ALTER TABLE telefonoHuesped ADD CONSTRAINT TelefonoHuesped_pkey 
 PRIMARY KEY (idPersona, telefonoHuesped);

-- Restricciones telefonoHuesped
-- Dominio
ALTER TABLE telefonoHuesped
ADD CONSTRAINT telefonoHuesped_no_vacio CHECK (telefonoHuesped <> ''); -- Restricción CHECK para garantizar que el campo telefonoHuesped no esté vacío

ALTER TABLE telefonoHuesped ADD CONSTRAINT telefonoHuesped_valido CHECK(length(telefonoHuesped::text) = 10 AND telefonoHuesped::text ~ '^[0-9]{10}$');
-- Se asegura de recibir 10 dígitos entre 0 y 9 cada uno

-------------------------------- Tabla correoHuesped --------------------------------


-- Definición de la tabla correoHuesped
CREATE TABLE correoHuesped (
    idPersona VARCHAR(20), 
    correoHuesped VARCHAR(100)
);

-- Referencial 
-- Se agrega una restricción de clave externa (foreign key constraint) 
ALTER TABLE correoHuesped ADD CONSTRAINT correoPersona_fkey 
FOREIGN KEY(idPersona) REFERENCES huesped(idPersona); 

-- Se agrega la llave primaria 
 ALTER TABLE correoHuesped ADD CONSTRAINT correoHuesped_pkey 
 PRIMARY KEY (idPersona, correoHuesped);

-- Restricciones correoHuesped
-- Dominio
ALTER TABLE correoHuesped
ADD CONSTRAINT correoHuesped_no_vacio -- Restricción CHECK para garantizar que el campo correoHuesped no esté vacío
CHECK (correoHuesped <> '');


-------------------------------- Tabla individual --------------------------------


-- Creación de la tabla individual
CREATE TABLE individual (
    idHabitacion VARCHAR(10),
    idPersona VARCHAR(20),
    RFC VARCHAR(20),
    disponibilidad BOOLEAN,
    costoPorNoche FLOAT,
    numeroDeHabitacion INT,
    numeroDeCamas INT
	--idPersona VARCHAR(20)
);

-- Se agrega la llave primaria 
 ALTER TABLE individual ADD CONSTRAINT individual_pkey 
 PRIMARY KEY (idHabitacion);

-- Referencial para la tabla personaldDeApoyo
ALTER TABLE individual ADD CONSTRAINT individual_persona_fkey
FOREIGN KEY (idPersona) REFERENCES personalDeApoyo (idPersona);

-- Referencial para la tabla huesped
--ALTER TABLE individual ADD CONSTRAINT individual_huesped_fkey
--FOREIGN KEY (idPersona) REFERENCES huesped (idPersona);


-- Restricciones individual
-- Dominio
ALTER TABLE individual ALTER COLUMN idPersona SET NOT NULL; -- Establece que el campo "idPersona" no puede ser nulo.
ALTER TABLE individual ALTER COLUMN RFC SET NOT NULL; -- Establece que el campo "RFC" no puede ser nulo.
ALTER TABLE individual ALTER COLUMN disponibilidad SET NOT NULL; -- Establece que el campo "disponibilidad" no puede ser nulo.
ALTER TABLE individual ALTER COLUMN costoPorNoche SET NOT NULL; -- Establece que el campo "costoPorNoche" no puede ser nulo.
ALTER TABLE individual ALTER COLUMN numeroDeHabitacion SET NOT NULL; -- Establece que el campo "numeroDeHabitacion" no puede ser nulo.
ALTER TABLE individual ALTER COLUMN numeroDeCamas SET NOT NULL; -- Establece que el campo "numeroDeCamas" no puede ser nulo.

-- Restricciones CHECK para la tabla individual
ALTER TABLE individual ADD CONSTRAINT RFC_check CHECK(RFC ~ '[A-Z]{4}[0-9]{6}[A-Z]{2}[0-9]{1}'); -- Se asegura de que los 13 dígitos
-- del RFC coincidan con la estructura usual

ALTER TABLE individual ADD CONSTRAINT disponibilidad_check 
CHECK (disponibilidad IN (TRUE, FALSE)); -- Restricción para asegurar que disponibilidad sea TRUE o FALSE

ALTER TABLE individual ADD CONSTRAINT costoPorNoche_positivo_check 
CHECK (costoPorNoche >= 0); -- Restricción para asegurar que costoPorNoche sea positivo

ALTER TABLE individual ADD CONSTRAINT numeroDeHabitacion_positivo_check 
CHECK (numeroDeHabitacion > 0); -- Restricción para asegurar que numeroDeHabitacion sea positivo

ALTER TABLE individual ADD CONSTRAINT numeroDeCamas_positivo_check 
CHECK (numeroDeCamas >= 1); -- Restricción para asegurar que numeroDeCamas sea mayor o igual a 1


-------------------------------- Tabla doble --------------------------------


-- Creación de la tabla doble
CREATE TABLE doble (
    idHabitacion VARCHAR(10), -- Definición de la columna idHabitacion como llave primaria
    idPersona VARCHAR(20),                -- ID de la persona asignada a la habitación
    RFC VARCHAR(20),                      -- RFC del empleado asignado a la habitación
    disponibilidad BOOLEAN,               -- Disponibilidad de la habitación
    costoPorNoche FLOAT,                  -- Costo por noche de la habitación
    numeroDeHabitacion INT,               -- Número de habitación
    numeroDeCamas INT                     -- Número de camas de la habitación
	--idPersona VARCHAR(20)                 --ID HUESPED
);

-- Se agrega la llave primaria 
 ALTER TABLE doble ADD CONSTRAINT doble_pkey 
 PRIMARY KEY (idHabitacion);

-- Referencial para la tabla persona
ALTER TABLE doble ADD CONSTRAINT doble_persona_fkey
FOREIGN KEY (idPersona) REFERENCES personalDeApoyo (idPersona);

-- Referencial para la tabla huesped
--ALTER TABLE doble ADD CONSTRAINT doble_huesped_fkey
--FOREIGN KEY (idPersona) REFERENCES huesped (idPersona);


-- Restricciones NOT NULL para la tabla doble
ALTER TABLE doble ALTER COLUMN idHabitacion SET NOT NULL;     -- Establece que el campo "idHabitacion" no puede ser nulo.
ALTER TABLE doble ALTER COLUMN idPersona SET NOT NULL;        -- Establece que el campo "idPersona" no puede ser nulo.
ALTER TABLE doble ALTER COLUMN RFC SET NOT NULL;              -- Establece que el campo "RFC" no puede ser nulo.
ALTER TABLE doble ALTER COLUMN disponibilidad SET NOT NULL;    -- Establece que el campo "disponibilidad" no puede ser nulo.
ALTER TABLE doble ALTER COLUMN costoPorNoche SET NOT NULL;     -- Establece que el campo "costoPorNoche" no puede ser nulo.
ALTER TABLE doble ALTER COLUMN numeroDeHabitacion SET NOT NULL; -- Establece que el campo "numeroDeHabitacion" no puede ser nulo.
ALTER TABLE doble ALTER COLUMN numeroDeCamas SET NOT NULL;     -- Establece que el campo "numeroDeCamas" no puede ser nulo.

-- Restricciones CHECK para la tabla doble
ALTER TABLE doble ADD CONSTRAINT RFC_check_doble CHECK(RFC ~ '[A-Z]{4}[0-9]{6}[A-Z]{2}[0-9]{1}'); -- Se asegura de que los 13 dígitos
-- del RFC coincidan con la estructura usual

ALTER TABLE doble ADD CONSTRAINT disponibilidad_check_doble 
CHECK (disponibilidad IN (TRUE, FALSE)); -- Restricción para asegurar que disponibilidad sea TRUE o FALSE

ALTER TABLE doble ADD CONSTRAINT costoPorNoche_positivo_check_doble 
CHECK (costoPorNoche >= 0); -- Restricción para asegurar que costoPorNoche sea positivo

ALTER TABLE doble ADD CONSTRAINT numeroDeHabitacion_positivo_check_doble 
CHECK (numeroDeHabitacion > 0); -- Restricción para asegurar que numeroDeHabitacion sea positivo

ALTER TABLE doble ADD CONSTRAINT numeroDeCamas_doble
CHECK (numeroDeCamas >= 1); -- Restricción para asegurar que numeroDeCamas sea mayor o igual a 1


-------------------------------- Tabla cuadruple --------------------------------


-- Creación de la tabla cuadruple
CREATE TABLE cuadruple (
    idHabitacion VARCHAR(10), -- Definición de la columna idHabitacion como llave primaria
    idPersona VARCHAR(20),                -- ID de la persona asignada a la habitación
    RFC VARCHAR(20),                      -- RFC del empleado asignado a la habitación
    disponibilidad BOOLEAN,               -- Disponibilidad de la habitación
    costoPorNoche FLOAT,                  -- Costo por noche de la habitación
    numeroDeHabitacion INT,               -- Número de habitación
    numeroDeCamas INT                     -- Número de camas de la habitación
	--idPersona VARCHAR(20)
);

-- Se agrega la llave primaria 
 ALTER TABLE cuadruple ADD CONSTRAINT cuadruple_pkey 
 PRIMARY KEY (idHabitacion);

-- Referencial para la tabla persona
ALTER TABLE cuadruple ADD CONSTRAINT cuadruple_persona_fkey
FOREIGN KEY (idPersona) REFERENCES personalDeApoyo (idPersona);

-- Referencial para la tabla huesped
--ALTER TABLE cuadruple ADD CONSTRAINT cuadruple_huesped_fkey
--FOREIGN KEY (idPersona) REFERENCES huesped (idPersona);


-- Restricciones NOT NULL para la tabla cuadruple
ALTER TABLE cuadruple ALTER COLUMN idHabitacion SET NOT NULL;     -- Establece que el campo "idHabitacion" no puede ser nulo.
ALTER TABLE cuadruple ALTER COLUMN idPersona SET NOT NULL;        -- Establece que el campo "idPersona" no puede ser nulo.
ALTER TABLE cuadruple ALTER COLUMN RFC SET NOT NULL;              -- Establece que el campo "RFC" no puede ser nulo.
ALTER TABLE cuadruple ALTER COLUMN disponibilidad SET NOT NULL;    -- Establece que el campo "disponibilidad" no puede ser nulo.
ALTER TABLE cuadruple ALTER COLUMN costoPorNoche SET NOT NULL;     -- Establece que el campo "costoPorNoche" no puede ser nulo.
ALTER TABLE cuadruple ALTER COLUMN numeroDeHabitacion SET NOT NULL; -- Establece que el campo "numeroDeHabitacion" no puede ser nulo.
ALTER TABLE cuadruple ALTER COLUMN numeroDeCamas SET NOT NULL;     -- Establece que el campo "numeroDeCamas" no puede ser nulo.

-- Restricciones CHECK para la tabla cuadruple
ALTER TABLE cuadruple ADD CONSTRAINT RFC_check_cuadruple CHECK(RFC ~ '[A-Z]{4}[0-9]{6}[A-Z]{2}[0-9]{1}'); -- Se asegura de que los 13 dígitos
-- del RFC coincidan con la estructura usual

ALTER TABLE cuadruple ADD CONSTRAINT disponibilidad_check_cuadruple 
CHECK (disponibilidad IN (TRUE, FALSE)); -- Restricción para asegurar que disponibilidad sea TRUE o FALSE

ALTER TABLE cuadruple ADD CONSTRAINT costoPorNoche_positivo_check_cuadruple 
CHECK (costoPorNoche >= 0); -- Restricción para asegurar que costoPorNoche sea positivo

ALTER TABLE cuadruple ADD CONSTRAINT numeroDeHabitacion_positivo_check_cuadruple 
CHECK (numeroDeHabitacion > 0); -- Restricción para asegurar que numeroDeHabitacion sea positivo

ALTER TABLE cuadruple ADD CONSTRAINT numeroDeCamas_cuadruple
CHECK (numeroDeCamas >= 2); -- Restricción para asegurar que numeroDeCamas sea mayor o igual a 2


-------------------------------- Tabla penthouse --------------------------------


-- Creación de la tabla penthouse
CREATE TABLE penthouse (
    idHabitacion VARCHAR(10), -- Definición de la columna idHabitacion como llave primaria
    idPersona VARCHAR(20),                -- ID de la persona asignada a la habitación
    RFC VARCHAR(20),                      -- RFC del empleado asignado a la habitación
    disponibilidad BOOLEAN,               -- Disponibilidad de la habitación
    costoPorNoche FLOAT,                  -- Costo por noche de la habitación
    numeroDeHabitacion INT,               -- Número de habitación
    numeroDeCamas INT                     -- Número de camas de la habitación
	--idPersona VARCHAR(20)                 -- ID huésped
	);

-- Se agrega la llave primaria 
 ALTER TABLE penthouse ADD CONSTRAINT penthouse_pkey 
 PRIMARY KEY (idHabitacion);

-- Referencial para la tabla personal de apoyo
ALTER TABLE penthouse ADD CONSTRAINT penthouse_persona_fkey
FOREIGN KEY (idPersona) REFERENCES personalDeApoyo (idPersona);

-- Referencial para la tabla huesped
--ALTER TABLE penthouse ADD CONSTRAINT penthouse_huesped_fkey
--FOREIGN KEY (idPersona) REFERENCES huesped (idPersona);

-- Restricciones NOT NULL para la tabla penthouse
ALTER TABLE penthouse ALTER COLUMN idHabitacion SET NOT NULL;     -- Establece que el campo "idHabitacion" no puede ser nulo.
ALTER TABLE penthouse ALTER COLUMN idPersona SET NOT NULL;        -- Establece que el campo "idPersona" no puede ser nulo.
ALTER TABLE penthouse ALTER COLUMN RFC SET NOT NULL;              -- Establece que el campo "RFC" no puede ser nulo.
ALTER TABLE penthouse ALTER COLUMN disponibilidad SET NOT NULL;    -- Establece que el campo "disponibilidad" no puede ser nulo.
ALTER TABLE penthouse ALTER COLUMN costoPorNoche SET NOT NULL;     -- Establece que el campo "costoPorNoche" no puede ser nulo.
ALTER TABLE penthouse ALTER COLUMN numeroDeHabitacion SET NOT NULL; -- Establece que el campo "numeroDeHabitacion" no puede ser nulo.
ALTER TABLE penthouse ALTER COLUMN numeroDeCamas SET NOT NULL;     -- Establece que el campo "numeroDeCamas" no puede ser nulo.

-- Restricciones CHECK para la tabla penthouse
ALTER TABLE penthouse ADD CONSTRAINT RFC_check CHECK(RFC ~ '[A-Z]{4}[0-9]{6}[A-Z]{2}[0-9]{1}'); -- Se asegura de que los 13 dígitos
-- del RFC coincidan con la estructura usual

ALTER TABLE penthouse ADD CONSTRAINT disponibilidad_check_penthouse
CHECK (disponibilidad IN (TRUE, FALSE)); -- Restricción para asegurar que disponibilidad sea TRUE o FALSE

ALTER TABLE penthouse ADD CONSTRAINT costoPorNoche_positivo_check_penthouse
CHECK (costoPorNoche >= 0); -- Restricción para asegurar que costoPorNoche sea positivo

ALTER TABLE penthouse ADD CONSTRAINT numeroDeHabitacion_positivo_check_penthouse
CHECK (numeroDeHabitacion > 0); -- Restricción para asegurar que numeroDeHabitacion sea positivo

ALTER TABLE penthouse ADD CONSTRAINT numeroDeCamas_penthouse
CHECK (numeroDeCamas >= 2); -- Restricción para asegurar que numeroDeCamas sea mayor o igual a 2



-------------------------------- Tabla salon --------------------------------


-- Creación de la tabla salon
CREATE TABLE salon (
    idSalon VARCHAR(20),     -- Identificador del salón
    horarioInicio TIME,                   -- Horario de funcionamiento del salón
	horarioFin    TIME,                   -- Horario de funcionamiento del salón
    nombreSalon VARCHAR(100),             -- Nombre del salón
    capacidad INT,                        -- Capacidad máxima de personas en el salón
    numeroInterior VARCHAR(10),           -- Número interior de la dirección del salón
    numeroExterior INT,                   -- Número exterior de la dirección del salón
    colonia VARCHAR(60),                  -- Colonia del salón
    calle VARCHAR(70),                    -- Calle del salón
    estado VARCHAR(50)                    -- Estado del salón
);

-- Se agrega la llave primaria 
ALTER TABLE salon ADD CONSTRAINT salon_pkey 
PRIMARY KEY (idSalon); 

-- Restricciones para la tabla salon
-- Dominio
-- No habrá valores de tipo NULL
ALTER TABLE salon ALTER COLUMN idSalon SET NOT NULL;       -- La columna idSalon no puede ser NULL
ALTER TABLE salon ALTER COLUMN horarioInicio SET NOT NULL; -- Restricción NOT NULL para la columna horarioInicio
ALTER TABLE salon ALTER COLUMN horarioFin SET NOT NULL;
ALTER TABLE salon ALTER COLUMN nombreSalon SET NOT NULL;   -- La columna nombreSalon no puede ser NULL
ALTER TABLE salon ALTER COLUMN capacidad SET NOT NULL;     -- La columna capacidad no puede ser NULL
ALTER TABLE salon ALTER COLUMN numeroExterior SET NOT NULL; -- La columna numeroExterior no puede ser NULL
ALTER TABLE salon ALTER COLUMN colonia SET NOT NULL;       -- La columna colonia no puede ser NULL
ALTER TABLE salon ALTER COLUMN calle SET NOT NULL;         -- La columna calle no puede ser NULL
ALTER TABLE salon ALTER COLUMN estado SET NOT NULL;        -- La columna estado no puede ser null

ALTER TABLE salon ADD CONSTRAINT capacidad_check CHECK(capacidad > 0); -- Se asegura de que la capacidad solo reciba valores 
-- positivos

ALTER TABLE salon ADD CONSTRAINT numeroExterior_check CHECK(numeroExterior > 0); -- Se asegura de que el número exterior solo reciba valores 
-- positivos


-------------------------------- Tabla evento --------------------------------


-- Creación de la tabla evento
CREATE TABLE evento (
    idEvento VARCHAR(20),   			-- Identificador del evento
    idPersona VARCHAR(50),
    numMembresia VARCHAR(20),           -- Número de membresía asociado al evento
    nombreSalon VARCHAR(100),           -- Nombre del salón donde se llevará a cabo el evento
    numAsistentes INT,                  -- Número de asistentes al evento
    fechaEvento DATE,                   -- Fecha del evento
    horaInicio TIME,                    -- Hora de inicio del evento
    horaFin TIME,                       -- Hora de fin del evento
    idSalon VARCHAR(20)                 -- Identificador del salón asociado al evento
);

-- Se agrega la llave primaria 
ALTER TABLE evento ADD CONSTRAINT evento_pkey 
PRIMARY KEY (idEvento); 

-- Referencial para la tabla salon
ALTER TABLE evento ADD CONSTRAINT evento_salon_fkey 
FOREIGN KEY (idSalon) REFERENCES salon (idSalon);

-- Referencial para la tabla persona
ALTER TABLE evento ADD CONSTRAINT evento_persona_fkey 
FOREIGN KEY (idPersona) REFERENCES huesped (idPersona);

-- Restricciones para la tabla evento
-- Dominio
-- No habrá valores de tipo NULL
ALTER TABLE evento ALTER COLUMN idEvento SET NOT NULL;        -- La columna idEvento no puede ser NULL
ALTER TABLE evento ALTER COLUMN nombreSalon SET NOT NULL;     -- La columna nombreSalon no puede ser NULL
ALTER TABLE evento ALTER COLUMN numAsistentes SET NOT NULL;   -- La columna numAsistentes no puede ser NULL
ALTER TABLE evento ALTER COLUMN fechaEvento SET NOT NULL;     -- La columna fechaEvento no puede ser NULL
ALTER TABLE evento ALTER COLUMN horaInicio SET NOT NULL;      -- La columna horaInicio no puede ser NULL
ALTER TABLE evento ALTER COLUMN horaFin SET NOT NULL;         -- La columna horaFin no puede ser NULL
ALTER TABLE evento ALTER COLUMN idSalon SET NOT NULL;         -- La columna idSalon no puede ser null

ALTER TABLE evento ADD CONSTRAINT numAsistentes_check CHECK(numAsistentes > 0); -- Se asegura de que el número de asistentes solo reciba valores 
-- positivos

-------------------------------- Tabla encuesta --------------------------------


-- Creación de la tabla encuesta
CREATE TABLE encuesta (
    idEncuesta VARCHAR(20),                 -- Identificador de la encuesta
    servicioRecibido INT,          -- Evaluación del servicio recibido
    limpieza INT,                  -- Evaluación de la limpieza
    recomendacion INT,             -- Evaluación de la recomendación
    comentario TEXT,                        -- Comentario de la encuesta
    volverHospedar INT,            -- Evaluación de volver a hospedarse
    idPersona VARCHAR(20)         -- Identificador de la persona que realiza la encuesta
);

-- Se agrega la llave primaria 
ALTER TABLE encuesta ADD CONSTRAINT encuesta_pkey 
PRIMARY KEY (idEncuesta); 

-- Referencial para la tabla persona
ALTER TABLE encuesta ADD CONSTRAINT encuesta_persona_fkey 
FOREIGN KEY (idPersona) REFERENCES huesped (idPersona);

-- Restricciones para la tabla encuesta
ALTER TABLE encuesta ALTER COLUMN idEncuesta SET NOT NULL;        -- La columna idEncuesta no puede ser NULL
ALTER TABLE encuesta ALTER COLUMN servicioRecibido SET NOT NULL; -- La columna servicioRecibido no puede ser NULL
ALTER TABLE encuesta ALTER COLUMN limpieza SET NOT NULL;          -- La columna limpieza no puede ser NULL
ALTER TABLE encuesta ALTER COLUMN recomendacion SET NOT NULL;     -- La columna recomendacion no puede ser NULL
ALTER TABLE encuesta ALTER COLUMN volverHospedar SET NOT NULL;    -- La columna volverHospedar no puede ser NULL
ALTER TABLE encuesta ALTER COLUMN idPersona SET NOT NULL;         -- La columna idPersona no puede ser NULL

-- Restricciones para la tabla encuesta
ALTER TABLE encuesta ADD CONSTRAINT check_servicioRecibido 
CHECK (servicioRecibido BETWEEN 1 AND 5); -- Restricción de evaluación del servicio recibido

ALTER TABLE encuesta ADD CONSTRAINT check_limpieza
CHECK (limpieza BETWEEN 1 AND 5); -- Restricción de evaluación de la limpieza

ALTER TABLE encuesta ADD CONSTRAINT check_recomendacion 
CHECK (recomendacion BETWEEN 1 AND 5); -- Restricción de evaluación de la recomendación

ALTER TABLE encuesta ADD CONSTRAINT check_volverHospedar 
CHECK (volverHospedar BETWEEN 1 AND 5); -- Restricción de evaluación de volver a hospedarse

ALTER TABLE encuesta ALTER COLUMN comentario SET DEFAULT ''; -- Valor predeterminado para comentario


-------------------------------- Tabla membresia --------------------------------


-- Creación de la tabla membresia
CREATE TABLE membresia (
    numeroMembresia VARCHAR(20),    -- Número de membresía
    activa VARCHAR(2),              -- Estado de la membresía (SI/NO)
    idPersona VARCHAR(20)          -- Identificador de la persona asociada a la membresía
);

-- Se agrega la llave primaria 
ALTER TABLE membresia ADD CONSTRAINT membresia_pkey 
PRIMARY KEY (numeroMembresia); 

-- Referencial para la tabla persona
ALTER TABLE membresia ADD CONSTRAINT membresia_persona_fkey 
FOREIGN KEY (idPersona) REFERENCES huesped (idPersona);

-- Restricciones para la tabla membresia
ALTER TABLE membresia ALTER COLUMN numeroMembresia SET NOT NULL;  -- La columna numeroMembresia no puede ser NULL
ALTER TABLE membresia ALTER COLUMN activa SET NOT NULL;           -- La columna activa no puede ser NULL
ALTER TABLE membresia ADD CONSTRAINT activa_check CHECK (activa IN ('SI', 'NO'));  -- Restricción para activa (Solo 'SI' o 'NO')
ALTER TABLE membresia ALTER COLUMN idPersona SET NOT NULL;        -- La columna idPersona no puede ser NULL



-------------------------------- Tabla pago --------------------------------


-- Creación de la tabla pago
CREATE TABLE pago (
    idPago VARCHAR(20),           -- Identificador del pago
    NumeroNinos INT,              -- Número de niños en el pago
    NumeroAdultos INT,            -- Número de adultos en el pago
    NumeroMascotas INT,           -- Número de mascotas en el pago
    NumeroNoches INT             -- Número de noches en el pago
);

-- Se agrega la llave primaria 
ALTER TABLE pago ADD CONSTRAINT pago_pkey 
PRIMARY KEY (idPago); 

-- Restricciones para la tabla pago
ALTER TABLE pago ALTER COLUMN idPago SET NOT NULL;       -- La columna idPago no puede ser NULL
ALTER TABLE pago ALTER COLUMN NumeroNinos SET NOT NULL;  -- La columna NumeroNiños no puede ser NULL
ALTER TABLE pago ALTER COLUMN NumeroAdultos SET NOT NULL;  -- La columna NumeroAdultos no puede ser NULL
ALTER TABLE pago ALTER COLUMN NumeroMascotas SET NOT NULL;  -- La columna NumeroMascotas no puede ser NULL
ALTER TABLE pago ALTER COLUMN NumeroNoches SET NOT NULL;  -- La columna NumeroNoches no puede ser NULL

ALTER TABLE pago ADD CONSTRAINT NumeroNinos_check CHECK(NumeroNinos > 0); -- Se asegura de que el número de niños solo reciba valores 
-- positivos

ALTER TABLE pago ADD CONSTRAINT NumeroAdultos_check CHECK(NumeroAdultos > 0); -- Se asegura de que el número de adultos solo reciba valores 
-- positivos

ALTER TABLE pago ADD CONSTRAINT NumeroMascotas_check CHECK(NumeroMascotas > 0); -- Se asegura de que el número de mascotas solo reciba valores 
-- positivos

ALTER TABLE pago ADD CONSTRAINT NumeroNoches_check CHECK(NumeroNoches > 0); -- Se asegura de que el número de noches solo reciba valores 
-- positivos
-------------------------------- Tabla servicioExtra  --------------------------------


-- Creación de la tabla servicioExtra
CREATE TABLE servicioExtra (
    idServicio VARCHAR(20),     -- Identificador del servicio extra
    numeroPlatos INT,           -- Número de platos del servicio extra
    idPago VARCHAR(20)         -- Identificador del pago asociado al servicio extra
);

-- Se agrega la llave primaria 
ALTER TABLE servicioExtra ADD CONSTRAINT servicioExtra_pkey 
PRIMARY KEY (idServicio); 

-- Agregar la restricción de clave foránea
ALTER TABLE servicioExtra ADD CONSTRAINT servicioExtra_pago_fkey 
FOREIGN KEY (idPago) REFERENCES pago (idPago);

-- Restricciones para la tabla servicioExtra
ALTER TABLE servicioExtra ALTER COLUMN idServicio SET NOT NULL;   -- La columna idServicio no puede ser NULL
ALTER TABLE servicioExtra ALTER COLUMN numeroPlatos SET NOT NULL; -- La columna numeroPlatos no puede ser NULL
ALTER TABLE servicioExtra ALTER COLUMN idpago SET NOT NULL;       -- La columna idpago no puede ser NULL

ALTER TABLE servicioExtra ADD CONSTRAINT numeroPlatos_check CHECK(numeroPlatos >= 0); 
-- Se asegura de que el número de platos solo reciba valores mayores o iguales a cero.


-------------------------------- disponerIndividual --------------------------------


-- Creación de la tabla disponerIndividual
CREATE TABLE disponerIndividual (
    idDisponerIndividual VARCHAR(20),    -- Identificador de la habitación
    idHotel VARCHAR(20)         -- Identificador del hotel
);


-- Se agrega la restricción de clave externa para la tabla habitacion
-- ALTER TABLE disponerIndividual ADD CONSTRAINT disponerIndividual_habitacion_fkey 
-- FOREIGN KEY (idHabitacion) REFERENCES habitacion (idHabitacion);

-- Se agrega la llave primaria 
ALTER TABLE disponerIndividual ADD CONSTRAINT disponerIndividual_pkey 
PRIMARY KEY (idDisponerIndividual); 

-- Se agrega la restricción de clave externa para la tabla hotel
ALTER TABLE disponerIndividual ADD CONSTRAINT disponerIndividual_hotel_fkey 
FOREIGN KEY (IDHotel) REFERENCES hotel (IDHotel);

ALTER TABLE disponerIndividual ALTER COLUMN idDisponerIndividual SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idHabitacion
ALTER TABLE disponerIndividual ALTER COLUMN IDHotel SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna IDHotel


-------------------------------- disponerDoble --------------------------------


-- Creación de la tabla disponerDoble
CREATE TABLE disponerDoble (
    idDisponerDoble VARCHAR(20),    -- Identificador de la habitación
    idHotel VARCHAR(20)         -- Identificador del hotel
);


-- Se agrega la restricción de clave externa para la tabla habitacion
-- ALTER TABLE disponerDoble ADD CONSTRAINT disponerDoble_habitacion_fkey 
-- FOREIGN KEY (idHabitacion) REFERENCES habitacion (idHabitacion);

-- Se agrega la llave primaria 
ALTER TABLE disponerDoble ADD CONSTRAINT disponerDoble_pkey 
PRIMARY KEY (idDisponerDoble); 

-- Se agrega la restricción de clave externa para la tabla hotel
ALTER TABLE disponerDoble ADD CONSTRAINT disponerDoble_hotel_fkey 
FOREIGN KEY (IDHotel) REFERENCES hotel (IDHotel);

ALTER TABLE disponerDoble ALTER COLUMN idDisponerDoble SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idHabitacion
ALTER TABLE disponerDoble ALTER COLUMN IDHotel SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna IDHotel


-------------------------------- disponerCuadruple --------------------------------


-- Creación de la tabla disponerCuadruple
CREATE TABLE disponerCuadruple (
    idDisponerCuadruple VARCHAR(20),    -- Identificador de la habitación
    idHotel VARCHAR(20)         -- Identificador del hotel
);


-- Se agrega la restricción de clave externa para la tabla habitacion
-- ALTER TABLE disponerCuadruple ADD CONSTRAINT disponerCuadruple_habitacion_fkey 
-- FOREIGN KEY (idHabitacion) REFERENCES habitacion (idHabitacion);

-- Se agrega la llave primaria 
ALTER TABLE disponerCuadruple ADD CONSTRAINT disponerCuadruple_pkey 
PRIMARY KEY (idDisponerCuadruple); 

-- Se agrega la restricción de clave externa para la tabla hotel
ALTER TABLE disponerCuadruple ADD CONSTRAINT disponerCuadruple_hotel_fkey 
FOREIGN KEY (IDHotel) REFERENCES hotel (IDHotel);

ALTER TABLE disponerCuadruple ALTER COLUMN idDisponerCuadruple SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idHabitacion
ALTER TABLE disponerCuadruple ALTER COLUMN IDHotel SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna IDHotel

-------------------------------- disponerPenthouse --------------------------------


-- Creación de la tabla disponerPenthouse
CREATE TABLE disponerPenthouse (
    idDisponerPenthouse VARCHAR(20),    -- Identificador de la habitación
    idHotel VARCHAR(20)         -- Identificador del hotel
);


-- Se agrega la restricción de clave externa para la tabla habitacion
-- ALTER TABLE disponerPenthouse ADD CONSTRAINT disponerPenthouse_habitacion_fkey 
-- FOREIGN KEY (idHabitacion) REFERENCES habitacion (idHabitacion);

-- Se agrega la llave primaria 
ALTER TABLE disponerPenthouse ADD CONSTRAINT disponerPenthouse_pkey 
PRIMARY KEY (idDisponerPenthouse); 

-- Se agrega la restricción de clave externa para la tabla hotel
ALTER TABLE disponerPenthouse ADD CONSTRAINT disponerPenthouse_hotel_fkey 
FOREIGN KEY (IDHotel) REFERENCES hotel (IDHotel);

ALTER TABLE disponerPenthouse ALTER COLUMN idDisponerPenthouse SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idHabitacion
ALTER TABLE disponerPenthouse ALTER COLUMN IDHotel SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna IDHotel


-------------------------------- Tabla atender --------------------------------


-- Creación de la tabla atender
CREATE TABLE atender (
    idEvento VARCHAR(20),     -- Identificador del evento
    idPersona VARCHAR(20)    -- Identificador de la persona

);

-- Se agrega la restricción de clave externa para la tabla evento
ALTER TABLE atender ADD CONSTRAINT atender_evento_fkey 
FOREIGN KEY (idEvento) REFERENCES evento (idEvento);

-- Se agrega la restricción de clave externa para la tabla empleado
ALTER TABLE atender ADD CONSTRAINT atender_persona_fkey 
FOREIGN KEY (idPersona) REFERENCES personalDeApoyo (idPersona);

ALTER TABLE atender ALTER COLUMN IDEvento SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna IDEvento
ALTER TABLE atender ALTER COLUMN idPersona SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idPersona


-------------------------------- Tabla rentarIndividual --------------------------------


-- Creación de la tabla rentarIndividual
CREATE TABLE rentarIndividual (
    idPersona VARCHAR(20),    -- Identificador de la persona
    idHabitacion VARCHAR(20) -- Identificador de la habitación
);

-- Se agrega la restricción de clave externa para la tabla persona
ALTER TABLE rentarIndividual ADD CONSTRAINT rentarIndividual_persona_fkey 
FOREIGN KEY (idPersona) REFERENCES huesped (idPersona);

-- Se agrega la restricción de clave externa para la tabla habitacion
ALTER TABLE rentarIndividual ADD CONSTRAINT rentarIndividual_habitacion_fkey 
FOREIGN KEY (idHabitacion) REFERENCES individual (idHabitacion);

ALTER TABLE rentarIndividual ALTER COLUMN idPersona SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idPersona


-------------------------------- Tabla rentarDoble --------------------------------


-- Creación de la tabla rentarDoble
CREATE TABLE rentarDoble (
    idPersona VARCHAR(20),    -- Identificador de la persona
    idHabitacion VARCHAR(20) -- Identificador de la habitación
);

-- Se agrega la restricción de clave externa para la tabla persona
ALTER TABLE rentarDoble ADD CONSTRAINT rentarDoble_persona_fkey 
FOREIGN KEY (idPersona) REFERENCES huesped (idPersona);

-- Se agrega la restricción de clave externa para la tabla habitacion
ALTER TABLE rentarDoble ADD CONSTRAINT rentarDoble_habitacion_fkey 
FOREIGN KEY (idHabitacion) REFERENCES doble (idHabitacion);

ALTER TABLE rentarDoble ALTER COLUMN idPersona SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idPersona


-------------------------------- Tabla rentarCuadruple --------------------------------


-- Creación de la tabla rentarCuadruple
CREATE TABLE rentarCuadruple (
    idPersona VARCHAR(20),    -- Identificador de la persona
    idHabitacion VARCHAR(20) -- Identificador de la habitación
);

-- Se agrega la restricción de clave externa para la tabla persona
ALTER TABLE rentarCuadruple ADD CONSTRAINT rentarCuadruple_persona_fkey 
FOREIGN KEY (idPersona) REFERENCES huesped (idPersona);

-- Se agrega la restricción de clave externa para la tabla habitacion
ALTER TABLE rentarCuadruple ADD CONSTRAINT rentarCuadruple_habitacion_fkey 
FOREIGN KEY (idHabitacion) REFERENCES cuadruple (idHabitacion);

ALTER TABLE rentarCuadruple ALTER COLUMN idPersona SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idPersona


-------------------------------- Tabla rentarPenthouse --------------------------------


-- Creación de la tabla rentarPenthouse
CREATE TABLE rentarPenthouse (
    idPersona VARCHAR(20),    -- Identificador de la persona
    idHabitacion VARCHAR(20) -- Identificador de la habitación
);

-- Se agrega la restricción de clave externa para la tabla persona
ALTER TABLE rentarPenthouse ADD CONSTRAINT rentarPenthouse_persona_fkey 
FOREIGN KEY (idPersona) REFERENCES huesped (idPersona);

-- Se agrega la restricción de clave externa para la tabla habitacion
ALTER TABLE rentarPenthouse ADD CONSTRAINT rentarPenthouse_habitacion_fkey 
FOREIGN KEY (idHabitacion) REFERENCES penthouse (idHabitacion);

ALTER TABLE rentarPenthouse ALTER COLUMN idPersona SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idPersona