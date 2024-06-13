/*
Script para la creación de la base de datos 'Hoteles Luna'
Equipo: ChiquesSQL
*/

-- Creación del esquemas
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;



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
ALTER TABLE hotel ADD CONSTRAINT hotel_idhotel_no_vacio -- Se asegura que el id del hotel no sea la cadena vacía
CHECK(idHotel <> '');

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

--- COMENTARIOS
COMMENT ON TABLE hotel IS 'Tabla que contiene los datos del hotel';
COMMENT ON COLUMN hotel.idHotel IS 'Identificador del hotel';
COMMENT ON COLUMN hotel.nombreEstablecimiento IS 'Nombre del hotel';
COMMENT ON COLUMN hotel.horaCheckIn IS 'Hora check in';
COMMENT ON COLUMN hotel.horaCheckOut IS 'Hora check out';
COMMENT ON COLUMN hotel.petFriendly IS 'Petfriendly';
COMMENT ON COLUMN hotel.servicio IS 'Servicios del hotel';
COMMENT ON COLUMN hotel.numeroInterior IS 'Número interior';
COMMENT ON COLUMN hotel.numeroExterior IS 'Número exterior';
COMMENT ON COLUMN hotel.colonia IS 'Colonia';
COMMENT ON COLUMN hotel.calle IS 'Calle';
COMMENT ON COLUMN hotel.estado IS 'Estado';
COMMENT ON CONSTRAINT hotel_pkey ON hotel IS 'La llave primaria de la tabla hotel';
COMMENT ON CONSTRAINT hotel_nombre_no_vacio ON hotel IS 'Restriccion CHECK NOT NULL para el atributo nombre del hotel';
COMMENT ON CONSTRAINT hotel_checkIn_no_null ON hotel IS 'Restriccion CHECK NOT NULL para el atributo horaCheckIn del hotel';
COMMENT ON CONSTRAINT hotel_checkOut_no_null ON hotel IS 'Restriccion CHECK NOT NULL para el atributo horaCheckOut del hotel';
COMMENT ON CONSTRAINT hotel_servicio_no_vacio ON hotel IS 'Restriccion CHECK NOT NULL para el atributo servicio del hotel';
COMMENT ON CONSTRAINT hotel_numeroInterior_no_vacio ON hotel IS 'Restriccion CHECK NOT NULL para el atributo numeroInterior del hotel';
COMMENT ON CONSTRAINT hotel_numeroExterior_no_null ON hotel IS 'Restriccion CHECK NOT NULL para el atributo numeroExterior del hotel';
COMMENT ON CONSTRAINT hotel_colonia_no_vacia ON hotel IS 'Restriccion CHECK NOT NULL para el atributo colonia del hotel';
COMMENT ON CONSTRAINT hotel_calle_no_vacia ON hotel IS 'Restriccion CHECK NOT NULL para el atributo calle del hotel';
COMMENT ON CONSTRAINT hotel_estado_no_vacio ON hotel IS 'Restriccion CHECK NOT NULL para el atributo estado del hotel';
COMMENT ON CONSTRAINT hotel_petfriendly_no_vacio ON hotel IS 'Restriccion CHECK NOT NULL para el atributo petFriendly del hotel';
COMMENT ON CONSTRAINT hotel_idhotel_no_vacio ON hotel IS 'Restriccion CHECK NOT NULL para el atributo idHotel del hotel';
COMMENT ON CONSTRAINT numeroExterior_check ON hotel IS 'Restriccion check el cual nos asegura que
el número exterior sea positivo';
COMMENT ON CONSTRAINT petfriendly_valores_permitidos ON hotel IS 'Restriccion check el cual nos asegura que
la opción Petfriendly sea SI/NO';


-------------------------------- Tabla telefonoHotel --------------------------------


-- Definición de la tabla telefonoHotel
CREATE TABLE telefonoHotel (
    idHotel VARCHAR(20),
    telefonoHotel VARCHAR(20)
);

-- Se agrega la llave primaria 
 ALTER TABLE telefonoHotel ADD CONSTRAINT telefonohotel_pkey 
 PRIMARY KEY (idHotel, telefonoHotel);

-- Referencial 
-- Se agrega una restricción de clave externa (foreign key constraint) llamada 'telefonoHotel_fkey' a la tabla telefonoHotel. 
ALTER TABLE telefonoHotel ADD CONSTRAINT telefonoHotel_fkey
FOREIGN KEY(idHotel) REFERENCES hotel(idHotel)

-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

--Restricciones telefonoHotel 
--Dominio
ALTER TABLE telefonoHotel
ADD CONSTRAINT telefonoHotel_no_vacio CHECK (telefonoHotel <> ''); -- Restricción CHECK para garantizar que el campo telefonoHotel no esté vacío
ALTER TABLE telefonoHotel ADD CONSTRAINT telefonoHotel_valido CHECK(length(telefonoHotel::text) = 10 AND telefonoHotel::text ~ '^[0-9]{10}$');
-- Se asegura de rebicir 10 dígitos entre 0 y 9 cada uno

---COMENTARIOS
COMMENT ON TABLE telefonoHotel IS 'Tabla que contiene los datos del teléfono del hotel';
COMMENT ON COLUMN telefonoHotel.idHotel IS 'Identificador del hotel';
COMMENT ON COLUMN telefonoHotel.telefonoHotel IS 'Número telefónico del hotel';
COMMENT ON CONSTRAINT telefonohotel_pkey  ON telefonoHotel IS 'La llave primaria de la tabla telefonoHotel';
COMMENT ON CONSTRAINT telefonoHotel_fkey  ON telefonoHotel IS 'La llave foránea de la tabla telefonoHotel';
COMMENT ON CONSTRAINT telefonoHotel_no_vacio  ON telefonoHotel IS 'Restriccion CHECK NOT NULL para el atributo telefonoHotel de la tabla telefonoHotel';
COMMENT ON CONSTRAINT telefonoHotel_valido  ON telefonoHotel IS 'Restricción CHECK que valida que el número telefónico sea válido';


-------------------------------- Tabla efectivo --------------------------------


-- Creación de la tabla EFECTIVO
CREATE TABLE efectivo (
    idFormaEfectivo VARCHAR(20) -- Identificador de la forma de pago en efectivo
);

-- Establecer la llave primaria con ALTER TABLE
ALTER TABLE efectivo ADD CONSTRAINT efectivo_pkey PRIMARY KEY (idFormaEfectivo);

-- Restricciones para la tabla EFECTIVO
ALTER TABLE efectivo ALTER COLUMN idFormaEfectivo SET NOT NULL; -- La columna idForma no puede ser null

---COMENTARIOS
COMMENT ON TABLE efectivo IS 'Tabla que contiene los datos de la forma de pago en efectivo';
COMMENT ON COLUMN efectivo.idFormaEfectivo IS 'Identificador de la forma de pago en efectivo';
COMMENT ON CONSTRAINT efectivo_pkey  ON efectivo IS 'La llave primaria de la tabla efectivo';


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

---COMENTARIOS
COMMENT ON TABLE tarjeta IS 'Tabla que contiene los datos de la forma de pago con tarjeta';
COMMENT ON COLUMN tarjeta.idFormaTarjeta IS 'Identificador de la forma de pago con tarjeta';
COMMENT ON COLUMN tarjeta.numeroTarjeta IS 'Número de la tarjeta';
COMMENT ON COLUMN tarjeta.vencimiento IS 'Vencimiento de la tarjeta';
COMMENT ON CONSTRAINT tarjetat_pkey   ON tarjeta IS 'La llave primaria de la tabla tarjeta';
COMMENT ON CONSTRAINT numerotarjeta_valido   ON tarjeta IS 'Valida que el número de tarjeta tenga 16 dígitos';


-------------------------------- Tabla huesped --------------------------------


-- Creación de la tabla huesped
CREATE TABLE huesped (
    idPersona VARCHAR(20), 				-- id del huésped
    idHotel VARCHAR(20),
    nombre VARCHAR(100),			     -- Nombre del huésped
    paterno VARCHAR(100),    -- Apellido paterno del huésped
    materno VARCHAR(100),    -- Apellido materno del huésped
    fechaNacimiento DATE,     -- Fecha de nacimiento del huésped
    genero CHAR(1),          -- Género del huésped
    nacionalidad VARCHAR(50),          -- Nacionalidad del huésped
    idpago VARCHAR(8),                  -- ID de pago del huésped
    idFormaEfectivo VARCHAR(20),                 -- ID de la forma de pago en efectivo del huésped
	idFormaTarjeta VARCHAR(20)                   -- ID de la forma de pago en tarjeta del huésped
);

-- Se agrega la llave primaria 
ALTER TABLE huesped ADD CONSTRAINT huesped_pkey 
PRIMARY KEY (idPersona); -- llave idPersona 

-- Referencial para la tabla persona
ALTER TABLE huesped ADD CONSTRAINT huesped_hotel_fkey
FOREIGN KEY (idHotel) REFERENCES hotel (idHotel)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencial para la tabla efectivo
ALTER TABLE huesped ADD CONSTRAINT huesped_formaEfectivo_fkey
FOREIGN KEY (idFormaEfectivo) REFERENCES efectivo (idFormaEfectivo)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencial para la tabla tarjeta
ALTER TABLE huesped ADD CONSTRAINT huesped_formaTarjeta_fkey
FOREIGN KEY (idFormaTarjeta) REFERENCES tarjeta (idFormaTarjeta)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

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

---COMENTARIOS
COMMENT ON TABLE huesped IS 'Tabla que contiene los datos de los huéspedes';
COMMENT ON COLUMN huesped.idPersona IS 'Identificador de la tabla huesped';
COMMENT ON COLUMN huesped.idHotel IS 'Identificador del hotel';
COMMENT ON COLUMN huesped.nombre IS 'Nombre del huésped';
COMMENT ON COLUMN huesped.paterno IS 'Apellido paterno';
COMMENT ON COLUMN huesped.materno IS 'Apellido materno';
COMMENT ON COLUMN huesped.fechaNacimiento IS 'Fecha de nacimiento';
COMMENT ON COLUMN huesped.genero IS 'Género';
COMMENT ON COLUMN huesped.nacionalidad IS 'Nacionalidad';
COMMENT ON COLUMN huesped.idPago IS 'Identificador del pago';
COMMENT ON COLUMN huesped.idFormaEfectivo IS 'Identificador de la forma de pago en efectivo';
COMMENT ON COLUMN huesped.idFormaTarjeta IS 'Identificador de la forma de pago con tarjeta';
COMMENT ON CONSTRAINT huesped_pkey ON huesped IS 'La llave primaria de la tabla huesped';
COMMENT ON CONSTRAINT huesped_hotel_fkey ON huesped IS 'La llave foránea que viene de la tabla hotel';
COMMENT ON CONSTRAINT huesped_formaEfectivo_fkey ON huesped IS 'La llave foránea que viene de la tabla efectivo';
COMMENT ON CONSTRAINT huesped_formaTarjeta_fkey ON huesped IS 'La llave foránea que viene de la tabla tarjeta';
COMMENT ON CONSTRAINT genero_valido   ON huesped IS 'Valida que el genero sea M o H';


