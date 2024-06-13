
-- El personal de limpieza y el personal de apoyo, que compartan el apellido paterno y que se encuentren
-- trabajando en el mismo hotel. Deberan ordenar la información a partir del apellido paterno.

SELECT DISTINCT l.idPersona AS ID_Limpieza, l.nombre, l.apellidoPaterno AS Apellido_Paterno, l.idHotel AS Hotel,
	a.idPersona AS ID_PersonalDeApoyo, a.nombre, a.apellidoPaterno AS Apellido_Paterno
FROM limpiezaInterna l
JOIN personalDeApoyo a ON l.apellidoPaterno = a.apellidoPaterno AND l.idHotel = a.idHotel
ORDER BY l.apellidoPaterno;

-- La información de hoteles cuyo precio de habitación individual sea mayor a 2500. Deberan ordenar la
-- información a partir del precio.

SELECT h.*, i.costoPorNoche
FROM hotel h
JOIN disponerIndividual di ON h.idHotel = di.idHotel
JOIN individual i ON di.idHabitacion = i.idHabitacion
WHERE i.costoPorNoche > 2500
ORDER BY i.costoPorNoche;

-- Huespedes con membresia que hayan organizado un evento entre las fechas 6 de mayo del 2024 al 13 de
-- junio del 2024.

SELECT e.idPersona, h.nombre, h.paterno, h. materno FROM evento e
JOIN huesped h ON e.idPersona=h.idPersona
JOIN membresia mem ON h.idPersona=mem.idPersona
WHERE fechaEvento BETWEEN '2024-05-06' AND '2024-06-13' AND activa LIKE 'SI';

-- Los recepcionistas y personal de comida que vivan en el mismo estado y que no se encuentren trabajando
-- en el mismo hotel.

SELECT DISTINCT r.idPersona, r.nombre, r.apellidoMaterno, r.apellidoPaterno, r.estado, r.idHotel,
	sc.idPersona, sc.nombre, sc.apellidoMaterno, sc.apellidoPaterno, sc.estado, sc.idHotel
FROM recepcionista r
JOIN servicioComida sc ON r.estado = sc.estado
WHERE r.idHotel != sc.idHotel;


-- Huespedes con mascotas y que esten alojados en una habitación Penthouse.
SELECT DISTINCT h.idPersona, rph.idHabitacion, h.nombre, h.paterno, h.materno, rp.numeroMascotas
FROM huesped h
JOIN realizarPago rp ON h.idPersona = rp.idPersona
JOIN rentarPenthouse rph ON h.idPersona = rph.idPersona
WHERE rp.numeroMascotas > 0;

