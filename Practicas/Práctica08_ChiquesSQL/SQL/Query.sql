-- Deberan crear un script llamado Query.sql, el cual pondra las instrucciones para solucionar las siguientes
-- consultas:
-- i. Recepcionistas cuyo nombre empiece con la letra C.
SELECT * FROM recepcionista 
WHERE nombre LIKE 'C%';
-- ii. Clientes que hayan nacido en el mes de Junio.
SELECT * FROM huesped
WHERE EXTRACT(MONTH FROM fechaNacimiento) = 6;
-- iii. Eventos que hayan ocurrido entre el 1 de enero del 2024 y del 22 de abril del 2024.
SELECT * FROM Evento 
WHERE fechaEvento BETWEEN '2024-01-01' AND '2024-04-22';
-- iv. Hoteles que sean petFriendly.
SELECT * FROM hotel 
WHERE petFriendly='SI';
-- v. Todos los Clientes registrados en Hoteles Luna, que se hayan hospedado al menos 6 veces en el año. 
-- En esta consulta se aprovechó que los clientes responden una encuesta al concluir su estadia, así que se
-- contaron las visitas a través de la constestación.
SELECT idPersona, COUNT(*) AS visitas_en_el_anio
FROM encuesta
GROUP BY idPersona
HAVING COUNT(*) > 5;