-------------------------------- Tabla telefonoHuesped --------------------------------


-- Definición de la tabla telefonoHuesped
CREATE TABLE telefonoHuesped (
    idPersona VARCHAR(20),
    telefonoHuesped VARCHAR(20)
);

-- Referencial 
ALTER TABLE telefonoHuesped ADD CONSTRAINT telefonoHuesped_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES huesped(idPersona) -- Cambio de referencia a la tabla huesped
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Se agrega la llave primaria 
 ALTER TABLE telefonoHuesped ADD CONSTRAINT TelefonoHuesped_pkey 
 PRIMARY KEY (idPersona, telefonoHuesped);

-- Restricciones telefonoHuesped
-- Dominio
ALTER TABLE telefonoHuesped
ADD CONSTRAINT telefonoHuesped_no_vacio CHECK (telefonoHuesped <> ''); -- Restricción CHECK para garantizar que el campo telefonoHuesped no esté vacío

ALTER TABLE telefonoHuesped ADD CONSTRAINT telefonoHuesped_valido CHECK(length(telefonoHuesped::text) = 10 AND telefonoHuesped::text ~ '^[0-9]{10}$');
-- Se asegura de recibir 10 dígitos entre 0 y 9 cada uno

---COMENTARIOS
COMMENT ON TABLE telefonoHuesped IS 'Tabla que contiene los datos del teléfono del huésped';
COMMENT ON COLUMN telefonoHuesped.idPersona IS 'Identificador del huésped';
COMMENT ON COLUMN telefonoHuesped.telefonoHuesped IS 'Número telefónico';
COMMENT ON CONSTRAINT TelefonoHuesped_pkey   ON  telefonoHuesped IS 'La llave primaria de la tabla  telefonoHuesped';
COMMENT ON CONSTRAINT telefonoHuesped_fkey  ON  telefonoHuesped IS 'La llave foránea de la tabla  telefonoHuesped';
COMMENT ON CONSTRAINT telefonoHuesped_no_vacio  ON  telefonoHuesped IS 'Restriccion CHECK NOT NULL para el atributo telefonoHuesped de la tabla  telefonoHuesped';
COMMENT ON CONSTRAINT telefonoHuesped_valido  ON  telefonoHuesped IS 'Restricción CHECK que valida que el número telefónico sea válido';


-------------------------------- Tabla correoHuesped --------------------------------


-- Definición de la tabla correoHuesped
CREATE TABLE correoHuesped (
    idPersona VARCHAR(20), 
    correoHuesped VARCHAR(100)
);

