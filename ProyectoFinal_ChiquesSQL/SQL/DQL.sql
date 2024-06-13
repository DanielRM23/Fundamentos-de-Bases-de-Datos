-- consulta 1:  Hoteles que sean petFriendly.
SELECT * FROM hotel 
WHERE petFriendly='SI';

-- Consulta 2: Habitaciones a cargo (idHabitacion) por miembro del personal de apoyo. La consulta está ordenada por apellido paterno.
SELECT p.idPersona, p.nombre, p.apellidoPaterno, p.apellidoMaterno, i.idHabitacion AS habitaciones_individuales_a_cargo, 
	d.idHabitacion AS habitaciones_dobles_a_cargo, cu.idHabitacion AS habitaciones_cuadruples_a_cargo, 
	pt.idHabitacion AS habitaciones_penthouse_a_cargo
FROM personalDeApoyo p
JOIN individual i ON p.idPersona = i.idPersona
JOIN doble d ON p.idPersona = d.idPersona
JOIN cuadruple cu ON p.idPersona = cu.idPersona
JOIN penthouse pt ON p.idPersona = pt.idPersona
GROUP BY p.idPersona, i.idHabitacion, d.idHabitacion, cu.idHabitacion, pt.idHabitacion
ORDER BY p.apellidoPaterno;

-- Consulta 3: Huéspedes que han reservado un evento más de una vez, ya que podemos interpretar de ello que son clientes a 
-- quienes les agradó el servicio y probablemente vuelvan a hacerlo.
SELECT h.*
FROM huesped h
JOIN evento e ON h.idPersona = e.idPersona
GROUP BY h.idPersona
HAVING COUNT(*) > 1;

-- Consulta 4: Empleados que cumplen años el mes próximo por orden de día (incluye el hotel en que trabajan).
SELECT idPersona, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, idHotel
FROM (
    SELECT idPersona, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, idHotel
    FROM recepcionista
    UNION ALL
    SELECT idPersona, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, idHotel
    FROM personalDeApoyo
    UNION ALL
    SELECT idPersona, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, idHotel
    FROM servicioComida
    UNION ALL
    SELECT idPersona, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, idHotel
    FROM limpiezaInterna
) AS empleados
WHERE EXTRACT(MONTH FROM fechaNacimiento) = 7
ORDER BY EXTRACT(DAY FROM fechaNacimiento);

-- Consulta 5: Muestra las nacionalidades de los huéspedes más recurrentes que visitan la cadena.
SELECT nacionalidad, COUNT(*) AS cantidad_huespedes
FROM huesped
GROUP BY nacionalidad
ORDER BY cantidad_huespedes DESC;

-- Consulta 6: Huéspedes con membresía que han rentado una habitación Penthouse y tienen su membresía activa.
SELECT h.*
FROM huesped h
JOIN membresia m ON h.idPersona = m.idPersona
JOIN rentarpenthouse r ON h.idPersona = r.idPersona
WHERE m.activa = 'SI';

-- Consulta 7: Los 20 empleados con mayor antiguedad y a qué hotel pertenecen (para darles un agradecimiento 
-- por su prolongada confianza).
SELECT e.*, h.nombreEstablecimiento
FROM (
    SELECT idPersona, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, idHotel, fechaContratacion
    FROM recepcionista
    UNION ALL
    SELECT idPersona, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, idHotel, fechaContratacion
    FROM personalDeApoyo
    UNION ALL
    SELECT idPersona, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, idHotel, fechaContratacion
    FROM servicioComida
    UNION ALL
    SELECT idPersona, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, idHotel, fechaContratacion
    FROM limpiezaInterna
) AS e
JOIN hotel h ON e.idHotel = h.idHotel
ORDER BY e.fechaContratacion ASC
LIMIT 20;

-- Consulta 8: Habitaciones con costo mayor a 4500 por tipo de habitacion.
SELECT idHabitacion, costopornoche
FROM (
    SELECT idHabitacion, costopornoche FROM doble
    UNION ALL
    SELECT idHabitacion, costopornoche FROM cuadruple
    UNION ALL
    SELECT idHabitacion, costopornoche FROM individual
    UNION ALL
    SELECT idHabitacion, costopornoche FROM penthouse
) AS habitaciones_costosas
WHERE costopornoche > 4500;

-- Consulta 9: Salones con capacidad mayor a 100 que han tenido eventos este año
SELECT s.*
FROM salon s
JOIN evento e ON s.idSalon = e.idSalon
WHERE s.capacidad > 100 AND EXTRACT(YEAR FROM e.fechaEvento) = EXTRACT(YEAR FROM CURRENT_DATE);

