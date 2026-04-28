1- ¿Cuantos alumnos tien cada materia?

select materia.nombre, materia.ID_materia, count(*)
from materia
inner join alumno_materia am on am.ID_materia = materia.ID_materia
group by 2,1

2- ¿Cuantos alumnos tiene cada carrera? 

select carrera.nombre, carrera.ID_carrera, count(*)
from carrera
inner join alumno on alumno.ID_carrera = carrera.ID_carrera
group by 2,1

3- Que debemos modificar en la base de datos para poder guardar las notas.

alter table alumno, materia
add column nota varchar (10)

4- Trayectoria de alumno.