-- Referencial 
-- Se agrega una restricción de clave externa (foreign key constraint) 
ALTER TABLE correoHuesped ADD CONSTRAINT correoPersona_fkey 
FOREIGN KEY(idPersona) REFERENCES huesped(idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Se agrega la llave primaria 
 ALTER TABLE correoHuesped ADD CONSTRAINT correoHuesped_pkey 
 PRIMARY KEY (idPersona, correoHuesped);

-- Restricciones correoHuesped
-- Dominio
ALTER TABLE correoHuesped
ADD CONSTRAINT correoHuesped_no_vacio -- Restricción CHECK para garantizar que el campo correoHuesped no esté vacío
CHECK (correoHuesped <> '');

---COMENTARIOS
COMMENT ON TABLE correoHuesped IS 'Tabla que contiene los datos del correo del huésped';
COMMENT ON COLUMN correoHuesped.idPersona IS 'Identificador del huésped';
COMMENT ON COLUMN correoHuesped.correoHuesped IS 'Correo electrónico';
COMMENT ON CONSTRAINT correoHuesped_pkey ON  correoHuesped IS 'La llave primaria de la tabla correoHuesped';
COMMENT ON CONSTRAINT correoPersona_fkey  ON  correoHuesped IS 'La llave foránea de la tabla correoHuesped';
COMMENT ON CONSTRAINT correoHuesped_no_vacio  ON  correoHuesped IS 'Restriccion CHECK NOT NULL para el atributo correoHuesped de la tabla correoHuesped';


-------------------------------- Tabla personalDeApoyo --------------------------------


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
FOREIGN KEY (idHotel) REFERENCES hotel (idHotel)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

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

---COMENTARIOS
COMMENT ON TABLE personalDeApoyo IS 'Tabla que contiene los datos del personal de apoyo';
COMMENT ON COLUMN personalDeApoyo.idPersona IS 'Identificador de la persona';
COMMENT ON COLUMN personalDeApoyo.idHotel IS 'Identificador del hotel';
COMMENT ON COLUMN personalDeApoyo.RFC IS 'RFC';
COMMENT ON COLUMN personalDeApoyo.nombre IS 'Nombre';
COMMENT ON COLUMN personalDeApoyo.apellidoPaterno IS 'Apellido paterno';
COMMENT ON COLUMN personalDeApoyo.apellidoMaterno IS 'Apellido materno';
COMMENT ON COLUMN personalDeApoyo.fechaNacimiento IS 'Fecha de nacimiento';
COMMENT ON COLUMN personalDeApoyo.genero IS 'Género';
COMMENT ON COLUMN personalDeApoyo.fechaContratacion IS 'Fecha de contratación';
COMMENT ON COLUMN personalDeApoyo.horarioInicio IS 'Hora de entrada';
COMMENT ON COLUMN personalDeApoyo.horarioFin IS 'Hora de salida';
COMMENT ON COLUMN personalDeApoyo.numeroInterior IS 'Número interior';
COMMENT ON COLUMN personalDeApoyo.numeroExterior IS 'Número Exterior';
COMMENT ON COLUMN personalDeApoyo.colonia IS 'Colonia';
COMMENT ON COLUMN personalDeApoyo.calle IS 'Calle';
COMMENT ON COLUMN personalDeApoyo.estado IS 'Estado';
COMMENT ON CONSTRAINT personalDeApoyo_pkey ON personalDeApoyo IS 'La llave primaria de la tabla personalDeApoyo';
COMMENT ON CONSTRAINT personalDeApoyo_hotel_fkey ON personalDeApoyo IS 'La llave foránea que viene de la tabla hotel';
COMMENT ON CONSTRAINT RFC_check ON personalDeApoyo IS 'Restriccion CHECK para validar RFC';
COMMENT ON CONSTRAINT genero_valido ON personalDeApoyo IS 'Valida que el genero sea M o H';
COMMENT ON CONSTRAINT numeroExterior_check ON personalDeApoyo IS 'Valida que el número exterior sea positivo';


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
FOREIGN KEY (idHotel) REFERENCES hotel (idHotel)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

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

---COMENTARIOS
COMMENT ON TABLE servicioComida IS 'Tabla que contiene los datos del personal del servicio de comida';
COMMENT ON COLUMN servicioComida.idPersona IS 'Identificador de la persona';
COMMENT ON COLUMN servicioComida.idHotel IS 'Identificador del hotel';
COMMENT ON COLUMN servicioComida.RFC IS 'RFC';
COMMENT ON COLUMN servicioComida.nombre IS 'Nombre';
COMMENT ON COLUMN servicioComida.apellidoPaterno IS 'Apellido paterno';
COMMENT ON COLUMN servicioComida.apellidoMaterno IS 'Apellido materno';
COMMENT ON COLUMN servicioComida.fechaNacimiento IS 'Fecha de nacimiento';
COMMENT ON COLUMN servicioComida.genero IS 'Género';
COMMENT ON COLUMN servicioComida.fechaContratacion IS 'Fecha de contratación';
COMMENT ON COLUMN servicioComida.horarioInicio IS 'Hora de entrada';
COMMENT ON COLUMN servicioComida.horarioFin IS 'Hora de salida';
COMMENT ON COLUMN servicioComida.numeroInterior IS 'Número interior';
COMMENT ON COLUMN servicioComida.numeroExterior IS 'Número Exterior';
COMMENT ON COLUMN servicioComida.colonia IS 'Colonia';
COMMENT ON COLUMN servicioComida.calle IS 'Calle';
COMMENT ON COLUMN servicioComida.estado IS 'Estado';
COMMENT ON CONSTRAINT servicioComida_pkey  ON servicioComida IS 'La llave primaria de la tabla servicioComida';
COMMENT ON CONSTRAINT servicioComida_hotel_fkey ON servicioComida IS 'La llave foránea que viene de la tabla hotel';
COMMENT ON CONSTRAINT RFC_check ON servicioComida IS 'Restriccion CHECK para validar RFC';
COMMENT ON CONSTRAINT genero_valido ON servicioComida IS 'Valida que el genero sea M o H';
COMMENT ON CONSTRAINT numeroExterior_check ON servicioComida IS 'Valida que el número exterior sea positivo';


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
FOREIGN KEY (idHotel) REFERENCES hotel (idHotel)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;


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


---COMENTARIOS
COMMENT ON TABLE recepcionista IS 'Tabla que contiene los datos del personal recepcionista';
COMMENT ON COLUMN recepcionista.idPersona IS 'Identificador de la persona';
COMMENT ON COLUMN recepcionista.idHotel IS 'Identificador del hotel';
COMMENT ON COLUMN recepcionista.RFC IS 'RFC';
COMMENT ON COLUMN recepcionista.nombre IS 'Nombre';
COMMENT ON COLUMN recepcionista.apellidoPaterno IS 'Apellido paterno';
COMMENT ON COLUMN recepcionista.apellidoMaterno IS 'Apellido materno';
COMMENT ON COLUMN recepcionista.fechaNacimiento IS 'Fecha de nacimiento';
COMMENT ON COLUMN recepcionista.genero IS 'Género';
COMMENT ON COLUMN recepcionista.fechaContratacion IS 'Fecha de contratación';
COMMENT ON COLUMN recepcionista.horarioInicio IS 'Hora de entrada';
COMMENT ON COLUMN recepcionista.horarioFin IS 'Hora de salida';
COMMENT ON COLUMN recepcionista.numeroInterior IS 'Número interior';
COMMENT ON COLUMN recepcionista.numeroExterior IS 'Número Exterior';
COMMENT ON COLUMN recepcionista.colonia IS 'Colonia';
COMMENT ON COLUMN recepcionista.calle IS 'Calle';
COMMENT ON COLUMN recepcionista.estado IS 'Estado';
COMMENT ON CONSTRAINT recepcionista_pkey  ON recepcionista IS 'La llave primaria de la tabla recepcionista';
COMMENT ON CONSTRAINT recepcionista_hotel_fkey ON recepcionista IS 'La llave foránea que viene de la tabla hotel';
COMMENT ON CONSTRAINT RFC_check ON recepcionista IS 'Restriccion CHECK para validar RFC';
COMMENT ON CONSTRAINT genero_valido ON recepcionista IS 'Valida que el genero sea M o H';
COMMENT ON CONSTRAINT numeroExterior_check ON recepcionista IS 'Valida que el número exterior sea positivo';


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
FOREIGN KEY (idHotel) REFERENCES hotel (idHotel)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;


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

---COMENTARIOS
COMMENT ON TABLE limpiezaInterna IS 'Tabla que contiene los datos del personal de limpieza interna';
COMMENT ON COLUMN limpiezaInterna.idPersona IS 'Identificador de la persona';
COMMENT ON COLUMN limpiezaInterna.idHotel IS 'Identificador del hotel';
COMMENT ON COLUMN limpiezaInterna.RFC IS 'RFC';
COMMENT ON COLUMN limpiezaInterna.nombre IS 'Nombre';
COMMENT ON COLUMN limpiezaInterna.apellidoPaterno IS 'Apellido paterno';
COMMENT ON COLUMN limpiezaInterna.apellidoMaterno IS 'Apellido materno';
COMMENT ON COLUMN limpiezaInterna.fechaNacimiento IS 'Fecha de nacimiento';
COMMENT ON COLUMN limpiezaInterna.genero IS 'Género';
COMMENT ON COLUMN limpiezaInterna.fechaContratacion IS 'Fecha de contratación';
COMMENT ON COLUMN limpiezaInterna.horarioInicio IS 'Hora de entrada';
COMMENT ON COLUMN limpiezaInterna.horarioFin IS 'Hora de salida';
COMMENT ON COLUMN limpiezaInterna.numeroInterior IS 'Número interior';
COMMENT ON COLUMN limpiezaInterna.numeroExterior IS 'Número Exterior';
COMMENT ON COLUMN limpiezaInterna.colonia IS 'Colonia';
COMMENT ON COLUMN limpiezaInterna.calle IS 'Calle';
COMMENT ON COLUMN limpiezaInterna.estado IS 'Estado';
COMMENT ON CONSTRAINT limpiezaInterna_pkey  ON limpiezaInterna IS 'La llave primaria de la tabla limpiezaInterna';
COMMENT ON CONSTRAINT limpiezaInterna_hotel_fkey ON limpiezaInterna IS 'La llave foránea que viene de la tabla hotel';
COMMENT ON CONSTRAINT RFC_check ON limpiezaInterna IS 'Restriccion CHECK para validar RFC';
COMMENT ON CONSTRAINT genero_valido ON limpiezaInterna IS 'Valida que el genero sea M o H';
COMMENT ON CONSTRAINT numeroExterior_check ON limpiezaInterna IS 'Valida que el número exterior sea positivo';


-------------------------------- Tabla telefonoServicioComida --------------------------------


-- Definición de la tabla telefonoServicioComida
CREATE TABLE telefonoServicioComida (
    idPersona VARCHAR(20),
    telefonoServicioComida VARCHAR(20)
);

-- Referencial 
ALTER TABLE telefonoServicioComida ADD CONSTRAINT telefonoServicioComida_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES servicioComida(idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Se agrega la llave primaria 
ALTER TABLE telefonoServicioComida ADD CONSTRAINT telefonoServicioComida_pkey 
PRIMARY KEY (idPersona, telefonoServicioComida);

--Restricciones telefonoServicioComida
--Dominio
ALTER TABLE telefonoServicioComida ADD CONSTRAINT telefonoServicioComida_no_vacio CHECK (telefonoServicioComida <> ''); -- Restricción CHECK para garantizar que el campo telefonoPersona no esté vacío
ALTER TABLE telefonoServicioComida ADD CONSTRAINT telefonoServicioComida_valido CHECK(length(telefonoServicioComida::text) = 10 AND telefonoServicioComida::text ~ '^[0-9]{10}$');
-- Se asegura de rebicir 10 dígitos entre 0 y 9 cada uno

---COMENTARIOS
COMMENT ON TABLE telefonoServicioComida IS 'Tabla que contiene los datos del teléfono del personal del servicio de comida';
COMMENT ON COLUMN telefonoServicioComida.idPersona IS 'Identificador del personal del servicio de comida';
COMMENT ON COLUMN telefonoServicioComida.telefonoServicioComida IS 'Número telefónico';
COMMENT ON CONSTRAINT telefonoServicioComida_pkey    ON  telefonoServicioComida IS 'La llave primaria de la tabla telefonoServicioComida';
COMMENT ON CONSTRAINT telefonoServicioComida_fkey  ON  telefonoServicioComida IS 'La llave foránea de la tabla servicioComida';
COMMENT ON CONSTRAINT telefonoServicioComida_no_vacio  ON  telefonoServicioComida IS 'Restriccion CHECK NOT NULL para el atributo telefonoServicioComida de la tabla  telefonoServicioComida';
COMMENT ON CONSTRAINT telefonoServicioComida_valido  ON  telefonoServicioComida IS 'Restricción CHECK que valida que el número telefónico sea válido';


-------------------------------- Tabla telefonoRecepcionista --------------------------------


-- Definición de la tabla telefonoRecepcionista
CREATE TABLE telefonoRecepcionista (
    idPersona VARCHAR(20),
    telefonoRecepcionista VARCHAR(10)
);

-- Referencial 
ALTER TABLE telefonoRecepcionista ADD CONSTRAINT telefonoRecepcionista_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES recepcionista(idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Se agrega la llave primaria 
ALTER TABLE telefonoRecepcionista ADD CONSTRAINT telefonoRecepcionista_pkey 
PRIMARY KEY (idPersona, telefonoRecepcionista);

--Restricciones telefonoRecepcionista
--Dominio
ALTER TABLE telefonoRecepcionista ADD CONSTRAINT telefonoRecepcionista_no_vacio CHECK (telefonoRecepcionista <> ''); -- Restricción CHECK para garantizar que el campo telefonoPersona no esté vacío
ALTER TABLE telefonoRecepcionista ADD CONSTRAINT telefonoRecepcionista_valido CHECK(length(telefonoRecepcionista::text) = 10 AND telefonoRecepcionista::text ~ '^[0-9]{10}$');
-- Se asegura de rebicir 10 dígitos entre 0 y 9 cada uno

---COMENTARIOS
COMMENT ON TABLE telefonoRecepcionista IS 'Tabla que contiene los datos del teléfono del personal recepcionista';
COMMENT ON COLUMN telefonoRecepcionista.idPersona IS 'Identificador del personal recepcionista';
COMMENT ON COLUMN telefonoRecepcionista.telefonoRecepcionista IS 'Número telefónico';
COMMENT ON CONSTRAINT telefonoRecepcionista_pkey    ON  telefonoRecepcionista IS 'La llave primaria de la tabla telefonoRecepcionista';
COMMENT ON CONSTRAINT telefonoRecepcionista_fkey  ON  telefonoRecepcionista IS 'La llave foránea de la tabla recepcionista';
COMMENT ON CONSTRAINT telefonoRecepcionista_no_vacio  ON  telefonoRecepcionista IS 'Restriccion CHECK NOT NULL para el atributo telefonoRecepcionista de la tabla  telefonoRecepcionista';
COMMENT ON CONSTRAINT telefonoRecepcionista_valido  ON  telefonoRecepcionista IS 'Restricción CHECK que valida que el número telefónico sea válido';


-------------------------------- Tabla telefonoPersonalApoyo --------------------------------


-- Definición de la tabla telefonoPersonalApoyo
CREATE TABLE telefonoPersonalApoyo (
    idPersona VARCHAR(20),
    telefonoPersonalApoyo VARCHAR(10)
);

-- Referencial 
ALTER TABLE telefonoPersonalApoyo ADD CONSTRAINT telefonoPersonalApoyo_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES personalDeApoyo(idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Se agrega la llave primaria 
ALTER TABLE telefonoPersonalApoyo ADD CONSTRAINT telefonoPersonalApoyo_pkey 
PRIMARY KEY (idPersona, telefonoPersonalApoyo);

--Restricciones telefonoPersonalApoyo
--Dominio
ALTER TABLE telefonoPersonalApoyo ADD CONSTRAINT telefonoPersonalApoyo_no_vacio CHECK (telefonoPersonalApoyo <> ''); -- Restricción CHECK para garantizar que el campo telefonoPersona no esté vacío
ALTER TABLE telefonoPersonalApoyo ADD CONSTRAINT telefonoPersonalApoyo_valido CHECK(length(telefonoPersonalApoyo::text) = 10 AND telefonoPersonalApoyo::text ~ '^[0-9]{10}$');
-- Se asegura de rebicir 10 dígitos entre 0 y 9 cada uno

---COMENTARIOS
COMMENT ON TABLE telefonoPersonalApoyo IS 'Tabla que contiene los datos del teléfono del personal de apoyo';
COMMENT ON COLUMN telefonoPersonalApoyo.idPersona IS 'Identificador del personal de apoyo';
COMMENT ON COLUMN telefonoPersonalApoyo.telefonoPersonalApoyo IS 'Número telefónico';
COMMENT ON CONSTRAINT telefonoPersonalApoyo_pkey    ON  telefonoPersonalApoyo IS 'La llave primaria de la tabla telefonoPersonalApoyo';
COMMENT ON CONSTRAINT telefonoPersonalApoyo_fkey  ON  telefonoPersonalApoyo IS 'La llave foránea de la tabla personalDeApoyo';
COMMENT ON CONSTRAINT telefonoPersonalApoyo_no_vacio  ON  telefonoPersonalApoyo IS 'Restriccion CHECK NOT NULL para el atributo telefonoPersonalApoyo de la tabla  telefonoPersonalApoyo';
COMMENT ON CONSTRAINT telefonoPersonalApoyo_valido  ON  telefonoPersonalApoyo IS 'Restricción CHECK que valida que el número telefónico sea válido';


-------------------------------- Tabla telefonoLimpiezaInterna --------------------------------


-- Definición de la tabla telefonoLimpiezaInterna
CREATE TABLE telefonoLimpiezaInterna (
    idPersona VARCHAR(20),
    telefonoLimpiezaInterna VARCHAR(10)
);

-- Referencial 
ALTER TABLE telefonoLimpiezaInterna ADD CONSTRAINT telefonoLimpiezaInterna_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES limpiezaInterna(idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Se agrega la llave primaria 
ALTER TABLE telefonoLimpiezaInterna ADD CONSTRAINT telefonoLimpiezaInterna_pkey 
PRIMARY KEY (idPersona, telefonoLimpiezaInterna);

--Restricciones telefonoLimpiezaInterna
--Dominio
ALTER TABLE telefonoLimpiezaInterna ADD CONSTRAINT telefonoLimpiezaInterna_no_vacio CHECK (telefonoLimpiezaInterna <> ''); -- Restricción CHECK para garantizar que el campo telefonoPersona no esté vacío
ALTER TABLE telefonoLimpiezaInterna ADD CONSTRAINT telefonoLimpiezaInterna_valido CHECK(length(telefonoLimpiezaInterna::text) = 10 AND telefonoLimpiezaInterna::text ~ '^[0-9]{10}$');
-- Se asegura de rebicir 10 dígitos entre 0 y 9 cada uno

---COMENTARIOS
COMMENT ON TABLE telefonoLimpiezaInterna IS 'Tabla que contiene los datos del teléfono del personal de limpieza interna';
COMMENT ON COLUMN telefonoLimpiezaInterna.idPersona IS 'Identificador del personal de limpieza interna';
COMMENT ON COLUMN telefonoLimpiezaInterna.telefonoLimpiezaInterna IS 'Número telefónico';
COMMENT ON CONSTRAINT telefonoLimpiezaInterna_pkey    ON  telefonoLimpiezaInterna IS 'La llave primaria de la tabla telefonoLimpiezaInterna';
COMMENT ON CONSTRAINT telefonoLimpiezaInterna_fkey  ON  telefonoLimpiezaInterna IS 'La llave foránea de la tabla limpiezaInterna';
COMMENT ON CONSTRAINT telefonoLimpiezaInterna_no_vacio  ON  telefonoLimpiezaInterna IS 'Restriccion CHECK NOT NULL para el atributo telefonoLimpiezaInterna de la tabla  telefonoLimpiezaInterna';
COMMENT ON CONSTRAINT telefonoLimpiezaInterna_valido  ON  telefonoLimpiezaInterna IS 'Restricción CHECK que valida que el número telefónico sea válido';


-------------------------------- Tabla correoPersonalApoyo --------------------------------


-- Definición de la tabla correoPersonalApoyo
CREATE TABLE correoPersonalApoyo (
    idPersona VARCHAR(20),
    correoPersonalApoyo VARCHAR(100)
);

-- Referencial 
ALTER TABLE correoPersonalApoyo ADD CONSTRAINT correoPersonalApoyo_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES personalDeApoyo(idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Se agrega la llave primaria 
ALTER TABLE correoPersonalApoyo ADD CONSTRAINT correoPersonalApoyo_pkey 
PRIMARY KEY (idPersona, correoPersonalApoyo);

-- Restricciones correoPersonalApoyo
-- Dominio
ALTER TABLE correoPersonalApoyo
ADD CONSTRAINT correoPersonalApoyo_no_vacio -- Restricción CHECK para garantizar que el campo correoPersonalApoyo no esté vacío
CHECK (correoPersonalApoyo <> '');

---COMENTARIOS
COMMENT ON TABLE correoPersonalApoyo IS 'Tabla que contiene los datos del correo del personal de apoyo';
COMMENT ON COLUMN correoPersonalApoyo.idPersona IS 'Identificador del personal de apoyo';
COMMENT ON COLUMN correoPersonalApoyo.correoPersonalApoyo IS 'Correo electrónico';
COMMENT ON CONSTRAINT correoPersonalApoyo_pkey    ON  correoPersonalApoyo IS 'La llave primaria de la tabla correoPersonalApoyo';
COMMENT ON CONSTRAINT correoPersonalApoyo_fkey  ON  correoPersonalApoyo IS 'La llave foránea de la tabla personalDeApoyo';
COMMENT ON CONSTRAINT correoPersonalApoyo_no_vacio  ON  correoPersonalApoyo IS 'Restriccion CHECK NOT NULL para el atributo correoPersonalApoyo de la tabla  correoPersonalApoyo';


-------------------------------- Tabla correoServicioComida --------------------------------


-- Definición de la tabla correoServicioComida
CREATE TABLE correoServicioComida (
    idPersona VARCHAR(20),
    correoServicioComida VARCHAR(100)
);

-- Referencial 
ALTER TABLE correoServicioComida ADD CONSTRAINT correoServicioComida_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES servicioComida(idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Se agrega la llave primaria 
ALTER TABLE correoServicioComida ADD CONSTRAINT correoServicioComida_pkey 
PRIMARY KEY (idPersona, correoServicioComida);

-- Restricciones correoServicioComida
-- Dominio
ALTER TABLE correoServicioComida
ADD CONSTRAINT correoServicioComida_no_vacio -- Restricción CHECK para garantizar que el campo correoServicioComida no esté vacío
CHECK (correoServicioComida <> '');

---COMENTARIOS
COMMENT ON TABLE correoServicioComida IS 'Tabla que contiene los datos del correo del personal de servicio de comida';
COMMENT ON COLUMN correoServicioComida.idPersona IS 'Identificador del personal de servicio de comida';
COMMENT ON COLUMN correoServicioComida.correoServicioComida IS 'Correo electrónico';
COMMENT ON CONSTRAINT correoServicioComida_pkey    ON  correoServicioComida IS 'La llave primaria de la tabla correoServicioComida';
COMMENT ON CONSTRAINT correoServicioComida_fkey  ON  correoServicioComida IS 'La llave foránea de la tabla servicioComida';
COMMENT ON CONSTRAINT correoServicioComida_no_vacio  ON  correoServicioComida IS 'Restriccion CHECK NOT NULL para el atributo correoServicioComida de la tabla  correoServicioComida';


-------------------------------- Tabla correoRecepcionista --------------------------------


-- Definición de la tabla correoRecepcionista
CREATE TABLE correoRecepcionista (
    idPersona VARCHAR(20),
    correoRecepcionista VARCHAR(100)
);

-- Referencial 
ALTER TABLE correoRecepcionista ADD CONSTRAINT correoRecepcionista_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES recepcionista(idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Se agrega la llave primaria 
ALTER TABLE correoRecepcionista ADD CONSTRAINT correoRecepcionista_pkey 
PRIMARY KEY (idPersona, correoRecepcionista);

-- Restricciones correoRecepcionista
-- Dominio
ALTER TABLE correoRecepcionista
ADD CONSTRAINT correoRecepcionista_no_vacio -- Restricción CHECK para garantizar que el campo correoRecepcionista no esté vacío
CHECK (correoRecepcionista <> '');

---COMENTARIOS
COMMENT ON TABLE correoRecepcionista IS 'Tabla que contiene los datos del correo del personal recepcionista';
COMMENT ON COLUMN correoRecepcionista.idPersona IS 'Identificador del personal recepcionista';
COMMENT ON COLUMN correoRecepcionista.correoRecepcionista IS 'Correo electrónico';
COMMENT ON CONSTRAINT correoRecepcionista_pkey    ON  correoRecepcionista IS 'La llave primaria de la tabla correoRecepcionista';
COMMENT ON CONSTRAINT correoRecepcionista_fkey  ON  correoRecepcionista IS 'La llave foránea de la tabla recepcionista';
COMMENT ON CONSTRAINT correoRecepcionista_no_vacio  ON  correoRecepcionista IS 'Restriccion CHECK NOT NULL para el atributo correoRecepcionista de la tabla  correoRecepcionista';


-------------------------------- Tabla correoLimpiezaInterna --------------------------------


-- Definición de la tabla correoLimpiezaInterna
CREATE TABLE correoLimpiezaInterna (
    idPersona VARCHAR(20),
    correoLimpiezaInterna VARCHAR(100)
);

-- Referencial 
ALTER TABLE correoLimpiezaInterna ADD CONSTRAINT correoLimpiezaInterna_fkey -- Se agrega una restricción de clave externa (foreign key constraint) 
FOREIGN KEY(idPersona) REFERENCES limpiezaInterna(idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Se agrega la llave primaria 
ALTER TABLE correoLimpiezaInterna ADD CONSTRAINT correoLimpiezaInterna_pkey 
PRIMARY KEY (idPersona, correoLimpiezaInterna);

-- Restricciones correoLimpiezaInterna
-- Dominio
ALTER TABLE correoLimpiezaInterna
ADD CONSTRAINT correoLimpiezaInternaa_no_vacio -- Restricción CHECK para garantizar que el campo correoLimpiezaInterna no esté vacío
CHECK (correoLimpiezaInterna <> '');

---COMENTARIOS
COMMENT ON TABLE correoLimpiezaInterna IS 'Tabla que contiene los datos del correo del personal de limpieza interna';
COMMENT ON COLUMN correoLimpiezaInterna.idPersona IS 'Identificador del personal de limpieza interna';
COMMENT ON COLUMN correoLimpiezaInterna.correoLimpiezaInterna IS 'Correo electrónico';
COMMENT ON CONSTRAINT correoLimpiezaInterna_pkey    ON  correoLimpiezaInterna IS 'La llave primaria de la tabla correoLimpiezaInterna';
COMMENT ON CONSTRAINT correoLimpiezaInterna_fkey  ON  correoLimpiezaInterna IS 'La llave foránea de la tabla limpiezaInterna';
COMMENT ON CONSTRAINT correoLimpiezaInternaa_no_vacio  ON  correoLimpiezaInterna IS 'Restriccion CHECK NOT NULL para el atributo correoLimpiezaInterna de la tabla  correoLimpiezaInterna';


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
FOREIGN KEY (idPersona) REFERENCES personalDeApoyo (idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

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

---COMENTARIOS
COMMENT ON TABLE individual IS 'Tabla que contiene los datos de la habitación individual';
COMMENT ON COLUMN individual.idHabitacion IS 'Identificador de la habitación individual';
COMMENT ON COLUMN individual.idPersona IS 'Identificador del personal de apoyo';
COMMENT ON COLUMN individual.RFC IS 'RFC';
COMMENT ON COLUMN individual.disponibilidad IS 'Disponibilidad de la habitación';
COMMENT ON COLUMN individual.costoPorNoche IS 'Costo por noche';
COMMENT ON COLUMN individual.numeroDeHabitacion IS 'Número de habitación';
COMMENT ON COLUMN individual.numeroDeCamas IS 'Número de camas';
COMMENT ON CONSTRAINT individual_pkey ON  individual IS 'La llave primaria de la tabla individual';
COMMENT ON CONSTRAINT individual_persona_fkey ON  individual IS 'La llave foránea de la tabla personalDeApoyo';
COMMENT ON CONSTRAINT RFC_check  ON  individual IS 'Restriccion CHECK para validar el RFC';
COMMENT ON CONSTRAINT costoPorNoche_positivo_check ON individual IS 'Restricción CHECK que valida que el costo por noche sea positivo';
COMMENT ON CONSTRAINT numeroDeHabitacion_positivo_check ON individual IS 'Restricción CHECK que valida que el número de habitación sea positivo';
COMMENT ON CONSTRAINT numeroDeCamas_positivo_check ON individual IS 'Restricción CHECK que valida que el número de camas sea positivo';
COMMENT ON CONSTRAINT disponibilidad_check ON individual IS 'Restricción CHECK que valida que la disponibilidad sea verdadero o falso';


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
FOREIGN KEY (idPersona) REFERENCES personalDeApoyo (idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

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

---COMENTARIOS
COMMENT ON TABLE doble IS 'Tabla que contiene los datos de la habitación doble';
COMMENT ON COLUMN doble.idHabitacion IS 'Identificador de la habitación doble';
COMMENT ON COLUMN doble.idPersona IS 'Identificador del personal de apoyo';
COMMENT ON COLUMN doble.RFC IS 'RFC';
COMMENT ON COLUMN doble.disponibilidad IS 'Disponibilidad de la habitación';
COMMENT ON COLUMN doble.costoPorNoche IS 'Costo por noche';
COMMENT ON COLUMN doble.numeroDeHabitacion IS 'Número de habitación';
COMMENT ON COLUMN doble.numeroDeCamas IS 'Número de camas';
COMMENT ON CONSTRAINT doble_pkey ON  doble IS 'La llave primaria de la tabla doble';
COMMENT ON CONSTRAINT doble_persona_fkey ON  doble IS 'La llave foránea de la tabla personalDeApoyo';
COMMENT ON CONSTRAINT RFC_check_doble  ON doble IS 'Restriccion CHECK para validar el RFC';
COMMENT ON CONSTRAINT costoPorNoche_positivo_check_doble ON doble IS 'Restricción CHECK que valida que el costo por noche sea positivo';
COMMENT ON CONSTRAINT numeroDeHabitacion_positivo_check_doble ON doble IS 'Restricción CHECK que valida que el número de habitación sea positivo';
COMMENT ON CONSTRAINT numeroDeCamas_doble ON doble IS 'Restricción CHECK que valida que el número de camas sea positivo';
COMMENT ON CONSTRAINT disponibilidad_check_doble ON doble IS 'Restricción CHECK que valida que la disponibilidad sea verdadero o falso';


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
FOREIGN KEY (idPersona) REFERENCES personalDeApoyo (idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

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

---COMENTARIOS
COMMENT ON TABLE cuadruple IS 'Tabla que contiene los datos de la habitación cuadruple';
COMMENT ON COLUMN cuadruple.idHabitacion IS 'Identificador de la habitación cuadruple';
COMMENT ON COLUMN cuadruple.idPersona IS 'Identificador del personal de apoyo';
COMMENT ON COLUMN cuadruple.RFC IS 'RFC';
COMMENT ON COLUMN cuadruple.disponibilidad IS 'Disponibilidad de la habitación';
COMMENT ON COLUMN cuadruple.costoPorNoche IS 'Costo por noche';
COMMENT ON COLUMN cuadruple.numeroDeHabitacion IS 'Número de habitación';
COMMENT ON COLUMN cuadruple.numeroDeCamas IS 'Número de camas';
COMMENT ON CONSTRAINT cuadruple_pkey ON  cuadruple IS 'La llave primaria de la tabla cuadruple';
COMMENT ON CONSTRAINT cuadruple_persona_fkey ON cuadruple IS 'La llave foránea de la tabla personalDeApoyo';
COMMENT ON CONSTRAINT RFC_check_cuadruple  ON cuadruple IS 'Restriccion CHECK para validar el RFC';
COMMENT ON CONSTRAINT costoPorNoche_positivo_check_cuadruple ON cuadruple IS 'Restricción CHECK que valida que el costo por noche sea positivo';
COMMENT ON CONSTRAINT numeroDeHabitacion_positivo_check_cuadruple ON cuadruple IS 'Restricción CHECK que valida que el número de habitación sea positivo';
COMMENT ON CONSTRAINT numeroDeCamas_cuadruple ON cuadruple IS 'Restricción CHECK que valida que el número de camas sea positivo';
COMMENT ON CONSTRAINT disponibilidad_check_cuadruple ON cuadruple IS 'Restricción CHECK que valida que la disponibilidad sea verdadero o falso';


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
FOREIGN KEY (idPersona) REFERENCES personalDeApoyo (idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

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

---COMENTARIOS
COMMENT ON TABLE penthouse IS 'Tabla que contiene los datos de la habitación penthouse';
COMMENT ON COLUMN penthouse.idHabitacion IS 'Identificador de la habitación penthouse';
COMMENT ON COLUMN penthouse.idPersona IS 'Identificador del personal de apoyo';
COMMENT ON COLUMN penthouse.RFC IS 'RFC';
COMMENT ON COLUMN penthouse.disponibilidad IS 'Disponibilidad de la habitación';
COMMENT ON COLUMN penthouse.costoPorNoche IS 'Costo por noche';
COMMENT ON COLUMN penthouse.numeroDeHabitacion IS 'Número de habitación';
COMMENT ON COLUMN penthouse.numeroDeCamas IS 'Número de camas';
COMMENT ON CONSTRAINT penthouse_pkey ON  penthouse IS 'La llave primaria de la tabla penthouse';
COMMENT ON CONSTRAINT penthouse_persona_fkey ON penthouse IS 'La llave foránea de la tabla personalDeApoyo';
COMMENT ON CONSTRAINT RFC_check  ON penthouse IS 'Restriccion CHECK para validar el RFC';
COMMENT ON CONSTRAINT costoPorNoche_positivo_check_penthouse ON penthouse IS 'Restricción CHECK que valida que el costo por noche sea positivo';
COMMENT ON CONSTRAINT numeroDeHabitacion_positivo_check_penthouse ON penthouse IS 'Restricción CHECK que valida que el número de habitación sea positivo';
COMMENT ON CONSTRAINT numeroDeCamas_penthouse ON penthouse IS 'Restricción CHECK que valida que el número de camas sea positivo';
COMMENT ON CONSTRAINT disponibilidad_check_penthouse ON penthouse IS 'Restricción CHECK que valida que la disponibilidad sea verdadero o falso';


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


---COMENTARIOS
COMMENT ON TABLE salon IS 'Tabla que contiene los datos del salón';
COMMENT ON COLUMN salon.idSalon IS 'Identificador del salón';
COMMENT ON COLUMN salon.horarioInicio IS 'Hora de inicio';
COMMENT ON COLUMN salon.horarioFin IS 'Hora de cierre';
COMMENT ON COLUMN salon.nombreSalon IS 'Nombre del salón';
COMMENT ON COLUMN salon.capacidad IS 'Capacidad del salón';
COMMENT ON COLUMN salon.numeroInterior IS 'Número interior';
COMMENT ON COLUMN salon.numeroExterior IS 'Número de exterior';
COMMENT ON COLUMN salon.colonia IS 'Colonia';
COMMENT ON COLUMN salon.calle IS 'Calle';
COMMENT ON COLUMN salon.estado IS 'Estado';
COMMENT ON CONSTRAINT salon_pkey ON  salon IS 'La llave primaria de la tabla salon';
COMMENT ON CONSTRAINT capacidad_check ON salon IS 'Restricción CHECK para validar que la capacidad sea positiva';
COMMENT ON CONSTRAINT numeroExterior_check ON salon IS 'Restriccion CHECK para validar que el número exterior sea positivo';


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
FOREIGN KEY (idSalon) REFERENCES salon (idSalon)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencial para la tabla huesped
ALTER TABLE evento ADD CONSTRAINT evento_persona_fkey 
FOREIGN KEY (idPersona) REFERENCES huesped (idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

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

---COMENTARIOS
COMMENT ON TABLE evento IS 'Tabla que contiene los datos del evento';
COMMENT ON COLUMN evento.idEvento IS 'Identificador del evento';
COMMENT ON COLUMN evento.idPersona IS 'Identificador del huésped que reserva el evento';
COMMENT ON COLUMN evento.numMembresia IS 'Número de membresía';
COMMENT ON COLUMN evento.nombreSalon IS 'Nombre del salón';
COMMENT ON COLUMN evento.numAsistentes IS 'Número de asistentes';
COMMENT ON COLUMN evento.fechaEvento IS 'Fecha del evento';
COMMENT ON COLUMN evento.horaInicio IS 'Hora de inicio';
COMMENT ON COLUMN evento.horaFin IS 'Hora de fin';
COMMENT ON COLUMN evento.idSalon IS 'Identificador del salón';
COMMENT ON CONSTRAINT evento_pkey ON  evento IS 'La llave primaria de la tabla evento';
COMMENT ON CONSTRAINT evento_salon_fkey ON evento IS 'La llave foránea de la tabla salon';
COMMENT ON CONSTRAINT evento_persona_fkey ON evento IS 'La llave foránea de la tabla huesped';
COMMENT ON CONSTRAINT numAsistentes_check ON evento IS 'Restriccion CHECK para validar que el número de asistentes sea positivo';


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
FOREIGN KEY (idPersona) REFERENCES huesped (idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

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

---COMENTARIOS
COMMENT ON TABLE encuesta IS 'Tabla que contiene los datos de la encuesta';
COMMENT ON COLUMN encuesta.idEncuesta IS 'Identificador de la encuesta';
COMMENT ON COLUMN encuesta.servicioRecibido IS 'Evaluación del servicio recibido';
COMMENT ON COLUMN encuesta.limpieza IS 'Evaluación de la limpieza';
COMMENT ON COLUMN encuesta.recomendacion IS 'Evaluación de la recomendación';
COMMENT ON COLUMN encuesta.comentario IS 'Comentario del Huésped';
COMMENT ON COLUMN encuesta.volverHospedar IS 'Evaluación de si volvería a hospedarse';
COMMENT ON COLUMN encuesta.idPersona IS 'Identificador del huésped';
COMMENT ON CONSTRAINT encuesta_pkey  ON  encuesta IS 'La llave primaria de la tabla encuesta';
COMMENT ON CONSTRAINT encuesta_persona_fkey  ON encuesta IS 'La llave foránea de la tabla huesped';
COMMENT ON CONSTRAINT check_servicioRecibido ON encuesta IS 'Restriccion CHECK para validar que el 
	servicio recibido esté entre 1 y 5';
COMMENT ON CONSTRAINT check_limpieza ON encuesta IS 'Restriccion CHECK para validar que la evaluación 
	de la limpieza esté entre 1 y 5';
COMMENT ON CONSTRAINT check_recomendacion ON encuesta IS 'Restriccion CHECK para validar que la 
	evaluación de la recomendación esté entre 1 y 5';
COMMENT ON CONSTRAINT check_volverHospedar  ON encuesta IS 'Restriccion CHECK para validar que 
	la evaluación de si volvería a hospedarse esté entre 1 y 5';


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
FOREIGN KEY (idPersona) REFERENCES huesped (idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Restricciones para la tabla membresia
ALTER TABLE membresia ALTER COLUMN numeroMembresia SET NOT NULL;  -- La columna numeroMembresia no puede ser NULL
ALTER TABLE membresia ALTER COLUMN activa SET NOT NULL;           -- La columna activa no puede ser NULL
ALTER TABLE membresia ADD CONSTRAINT activa_check CHECK (activa IN ('SI', 'NO'));  -- Restricción para activa (Solo 'SI' o 'NO')
ALTER TABLE membresia ALTER COLUMN idPersona SET NOT NULL;        -- La columna idPersona no puede ser NULL


---COMENTARIOS
COMMENT ON TABLE membresia IS 'Tabla que contiene los datos de la membresia';
COMMENT ON COLUMN membresia.numeroMembresia IS 'Identificador de la membresía: Número de membresía';
COMMENT ON COLUMN membresia.activa IS 'Estado de la membresía: SI/NO';
COMMENT ON COLUMN membresia.idPersona IS 'Identificador del huésped';
COMMENT ON CONSTRAINT membresia_pkey   ON  membresia IS 'La llave primaria de la tabla membresia';
COMMENT ON CONSTRAINT membresia_persona_fkey  ON membresia IS 'La llave foránea de la tabla huesped';
COMMENT ON CONSTRAINT activa_check ON membresia IS 'Restriccion CHECK para validar que se introduzca
	SI/NO';


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

---COMENTARIOS
COMMENT ON TABLE pago IS 'Tabla que contiene los datos del pago';
COMMENT ON COLUMN pago.idPago IS 'Identificador del pago';
COMMENT ON COLUMN pago.NumeroNinos IS 'Número de niños';
COMMENT ON COLUMN pago.NumeroAdultos IS 'Número de Adultos';
COMMENT ON COLUMN pago.NumeroMascotas IS 'Número de mascotas';
COMMENT ON COLUMN pago.NumeroNoches IS 'Número de noches';
COMMENT ON CONSTRAINT pago_pkey   ON  pago IS 'La llave primaria de la tabla pago';
COMMENT ON CONSTRAINT NumeroNinos_check ON pago IS 'Restriccion CHECK para validar que el número de niños
	introducido no sea negativo';
COMMENT ON CONSTRAINT NumeroAdultos_check ON pago IS 'Restriccion CHECK para validar que el número de adultos
	introducido no sea negativo';
COMMENT ON CONSTRAINT NumeroMascotas_check ON pago IS 'Restriccion CHECK para validar que el número de 
	mascotas introducido no sea negativo';
COMMENT ON CONSTRAINT NumeroNoches_check ON pago IS 'Restriccion CHECK para validar que el número de noches
	introducido no sea negativo';


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
FOREIGN KEY (idPago) REFERENCES pago (idPago)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Restricciones para la tabla servicioExtra
ALTER TABLE servicioExtra ALTER COLUMN idServicio SET NOT NULL;   -- La columna idServicio no puede ser NULL
ALTER TABLE servicioExtra ALTER COLUMN numeroPlatos SET NOT NULL; -- La columna numeroPlatos no puede ser NULL
ALTER TABLE servicioExtra ALTER COLUMN idpago SET NOT NULL;       -- La columna idpago no puede ser NULL

ALTER TABLE servicioExtra ADD CONSTRAINT numeroPlatos_check CHECK(numeroPlatos >= 0); 
-- Se asegura de que el número de platos solo reciba valores mayores o iguales a cero.

---COMENTARIOS
COMMENT ON TABLE servicioExtra IS 'Tabla que contiene los datos de los servicios adicionales solicitados';
COMMENT ON COLUMN servicioExtra.idServicio IS 'Identificador del servicio extra';
COMMENT ON COLUMN servicioExtra.numeroPlatos IS 'Número de platos añadidos';
COMMENT ON COLUMN servicioExtra.idPago IS 'Identificador del pago';
COMMENT ON CONSTRAINT servicioExtra_pkey   ON  servicioExtra IS 'La llave primaria de la tabla servicioExtra';
COMMENT ON CONSTRAINT servicioExtra_pago_fkey ON servicioExtra IS 'La llave foránea que viene de la tabla
	pago';
COMMENT ON CONSTRAINT numeroPlatos_check ON servicioExtra IS 'Restriccion CHECK para validar que el 
	número de platos introducido no sea negativo';


-------------------------------- disponerIndividual --------------------------------


-- Creación de la tabla disponerIndividual
CREATE TABLE disponerIndividual (
    idDisponerIndividual VARCHAR(20),    -- Identificador de la habitación
    idHotel VARCHAR(20)         -- Identificador del hotel
);

-- Se agrega la llave primaria 
ALTER TABLE disponerIndividual ADD CONSTRAINT disponerIndividual_pkey 
PRIMARY KEY (idDisponerIndividual); 

-- Se agrega la restricción de clave externa para la tabla hotel
ALTER TABLE disponerIndividual ADD CONSTRAINT disponerIndividual_hotel_fkey 
FOREIGN KEY (IDHotel) REFERENCES hotel (IDHotel)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE disponerIndividual ALTER COLUMN idDisponerIndividual SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idHabitacion
ALTER TABLE disponerIndividual ALTER COLUMN IDHotel SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna IDHotel

---COMENTARIOS
COMMENT ON TABLE disponerIndividual IS 'Tabla que contiene los identificadores de las tablas individual y hotel';
COMMENT ON COLUMN disponerIndividual.idDisponerIndividual IS 'Identificador de la habitación individual';
COMMENT ON COLUMN disponerIndividual.idHotel IS 'Identificador del hotel';
COMMENT ON CONSTRAINT disponerIndividual_hotel_fkey ON  disponerIndividual IS 'La llave foránea que viene de la tabla hotel';


-------------------------------- disponerDoble --------------------------------


-- Creación de la tabla disponerDoble
CREATE TABLE disponerDoble (
    idDisponerDoble VARCHAR(20),    -- Identificador de la habitación
    idHotel VARCHAR(20)         -- Identificador del hotel
);

-- Se agrega la llave primaria 
ALTER TABLE disponerDoble ADD CONSTRAINT disponerDoble_pkey 
PRIMARY KEY (idDisponerDoble); 

-- Se agrega la restricción de clave externa para la tabla hotel
ALTER TABLE disponerDoble ADD CONSTRAINT disponerDoble_hotel_fkey 
FOREIGN KEY (IDHotel) REFERENCES hotel (IDHotel)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE disponerDoble ALTER COLUMN idDisponerDoble SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idHabitacion
ALTER TABLE disponerDoble ALTER COLUMN IDHotel SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna IDHotel

---COMENTARIOS
COMMENT ON TABLE disponerDoble IS 'Tabla que contiene los identificadores de las tablas doble y hotel';
COMMENT ON COLUMN disponerDoble.idDisponerDoble IS 'Identificador de la habitación doble';
COMMENT ON COLUMN disponerDoble.idHotel IS 'Identificador del hotel';
COMMENT ON CONSTRAINT disponerDoble_hotel_fkey ON  disponerDoble IS 'La llave foránea que viene de la tabla hotel';



-------------------------------- disponerCuadruple --------------------------------


-- Creación de la tabla disponerCuadruple
CREATE TABLE disponerCuadruple (
    idDisponerCuadruple VARCHAR(20),    -- Identificador de la habitación
    idHotel VARCHAR(20)         -- Identificador del hotel
);

-- Se agrega la llave primaria 
ALTER TABLE disponerCuadruple ADD CONSTRAINT disponerCuadruple_pkey 
PRIMARY KEY (idDisponerCuadruple); 

-- Se agrega la restricción de clave externa para la tabla hotel
ALTER TABLE disponerCuadruple ADD CONSTRAINT disponerCuadruple_hotel_fkey 
FOREIGN KEY (IDHotel) REFERENCES hotel (IDHotel)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE disponerCuadruple ALTER COLUMN idDisponerCuadruple SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idHabitacion
ALTER TABLE disponerCuadruple ALTER COLUMN IDHotel SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna IDHotel

---COMENTARIOS
COMMENT ON TABLE disponerCuadruple IS 'Tabla que contiene los identificadores de las tablas cuadruple y hotel';
COMMENT ON COLUMN disponerCuadruple.idDisponerCuadruple IS 'Identificador de la habitación cuadruple';
COMMENT ON COLUMN disponerCuadruple.idHotel IS 'Identificador del hotel';
COMMENT ON CONSTRAINT disponerCuadruple_hotel_fkey ON  disponerCuadruple IS 'La llave foránea que viene de la tabla hotel';



-------------------------------- disponerPenthouse --------------------------------


-- Creación de la tabla disponerPenthouse
CREATE TABLE disponerPenthouse (
    idDisponerPenthouse VARCHAR(20),    -- Identificador de la habitación
    idHotel VARCHAR(20)         -- Identificador del hotel
);

-- Se agrega la llave primaria 
ALTER TABLE disponerPenthouse ADD CONSTRAINT disponerPenthouse_pkey 
PRIMARY KEY (idDisponerPenthouse); 

-- Se agrega la restricción de clave externa para la tabla hotel
ALTER TABLE disponerPenthouse ADD CONSTRAINT disponerPenthouse_hotel_fkey 
FOREIGN KEY (IDHotel) REFERENCES hotel (IDHotel)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE disponerPenthouse ALTER COLUMN idDisponerPenthouse SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idHabitacion
ALTER TABLE disponerPenthouse ALTER COLUMN IDHotel SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna IDHotel

---COMENTARIOS
COMMENT ON TABLE disponerPenthouse IS 'Tabla que contiene los identificadores de las tablas penthouse y hotel';
COMMENT ON COLUMN disponerPenthouse.idDisponerPenthouse IS 'Identificador de la habitación penthouse';
COMMENT ON COLUMN disponerPenthouse.idHotel IS 'Identificador del hotel';
COMMENT ON CONSTRAINT disponerPenthouse_hotel_fkey  ON  disponerPenthouse IS 'La llave foránea que viene de la tabla hotel';



-------------------------------- Tabla atender --------------------------------


-- Creación de la tabla atender
CREATE TABLE atender (
    idEvento VARCHAR(20),     -- Identificador del evento
    idPersona VARCHAR(20)    -- Identificador de la persona

);

-- Se agrega la restricción de clave externa para la tabla evento
ALTER TABLE atender ADD CONSTRAINT atender_evento_fkey 
FOREIGN KEY (idEvento) REFERENCES evento (idEvento)
ON DELETE CASCADE ON UPDATE CASCADE;


-- Se agrega la restricción de clave externa para la tabla empleado
ALTER TABLE atender ADD CONSTRAINT atender_persona_fkey 
FOREIGN KEY (idPersona) REFERENCES personalDeApoyo (idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE atender ALTER COLUMN IDEvento SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna IDEvento
ALTER TABLE atender ALTER COLUMN idPersona SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idPersona

---COMENTARIOS
COMMENT ON TABLE atender IS 'Tabla que contiene los identificadores de las tablas personalDeApoyo y Evento';
COMMENT ON COLUMN atender.idEvento IS 'Identificador del evento';
COMMENT ON COLUMN atender.idPersona IS 'Identificador del personal de apoyo';
COMMENT ON CONSTRAINT atender_evento_fkey  ON  atender IS 'La llave foránea que viene de la tabla evento';
COMMENT ON CONSTRAINT atender_persona_fkey ON  atender IS 'La llave foránea que viene de la tabla
	personalDeApoyo';


-------------------------------- Tabla rentarIndividual --------------------------------


-- Creación de la tabla rentarIndividual
CREATE TABLE rentarIndividual (
    idPersona VARCHAR(20),    -- Identificador de la persona
    idHabitacion VARCHAR(20) -- Identificador de la habitación
);

-- Se agrega la restricción de clave externa para la tabla persona
ALTER TABLE rentarIndividual ADD CONSTRAINT rentarIndividual_persona_fkey 
FOREIGN KEY (idPersona) REFERENCES huesped (idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Se agrega la restricción de clave externa para la tabla habitacion
ALTER TABLE rentarIndividual ADD CONSTRAINT rentarIndividual_habitacion_fkey 
FOREIGN KEY (idHabitacion) REFERENCES individual (idHabitacion)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE rentarIndividual ALTER COLUMN idPersona SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idPersona

---COMENTARIOS
COMMENT ON TABLE rentarIndividual IS 'Tabla que contiene los identificadores de las tablas individual y huesped';
COMMENT ON COLUMN rentarIndividual.idHabitacion IS 'Identificador de la habitación individual';
COMMENT ON COLUMN rentarIndividual.idPersona IS 'Identificador del huésped';
COMMENT ON CONSTRAINT rentarIndividual_persona_fkey   ON  rentarIndividual IS 'La llave foránea que viene de la tabla huesped';
COMMENT ON CONSTRAINT rentarIndividual_habitacion_fkey ON  rentarIndividual IS 'La llave foránea que viene de la tabla
	individual';


-------------------------------- Tabla rentarDoble --------------------------------


-- Creación de la tabla rentarDoble
CREATE TABLE rentarDoble (
    idPersona VARCHAR(20),    -- Identificador de la persona
    idHabitacion VARCHAR(20) -- Identificador de la habitación
);

-- Se agrega la restricción de clave externa para la tabla persona
ALTER TABLE rentarDoble ADD CONSTRAINT rentarDoble_persona_fkey 
FOREIGN KEY (idPersona) REFERENCES huesped (idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;


-- Se agrega la restricción de clave externa para la tabla habitacion
ALTER TABLE rentarDoble ADD CONSTRAINT rentarDoble_habitacion_fkey 
FOREIGN KEY (idHabitacion) REFERENCES doble (idHabitacion)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE rentarDoble ALTER COLUMN idPersona SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idPersona

---COMENTARIOS
COMMENT ON TABLE rentarDoble IS 'Tabla que contiene los identificadores de las tablas doble y huesped';
COMMENT ON COLUMN rentarDoble.idHabitacion IS 'Identificador de la habitación doble';
COMMENT ON COLUMN rentarDoble.idPersona IS 'Identificador del huésped';
COMMENT ON CONSTRAINT rentarDoble_persona_fkey    ON  rentarDoble IS 'La llave foránea que viene de la tabla huesped';
COMMENT ON CONSTRAINT rentarDoble_habitacion_fkey  ON  rentarDoble IS 'La llave foránea que viene de la tabla
	doble';


-------------------------------- Tabla rentarCuadruple --------------------------------


-- Creación de la tabla rentarCuadruple
CREATE TABLE rentarCuadruple (
    idPersona VARCHAR(20),    -- Identificador de la persona
    idHabitacion VARCHAR(20) -- Identificador de la habitación
);

-- Se agrega la restricción de clave externa para la tabla persona
ALTER TABLE rentarCuadruple ADD CONSTRAINT rentarCuadruple_persona_fkey 
FOREIGN KEY (idPersona) REFERENCES huesped (idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Se agrega la restricción de clave externa para la tabla habitacion
ALTER TABLE rentarCuadruple ADD CONSTRAINT rentarCuadruple_habitacion_fkey 
FOREIGN KEY (idHabitacion) REFERENCES cuadruple (idHabitacion)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE rentarCuadruple ALTER COLUMN idPersona SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idPersona

---COMENTARIOS
COMMENT ON TABLE rentarCuadruple IS 'Tabla que contiene los identificadores de las tablas cuadruple y huesped';
COMMENT ON COLUMN rentarCuadruple.idHabitacion IS 'Identificador de la habitación cuadruple';
COMMENT ON COLUMN rentarCuadruple.idPersona IS 'Identificador del huésped';
COMMENT ON CONSTRAINT rentarCuadruple_persona_fkey    ON  rentarCuadruple IS 'La llave foránea que viene de la tabla huesped';
COMMENT ON CONSTRAINT rentarCuadruple_habitacion_fkey  ON  rentarCuadruple IS 'La llave foránea que viene de la tabla
	cuadruple';


-------------------------------- Tabla rentarPenthouse --------------------------------


-- Creación de la tabla rentarPenthouse
CREATE TABLE rentarPenthouse (
    idPersona VARCHAR(20),    -- Identificador de la persona
    idHabitacion VARCHAR(20) -- Identificador de la habitación
);

-- Se agrega la restricción de clave externa para la tabla persona
ALTER TABLE rentarPenthouse ADD CONSTRAINT rentarPenthouse_persona_fkey 
FOREIGN KEY (idPersona) REFERENCES huesped (idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Se agrega la restricción de clave externa para la tabla habitacion
ALTER TABLE rentarPenthouse ADD CONSTRAINT rentarPenthouse_habitacion_fkey 
FOREIGN KEY (idHabitacion) REFERENCES penthouse (idHabitacion)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE rentarPenthouse ALTER COLUMN idPersona SET NOT NULL; -- Se agrega la restricción NOT NULL a la columna idPersona

---COMENTARIOS
COMMENT ON TABLE rentarPenthouse IS 'Tabla que contiene los identificadores de las tablas penthouse y huesped';
COMMENT ON COLUMN rentarPenthouse.idHabitacion IS 'Identificador de la habitación penthouse';
COMMENT ON COLUMN rentarPenthouse.idPersona IS 'Identificador del huésped';
COMMENT ON CONSTRAINT rentarPenthouse_persona_fkey    ON  rentarPenthouse IS 'La llave foránea que viene de la tabla huesped';
COMMENT ON CONSTRAINT rentarPenthouse_habitacion_fkey   ON  rentarPenthouse IS 'La llave foránea que viene de la tabla
	penthouse';


-------------------------------- Tabla realizarPago --------------------------------


-- Creación de la tabla realizarPago
CREATE TABLE realizarPago (
    idPersona VARCHAR(20), 				-- id del huésped
    nombre VARCHAR(100),			     -- Nombre del huésped
    paterno VARCHAR(100),    -- Apellido paterno del huésped
    materno VARCHAR(100),    -- Apellido materno del huésped
    fechaNacimiento DATE,     -- Fecha de nacimiento del huésped
    genero CHAR(1),          -- Género del huésped
    nacionalidad VARCHAR(50),          -- Nacionalidad del huésped
    idPago VARCHAR(20),           -- Identificador del pago
    NumeroNinos INT,              -- Número de niños en el pago
    NumeroAdultos INT,            -- Número de adultos en el pago
    NumeroMascotas INT,           -- Número de mascotas en el pago
    NumeroNoches INT             -- Número de noches en el pago
);


-- Referencial para la tabla huesped de persona
ALTER TABLE realizarPago ADD CONSTRAINT realizarPago_huesped_fkey
FOREIGN KEY (idPersona) REFERENCES huesped (idPersona)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencial para la tabla pago
ALTER TABLE realizarPago ADD CONSTRAINT realizarpago_pago_fkey
FOREIGN KEY (idPago) REFERENCES pago (idPago)
-- Mantenimiento de llave
ON DELETE CASCADE ON UPDATE CASCADE;

-- Restricciones NOT NULL para la tabla huesped
ALTER TABLE realizarPago ALTER COLUMN nombre SET NOT NULL;          -- Establece que el campo "nombre" no puede ser nulo.
ALTER TABLE realizarPago ALTER COLUMN paterno SET NOT NULL;         -- Establece que el campo "paterno" no puede ser nulo.
ALTER TABLE realizarPago ALTER COLUMN materno SET NOT NULL;         -- Establece que el campo "materno" no puede ser nulo.
ALTER TABLE realizarPago ALTER COLUMN fechaNacimiento SET NOT NULL; -- Establece que el campo "fechaNacimiento" no puede ser nulo.
ALTER TABLE realizarPago ALTER COLUMN genero SET NOT NULL;          -- Establece que el campo "genero" no puede ser nulo.

ALTER TABLE realizarPago ADD CONSTRAINT genero_valido
CHECK (genero IN ('M', 'H')); -- Restricción CHECK para asegurar que el género sea 'M' o 'H'

-- Restricciones para la tabla pago
ALTER TABLE realizarPago ALTER COLUMN idPago SET NOT NULL;       -- La columna idPago no puede ser NULL
ALTER TABLE realizarPago ALTER COLUMN NumeroNinos SET NOT NULL;  -- La columna NumeroNiños no puede ser NULL
ALTER TABLE realizarPago ALTER COLUMN NumeroAdultos SET NOT NULL;  -- La columna NumeroAdultos no puede ser NULL
ALTER TABLE realizarPago ALTER COLUMN NumeroMascotas SET NOT NULL;  -- La columna NumeroMascotas no puede ser NULL
ALTER TABLE realizarPago ALTER COLUMN NumeroNoches SET NOT NULL;  -- La columna NumeroNoches no puede ser NULL

ALTER TABLE realizarPago ADD CONSTRAINT NumeroNinos_check CHECK(NumeroNinos >= 0); -- Se asegura de que el número de niños solo reciba valores 
-- positivos o cero

ALTER TABLE realizarPago ADD CONSTRAINT NumeroAdultos_check CHECK(NumeroAdultos >= 0); -- Se asegura de que el número de adultos solo reciba valores 
-- positivos o cero

ALTER TABLE realizarPago ADD CONSTRAINT NumeroMascotas_check CHECK(NumeroMascotas >= 0); -- Se asegura de que el número de mascotas solo reciba valores 
-- positivos o cero

ALTER TABLE realizarPago ADD CONSTRAINT NumeroNoches_check CHECK(NumeroNoches >= 0); -- Se asegura de que el número de noches solo reciba valores 
-- positivos o cero

---COMENTARIOS
COMMENT ON TABLE realizarPago IS 'Tabla que contiene los datos de los pagos y los huéspedes';
COMMENT ON COLUMN realizarPago.idPersona IS 'Identificador del huésped';
COMMENT ON COLUMN realizarPago.nombre IS 'Nombre del huésped';
COMMENT ON COLUMN realizarPago.paterno IS 'Apellido paterno';
COMMENT ON COLUMN realizarPago.materno IS 'Apellido materno';
COMMENT ON COLUMN realizarPago.fechaNacimiento IS 'Fecha de Nacimiento';
COMMENT ON COLUMN realizarPago.genero IS 'Género';
COMMENT ON COLUMN realizarPago.nacionalidad IS 'Nacionalidad';
COMMENT ON COLUMN realizarPago.idPago IS 'Identificador del pago';
COMMENT ON COLUMN realizarPago.NumeroNinos IS 'Número de niños';
COMMENT ON COLUMN realizarPago.NumeroAdultos IS 'Número de adultos';
COMMENT ON COLUMN realizarPago.NumeroMascotas IS 'Número de mascotas';
COMMENT ON COLUMN realizarPago.NumeroNoches IS 'Número de noches';
COMMENT ON CONSTRAINT realizarPago_huesped_fkey    ON  realizarPago IS 'La llave foránea que viene de la tabla huesped';
COMMENT ON CONSTRAINT realizarpago_pago_fkey   ON  realizarPago IS 'La llave foránea que viene de la tabla
	pago';
COMMENT ON CONSTRAINT genero_valido ON realizarPago IS 'Restriccion CHECK para validar que el genero solo reciba
	M o H';
COMMENT ON CONSTRAINT NumeroNinos_check ON realizarPago IS 'Restriccion CHECK para validar que el número de niños
	introducido no sea negativo';
COMMENT ON CONSTRAINT NumeroAdultos_check ON realizarPago IS 'Restriccion CHECK para validar que el número de adultos
	introducido no sea negativo';
COMMENT ON CONSTRAINT NumeroMascotas_check ON realizarPago IS 'Restriccion CHECK para validar que el número de 
	mascotas introducido no sea negativo';
COMMENT ON CONSTRAINT NumeroNoches_check ON realizarPago IS 'Restriccion CHECK para validar que el número de noches
	introducido no sea negativo';




-------------------------------------- CORRECCIONES REALIZADAS A LO LARGO DEL TRABAJO --------------------------------------------------


-------------------------------------- Rename --------------------------------------------------
ALTER TABLE disponerIndividual
RENAME COLUMN idDisponerIndividual TO idHabitacion;

ALTER TABLE disponerDoble
RENAME COLUMN idDisponerDoble TO idHabitacion;

ALTER TABLE disponerCuadruple
RENAME COLUMN idDisponerCuadruple TO idHabitacion;

ALTER TABLE disponerPenthouse
RENAME COLUMN idDisponerPenthouse TO idHabitacion;

-- DROP CONSTRAINT Y CORRECIÓN A LLAVE FORÁNEA *era llave foránea :(* 
ALTER TABLE disponerIndividual
    DROP CONSTRAINT disponerIndividual_pkey,
	ADD CONSTRAINT disponerIndividual_habitacion_fkey FOREIGN KEY (idHabitacion) 
	REFERENCES individual (idHabitacion);

ALTER TABLE disponerDoble
    DROP CONSTRAINT disponerDoble_pkey,
	ADD CONSTRAINT disponerDoble_habitacion_fkey FOREIGN KEY (idHabitacion) 
	REFERENCES doble (idHabitacion);

ALTER TABLE disponerCuadruple
    DROP CONSTRAINT disponerCuadruple_pkey,
	ADD CONSTRAINT disponerCuadruple_habitacion_fkey FOREIGN KEY (idHabitacion) 
	REFERENCES cuadruple (idHabitacion);

ALTER TABLE disponerPenthouse
    DROP CONSTRAINT disponerPenthouse_pkey,
	ADD CONSTRAINT disponerPenthouse_habitacion_fkey FOREIGN KEY (idHabitacion) 
	REFERENCES penthouse (idHabitacion);

-------------------------------------- Drop idEmpleado ---------------------------------------------


ALTER TABLE personalDeApoyo
DROP COLUMN idEmpleado;

ALTER TABLE servicioComida
DROP COLUMN idEmpleado;

ALTER TABLE recepcionista
DROP COLUMN idEmpleado;

ALTER TABLE limpiezaInterna
DROP COLUMN idEmpleado;


----------------------------------- Modificación CONSTRAINT ------------------------------------------------


ALTER TABLE pago
    DROP CONSTRAINT NumeroNinos_check,
	ADD CONSTRAINT NumeroNinos_check CHECK(NumeroNinos >= 0);


ALTER TABLE pago
    DROP CONSTRAINT NumeroAdultos_check,
	ADD CONSTRAINT NumeroAdultos_check CHECK(NumeroAdultos >= 0);

ALTER TABLE pago
    DROP CONSTRAINT NumeroMascotas_check,
	ADD CONSTRAINT NumeroMascotas_check CHECK(NumeroMascotas >= 0);

ALTER TABLE pago
    DROP CONSTRAINT NumeroNoches_check,
	ADD CONSTRAINT NumeroNoches_check CHECK(NumeroNoches >= 0);
	
	
------------------------------ Borrar columna idPago de la tabla huesped -----------------
-- La columna no correspondía 


ALTER TABLE huesped DROP COLUMN idPago;

-- Se añaden comentarios para la llaves foráneas modificadas de las tablas: disponerDoble, disponerCuadruple
-- disponerPenthouse y disponerIndividual
COMMENT ON CONSTRAINT disponerPenthouse_habitacion_fkey ON disponerPenthouse IS 'La llave foránea que viene de la tabla
	penthouse';
COMMENT ON CONSTRAINT disponerDoble_habitacion_fkey ON disponerDoble IS 'La llave foránea que viene de la tabla
	doble';
COMMENT ON CONSTRAINT disponerCuadruple_habitacion_fkey ON disponerCuadruple IS 'La llave foránea que viene de la tabla
	cuadruple';
COMMENT ON CONSTRAINT disponerIndividual_habitacion_fkey ON disponerIndividual IS 'La llave foránea que viene de la tabla
	individual';


------------------------------ Borrar columna RFC de las habitaciones -----------------


-- La columna no correspondía luego de la correción de llaves
ALTER TABLE individual DROP COLUMN RFC;
ALTER TABLE doble DROP COLUMN RFC;
ALTER TABLE cuadruple DROP COLUMN RFC;
ALTER TABLE penthouse DROP COLUMN RFC;

---------------------Correción de CONSTRAINT en la tabla penthouse para el número de camas----------------
-- Se modificó para que pueda tener de una cama o más


ALTER TABLE penthouse
    DROP CONSTRAINT numeroDeCamas_penthouse,
	ADD CONSTRAINT numeroDeCamas_penthouse CHECK (numeroDeCamas > 0);
