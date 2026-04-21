1- ¿Cuántos alumnos tiene cada materia?

SELECT materia.nombre, materia.ID_materia, COUNT(*)
FROM Materia 
INNER JOIN Alumno_Materia am ON am.ID_materia = materia.ID_materia
GROUP BY 2,1;


2- ¿Cuántos alumnos tiene cada carrera?

select carrera.nombre, carrera.ID_carrera, count(*)
from carrera
inner join alumno on alumno.ID_carrera = carrera.ID_carrera
group by 2,1


3- que debemos modificar en la base de datos para poder guardar las notas.

ALTER TABLE alumno, materia 
ADD column nota varchar(10);


