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
    FOREIGN KEY (ID_carrera) REFERENCES Carrera(ID_carrera)
);

CREATE TABLE Alumnos (
    ID_alumno INT PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT,
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
(1, 'Programación I', 1, '1°', 1),
(2, 'Base de Datos', 2, '2°', 1),
(3, 'Redes', 3, '3°', 1),
(4, 'Matemática', 4, '1°', 1),
(5, 'Contabilidad I', 5, '1°', 3),
(6, 'Administración General', 6, '1°', 2),
(7, 'Marketing', 7, '2°', 2),
(8, 'Diseño Digital', 8, '1°', 4),
(9, 'UX/UI', 9, '2°', 4),
(10, 'Economía', 10, '1°', 2);

-- =========================
-- DATOS: ALUMNOS
-- =========================

INSERT INTO Alumnos VALUES
(1, 'Lucas Díaz', 20, '30111222', 'lucas.diaz@mail.com', 1),
(2, 'Martina Ruiz', 22, '30222333', 'martina.ruiz@mail.com', 2),
(3, 'Santiago Gómez', 21, '30333444', 'santiago.gomez@mail.com', 1),
(4, 'Valentina López', 23, '30444555', 'valentina.lopez@mail.com', 3),
(5, 'Mateo Fernández', 19, '30555666', 'mateo.fernandez@mail.com', 1),
(6, 'Camila Torres', 24, '30666777', 'camila.torres@mail.com', 4),
(7, 'Benjamín Castro', 20, '30777888', 'benjamin.castro@mail.com', 2),
(8, 'Lucía Martínez', 22, '30888999', 'lucia.martinez@mail.com', 3),
(9, 'Thiago Morales', 21, '30999000', 'thiago.morales@mail.com', 1),
(10, 'Sofía Herrera', 23, '31000111', 'sofia.herrera@mail.com', 4),
(11, 'Joaquín Vega', 20, '31111222', 'joaquin.vega@mail.com', 2),
(12, 'Mía Romero', 21, '31222333', 'mia.romero@mail.com', 3),
(13, 'Franco Navarro', 22, '31333444', 'franco.navarro@mail.com', 1),
(14, 'Emma Suárez', 19, '31444555', 'emma.suarez@mail.com', 4),
(15, 'Tomás Rojas', 23, '31555666', 'tomas.rojas@mail.com', 2),
(16, 'Isabella Medina', 24, '31666777', 'isabella.medina@mail.com', 3),
(17, 'Agustín Silva', 21, '31777888', 'agustin.silva@mail.com', 1),
(18, 'Renata Ortiz', 22, '31888999', 'renata.ortiz@mail.com', 4),
(19, 'Facundo Cabrera', 20, '31999000', 'facundo.cabrera@mail.com', 2),
(20, 'Julieta Pereyra', 23, '32000111', 'julieta.pereyra@mail.com', 3),
(21, 'Bruno Acosta', 21, '32111222', 'bruno.acosta@mail.com', 1),
(22, 'Catalina Luna', 22, '32222333', 'catalina.luna@mail.com', 4),
(23, 'Ignacio Farias', 24, '32333444', 'ignacio.farias@mail.com', 2),
(24, 'Ariana Molina', 20, '32444555', 'ariana.molina@mail.com', 3);
