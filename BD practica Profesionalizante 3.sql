-- CREACIÓN DE TABLAS

CREATE TABLE Carrera (
    ID_carrera INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Profesor (
    ID_profesor INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Materia (
    ID_materia INT PRIMARY KEY,
    nombre VARCHAR(100),
    ID_profesor INT,
    curso VARCHAR(10),
    ID_carrera INT,
    FOREIGN KEY (ID_profesor) REFERENCES Profesor(ID_profesor),
    FOREIGN KEY (ID_carrera) REFERENCES Carrera(ID_carrera),
    Nota_aprobacion VARCHAR(50)
);

CREATE TABLE Alumnos (
    ID_alumno INT PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT,
    Fecha_Nacimiento VARCHAR(50),
    DNI VARCHAR(20) UNIQUE,
    email VARCHAR(100),
    ID_carrera INT,
    FOREIGN KEY (ID_carrera) REFERENCES Carrera(ID_carrera)
);

-- =========================
-- DATOS: CARRERAS
-- =========================

INSERT INTO Carrera VALUES
(1, 'Ingeniería en Sistemas'),
(2, 'Licenciatura en Administración'),
(3, 'Contador Público'),
(4, 'Diseño Gráfico');

-- =========================
-- DATOS: PROFESORES
-- =========================

INSERT INTO Profesor VALUES
(1, 'Juan Pérez', 'juan.perez@uni.edu'),
(2, 'María Gómez', 'maria.gomez@uni.edu'),
(3, 'Carlos López', 'carlos.lopez@uni.edu'),
(4, 'Ana Martínez', 'ana.martinez@uni.edu'),
(5, 'Luis Fernández', 'luis.fernandez@uni.edu'),
(6, 'Sofía Ramírez', 'sofia.ramirez@uni.edu'),
(7, 'Diego Torres', 'diego.torres@uni.edu'),
(8, 'Valeria Castro', 'valeria.castro@uni.edu'),
(9, 'Javier Morales', 'javier.morales@uni.edu'),
(10, 'Lucía Herrera', 'lucia.herrera@uni.edu');

-- =========================
-- DATOS: MATERIAS
-- =========================

INSERT INTO Materia VALUES
(1, 'Programación I', 1, '1°', 1, '6'),
(2, 'Base de Datos', 2, '2°', 1, '6'),
(3, 'Redes', 3, '3°', 1, '6'),
(4, 'Matemática', 4, '1°', 1, '6'),
(5, 'Contabilidad I', 5, '1°', 3, '6'),
(6, 'Administración General', 6, '1°', 2, '6'),
(7, 'Marketing', 7, '2°', 2, '6'),
(8, 'Diseño Digital', 8, '1°', 4, '6'),
(9, 'UX/UI', 9, '2°', 4, '6'),
(10, 'Economía', 10, '1°', 2, '6');


-- =========================
-- DATOS: ALUMNOS
-- =========================

INSERT INTO Alumnos VALUES
(1, 'Juan Pérez', 20, '2006-05-12', '30111222', 'juan1@mail.com', 1),
(2, 'María Gómez', 22, '2004-03-18', '30222333', 'maria2@mail.com', 1),
(3, 'Pedro López', 21, '2005-07-21', '30333444', 'pedro3@mail.com', 1),
(4, 'Ana Torres', 23, '2003-01-10', '30444555', 'ana4@mail.com', 1),
(5, 'Lucas Díaz', 19, '2007-09-30', '30555666', 'lucas5@mail.com', 1),
(6, 'Sofía Ruiz', 24, '2002-11-25', '30666777', 'sofia6@mail.com', 1),
(7, 'Diego Castro', 20, '2006-02-14', '30777888', 'diego7@mail.com', 1),
(8, 'Valeria Romero', 22, '2004-06-08', '30888999', 'valeria8@mail.com', 1),
(9, 'Martín Silva', 21, '2005-04-19', '30999000', 'martin9@mail.com', 1),
(10, 'Lucía Herrera', 23, '2003-08-11', '31000111', 'lucia10@mail.com', 1),

(11, 'Jorge Ramos', 25, '2001-12-02', '31111222', 'jorge11@mail.com', 2),
(12, 'Camila Vega', 20, '2006-07-17', '31222333', 'camila12@mail.com', 2),
(13, 'Andrés Molina', 22, '2004-09-05', '31333444', 'andres13@mail.com', 2),
(14, 'Paula Ríos', 21, '2005-01-28', '31444555', 'paula14@mail.com', 2),
(15, 'Ricardo Flores', 23, '2003-03-03', '31555666', 'ricardo15@mail.com', 2),
(16, 'Elena Núñez', 24, '2002-10-22', '31666777', 'elena16@mail.com', 2),
(17, 'Gonzalo Paz', 22, '2004-12-14', '31777888', 'gonzalo17@mail.com', 2),
(18, 'Laura Acosta', 21, '2005-06-09', '31888999', 'laura18@mail.com', 2),
(19, 'Federico Luna', 23, '2003-02-27', '31999000', 'federico19@mail.com', 2),
(20, 'Carla Ortiz', 20, '2006-08-16', '32000111', 'carla20@mail.com', 2),

(21, 'Hugo Medina', 26, '2000-04-01', '32111222', 'hugo21@mail.com', 3),
(22, 'Natalia Ibarra', 22, '2004-05-20', '32222333', 'natalia22@mail.com', 3),
(23, 'Pablo Cabrera', 24, '2002-07-07', '32333444', 'pablo23@mail.com', 3),
(24, 'Rocío Soto', 23, '2003-11-13', '32444555', 'rocio24@mail.com', 3),
(25, 'Daniel Ponce', 25, '2001-09-29', '32555666', 'daniel25@mail.com', 3),
(26, 'Micaela Vidal', 21, '2005-03-15', '32666777', 'micaela26@mail.com', 3),
(27, 'Emiliano Campos', 22, '2004-01-04', '32777888', 'emiliano27@mail.com', 3),
(28, 'Julieta Farias', 23, '2003-06-26', '32888999', 'julieta28@mail.com', 3),
(29, 'Bruno Godoy', 24, '2002-12-12', '32999000', 'bruno29@mail.com', 3),
(30, 'Agustina Peralta', 22, '2004-10-30', '33000111', 'agus30@mail.com', 3),

(31, 'Kevin Suárez', 20, '2006-02-01', '33111222', 'kevin31@mail.com', 4),
(32, 'Florencia Vera', 21, '2005-05-18', '33222333', 'flor32@mail.com', 4),
(33, 'Tomás Quiroga', 22, '2004-07-23', '33333444', 'tomas33@mail.com', 4),
(34, 'Melina Roldán', 23, '2003-03-09', '33444555', 'melina34@mail.com', 4),
(35, 'Iván Benítez', 24, '2002-08-27', '33555666', 'ivan35@mail.com', 4),
(36, 'Daiana Leiva', 20, '2006-11-11', '33666777', 'daiana36@mail.com', 4),
(37, 'Franco Sosa', 22, '2004-04-14', '33777888', 'franco37@mail.com', 4),
(38, 'Noelia Giménez', 23, '2003-09-02', '33888999', 'noelia38@mail.com', 4),
(39, 'Sebastián Toledo', 21, '2005-12-19', '33999000', 'sebastian39@mail.com', 4),
(40, 'Romina Aguirre', 22, '2004-06-30', '34000111', 'romina40@mail.com', 4),

(41, 'Alan Rivas', 20, '2006-03-08', '34111222', 'alan41@mail.com', 1),
(42, 'Belén Cardozo', 21, '2005-08-21', '34222333', 'belen42@mail.com', 2),
(43, 'Cristian Ferreyra', 22, '2004-01-15', '34333444', 'cristian43@mail.com', 3),
(44, 'Débora Escobar', 23, '2003-05-05', '34444555', 'debora44@mail.com', 4),
(45, 'Ezequiel Navarro', 24, '2002-10-18', '34555666', 'eze45@mail.com', 1),
(46, 'Gabriela Méndez', 22, '2004-02-28', '34666777', 'gaby46@mail.com', 2),
(47, 'Hernán Salas', 23, '2003-07-07', '34777888', 'hernan47@mail.com', 3),
(48, 'Inés Cabrera', 21, '2005-09-25', '34888999', 'ines48@mail.com', 4),
(49, 'Julián Páez', 22, '2004-11-12', '34999000', 'julian49@mail.com', 1),
(50, 'Karina Villalba', 23, '2003-04-17', '35000111', 'karina50@mail.com', 2);