-- Consulta 10: Huespedes con alta probabilidad de volver a hospedarse que tengan mascotas.
SELECT h.idPersona, h.nombre, h.paterno, h.materno, r.numeroMascotas
FROM huesped h
JOIN realizarPago r ON h.idPersona = r.idPersona
JOIN encuesta en ON h.idPersona = en.idPersona
WHERE en.volverHospedar = 5 AND r.numeroMascotas > 0;

-- Consulta 11: La información de hoteles cuyo precio de habitación individual sea mayor a 250. Deberan ordenar la
-- información a partir del precio.

SELECT h.*, i.costoPorNoche
FROM hotel h
JOIN disponerIndividual di ON h.idHotel = di.idHotel
JOIN individual i ON di.idHabitacion = i.idHabitacion
WHERE i.costoPorNoche > 250
ORDER BY i.costoPorNoche;

-- Consulta 12: Huespedes con membresia que hayan organizado un evento entre las fechas 01 de junio del 2023 al 31 de
-- marzo del 2024 (el último año).

SELECT e.idPersona, h.nombre, h.paterno, h. materno FROM evento e
JOIN huesped h ON e.idPersona=h.idPersona
JOIN membresia mem ON h.idPersona=mem.idPersona
WHERE fechaEvento BETWEEN '2023-06-01' AND '2024-05-31' AND activa LIKE 'SI';

-- Consulta 13: Los recepcionistas y personal de comida que vivan en el mismo estado y que no se encuentren trabajando
-- en el mismo hotel.

SELECT DISTINCT r.idPersona, r.nombre, r.apellidoMaterno, r.apellidoPaterno, r.estado, r.idHotel,
	sc.idPersona, sc.nombre, sc.apellidoMaterno, sc.apellidoPaterno, sc.estado, sc.idHotel
FROM recepcionista r
JOIN servicioComida sc ON r.estado = sc.estado
WHERE r.idHotel != sc.idHotel;

-- Consulta 14: Huespedes con mascotas y que se hayan alojado en una habitación Penthouse.
SELECT DISTINCT h.idPersona, rph.idHabitacion, h.nombre, h.paterno, h.materno, rp.numeroMascotas
FROM huesped h
JOIN realizarPago rp ON h.idPersona = rp.idPersona
JOIN rentarPenthouse rph ON h.idPersona = rph.idPersona
WHERE rp.numeroMascotas > 0;


-- Consulta 15: El personal de limpieza y el personal de apoyo, que compartan estado y que se encuentren
-- trabajando en el mismo hotel. La información está ordenada a partir del estado.

SELECT DISTINCT l.idPersona AS ID_Limpieza, l.nombre AS Nombre_Limpieza, l.apellidoPaterno AS Apellido_Paterno_Limpieza, l.idHotel AS Hotel,
    a.idPersona AS ID_PersonalDeApoyo, a.nombre AS Nombre_PersonalDeApoyo, a.apellidoPaterno AS Apellido_Paterno_PersonalDeApoyo, l.estado
FROM limpiezaInterna l
JOIN personalDeApoyo a ON l.idHotel = a.idHotel AND l.estado = a.estado
ORDER BY l.apellidoPaterno;

-- Consulta extra: Personal de la cadena ordenado por hotel.
SELECT e.idHotel, e.nombre, e.apellidoPaterno, e.apellidoMaterno, e.Puesto
FROM (
    SELECT h.nombreEstablecimiento, p.nombre, p.apellidoPaterno, p.apellidoMaterno, p.idHotel, 'recepcionista' AS Puesto
    FROM hotel h
    JOIN recepcionista p ON h.idHotel = p.idHotel
    UNION ALL
    SELECT h.nombreEstablecimiento, p.nombre, p.apellidoPaterno, p.apellidoMaterno, p.idHotel, 'personalDeApoyo'
    FROM hotel h
    JOIN personalDeApoyo p ON h.idHotel = p.idHotel
    UNION ALL
    SELECT h.nombreEstablecimiento, p.nombre, p.apellidoPaterno, p.apellidoMaterno, p.idHotel, 'servicioComida'
    FROM hotel h
    JOIN servicioComida p ON h.idHotel = p.idHotel
    UNION ALL
    SELECT h.nombreEstablecimiento, p.nombre, p.apellidoPaterno, p.apellidoMaterno, p.idHotel, 'limpiezaInterna'
    FROM hotel h
    JOIN limpiezaInterna p ON h.idHotel = p.idHotel
) AS e
ORDER BY e.idHotel, e.apellidoPaterno, e.apellidoMaterno, e.nombre;
