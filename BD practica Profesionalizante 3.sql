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
(1, 'Juan Pérez', 20, '30111222', 'juan1@mail.com', 1),
(2, 'María Gómez', 22, '30222333', 'maria2@mail.com', 1),
(3, 'Pedro López', 21, '30333444', 'pedro3@mail.com', 1),
(4, 'Ana Torres', 23, '30444555', 'ana4@mail.com', 1),
(5, 'Lucas Díaz', 19, '30555666', 'lucas5@mail.com', 1),
(6, 'Sofía Ruiz', 24, '30666777', 'sofia6@mail.com', 1),
(7, 'Diego Castro', 20, '30777888', 'diego7@mail.com', 1),
(8, 'Valeria Romero', 22, '30888999', 'valeria8@mail.com', 1),
(9, 'Martín Silva', 21, '30999000', 'martin9@mail.com', 1),
(10, 'Lucía Herrera', 23, '31000111', 'lucia10@mail.com', 1),

(11, 'Jorge Ramos', 25, '31111222', 'jorge11@mail.com', 2),
(12, 'Camila Vega', 20, '31222333', 'camila12@mail.com', 2),
(13, 'Andrés Molina', 22, '31333444', 'andres13@mail.com', 2),
(14, 'Paula Ríos', 21, '31444555', 'paula14@mail.com', 2),
(15, 'Ricardo Flores', 23, '31555666', 'ricardo15@mail.com', 2),
(16, 'Elena Núñez', 24, '31666777', 'elena16@mail.com', 2),
(17, 'Gonzalo Paz', 22, '31777888', 'gonzalo17@mail.com', 2),
(18, 'Laura Acosta', 21, '31888999', 'laura18@mail.com', 2),
(19, 'Federico Luna', 23, '31999000', 'federico19@mail.com', 2),
(20, 'Carla Ortiz', 20, '32000111', 'carla20@mail.com', 2),

(21, 'Hugo Medina', 26, '32111222', 'hugo21@mail.com', 3),
(22, 'Natalia Ibarra', 22, '32222333', 'natalia22@mail.com', 3),
(23, 'Pablo Cabrera', 24, '32333444', 'pablo23@mail.com', 3),
(24, 'Rocío Soto', 23, '32444555', 'rocio24@mail.com', 3),
(25, 'Daniel Ponce', 25, '32555666', 'daniel25@mail.com', 3),
(26, 'Micaela Vidal', 21, '32666777', 'micaela26@mail.com', 3),
(27, 'Emiliano Campos', 22, '32777888', 'emiliano27@mail.com', 3),
(28, 'Julieta Farias', 23, '32888999', 'julieta28@mail.com', 3),
(29, 'Bruno Godoy', 24, '32999000', 'bruno29@mail.com', 3),
(30, 'Agustina Peralta', 22, '33000111', 'agus30@mail.com', 3),

(31, 'Kevin Suárez', 20, '33111222', 'kevin31@mail.com', 4),
(32, 'Florencia Vera', 21, '33222333', 'flor32@mail.com', 4),
(33, 'Tomás Quiroga', 22, '33333444', 'tomas33@mail.com', 4),
(34, 'Melina Roldán', 23, '33444555', 'melina34@mail.com', 4),
(35, 'Iván Benítez', 24, '33555666', 'ivan35@mail.com', 4),
(36, 'Daiana Leiva', 20, '33666777', 'daiana36@mail.com', 4),
(37, 'Franco Sosa', 22, '33777888', 'franco37@mail.com', 4),
(38, 'Noelia Giménez', 23, '33888999', 'noelia38@mail.com', 4),
(39, 'Sebastián Toledo', 21, '33999000', 'sebastian39@mail.com', 4),
(40, 'Romina Aguirre', 22, '34000111', 'romina40@mail.com', 4),

(41, 'Alan Rivas', 20, '34111222', 'alan41@mail.com', 1),
(42, 'Belén Cardozo', 21, '34222333', 'belen42@mail.com', 2),
(43, 'Cristian Ferreyra', 22, '34333444', 'cristian43@mail.com', 3),
(44, 'Débora Escobar', 23, '34444555', 'debora44@mail.com', 4),
(45, 'Ezequiel Navarro', 24, '34555666', 'eze45@mail.com', 1),
(46, 'Gabriela Méndez', 22, '34666777', 'gaby46@mail.com', 2),
(47, 'Hernán Salas', 23, '34777888', 'hernan47@mail.com', 3),
(48, 'Inés Cabrera', 21, '34888999', 'ines48@mail.com', 4),
(49, 'Julián Páez', 22, '34999000', 'julian49@mail.com', 1),
(50, 'Karina Villalba', 23, '35000111', 'karina50@mail.com', 2);

(51, 'Matías Ojeda', 21, '35111222', 'matias51@mail.com', 1),
(52, 'Carolina Paredes', 22, '35222333', 'caro52@mail.com', 2),
(53, 'Leonardo Funes', 23, '35333444', 'leo53@mail.com', 3),
(54, 'Silvina Rojas', 24, '35444555', 'silvina54@mail.com', 4),
(55, 'Pablo Giménez', 20, '35555666', 'pablo55@mail.com', 1),
(56, 'Juliana Vázquez', 22, '35666777', 'juliana56@mail.com', 2),
(57, 'Santiago Acuña', 21, '35777888', 'santi57@mail.com', 3),
(58, 'Daniela Cabrera', 23, '35888999', 'dani58@mail.com', 4),
(59, 'Nicolás Godoy', 24, '35999000', 'nico59@mail.com', 1),
(60, 'Florencia Barrios', 22, '36000111', 'flor60@mail.com', 2),

(61, 'Ramiro Quiroga', 23, '36111222', 'ramiro61@mail.com', 3),
(62, 'Verónica Sosa', 21, '36222333', 'vero62@mail.com', 4),
(63, 'Germán Medina', 22, '36333444', 'german63@mail.com', 1),
(64, 'Marina Castro', 23, '36444555', 'marina64@mail.com', 2),
(65, 'Lucas Herrera', 24, '36555666', 'lucas65@mail.com', 3),
(66, 'Agustina Molina', 20, '36666777', 'agus66@mail.com', 4),
(67, 'Iván Torres', 21, '36777888', 'ivan67@mail.com', 1),
(68, 'Paula Díaz', 22, '36888999', 'paula68@mail.com', 2),
(69, 'Federico Suárez', 23, '36999000', 'fede69@mail.com', 3),
(70, 'Romina López', 24, '37000111', 'romina70@mail.com', 4),

(71, 'Julián Ríos', 20, '37111222', 'julian71@mail.com', 1),
(72, 'Camila Flores', 21, '37222333', 'camila72@mail.com', 2),
(73, 'Tomás Vega', 22, '37333444', 'tomas73@mail.com', 3),
(74, 'Micaela Paz', 23, '37444555', 'mica74@mail.com', 4),
(75, 'Bruno Acosta', 24, '37555666', 'bruno75@mail.com', 1),
(76, 'Antonella Ramos', 22, '37666777', 'anto76@mail.com', 2),
(77, 'Ezequiel Luna', 23, '37777888', 'eze77@mail.com', 3),
(78, 'Lucía Ibarra', 21, '37888999', 'lucia78@mail.com', 4),
(79, 'Kevin Silva', 22, '37999000', 'kevin79@mail.com', 1),
(80, 'Noelia Roldán', 23, '38000111', 'noelia80@mail.com', 2),

(81, 'Franco Navarro', 24, '38111222', 'franco81@mail.com', 3),
(82, 'Daiana Peralta', 21, '38222333', 'daiana82@mail.com', 4),
(83, 'Cristian Cabrera', 22, '38333444', 'cristian83@mail.com', 1),
(84, 'Belén Ferreyra', 23, '38444555', 'belen84@mail.com', 2),
(85, 'Alan Soto', 20, '38555666', 'alan85@mail.com', 3),
(86, 'Melina Campos', 21, '38666777', 'melina86@mail.com', 4),
(87, 'Sebastián Ponce', 22, '38777888', 'sebastian87@mail.com', 1),
(88, 'Rocío Vidal', 23, '38888999', 'rocio88@mail.com', 2),
(89, 'Emiliano Farias', 24, '38999000', 'emiliano89@mail.com', 3),
(90, 'Agustina Godoy', 22, '39000111', 'agus90@mail.com', 4),

(91, 'Hernán Benítez', 23, '39111222', 'hernan91@mail.com', 1),
(92, 'Inés Leiva', 21, '39222333', 'ines92@mail.com', 2),
(93, 'Joaquín Sosa', 22, '39333444', 'joaquin93@mail.com', 3),
(94, 'Karen Giménez', 23, '39444555', 'karen94@mail.com', 4),
(95, 'Leandro Toledo', 24, '39555666', 'leandro95@mail.com', 1),
(96, 'Mariela Aguirre', 20, '39666777', 'mariela96@mail.com', 2),
(97, 'Néstor Rivas', 21, '39777888', 'nestor97@mail.com', 3),
(98, 'Olga Cardozo', 22, '39888999', 'olga98@mail.com', 4),
(99, 'Patricio Escobar', 23, '39999000', 'pato99@mail.com', 1),
(100, 'Raquel Navarro', 24, '40000111', 'raquel100@mail.com', 2);

(101, 'Sergio Méndez', 21, '40111222', 'sergio101@mail.com', 3),
(102, 'Tamara Salas', 22, '40222333', 'tamara102@mail.com', 4),
(103, 'Ulises Páez', 23, '40333444', 'ulises103@mail.com', 1),
(104, 'Vanesa Villalba', 24, '40444555', 'vanesa104@mail.com', 2),
(105, 'Walter Ojeda', 20, '40555666', 'walter105@mail.com', 3),
(106, 'Ximena Paredes', 22, '40666777', 'ximena106@mail.com', 4),
(107, 'Yamil Funes', 21, '40777888', 'yamil107@mail.com', 1),
(108, 'Zoe Rojas', 23, '40888999', 'zoe108@mail.com', 2),
(109, 'Adrián Giménez', 24, '40999000', 'adrian109@mail.com', 3),
(110, 'Bianca Vázquez', 22, '41000111', 'bianca110@mail.com', 4),

(111, 'Claudio Acuña', 23, '41111222', 'claudio111@mail.com', 1),
(112, 'Denise Cabrera', 21, '41222333', 'denise112@mail.com', 2),
(113, 'Esteban Godoy', 22, '41333444', 'esteban113@mail.com', 3),
(114, 'Fiorella Barrios', 23, '41444555', 'fiorella114@mail.com', 4),
(115, 'Gustavo Quiroga', 24, '41555666', 'gustavo115@mail.com', 1),
(116, 'Helena Sosa', 20, '41666777', 'helena116@mail.com', 2),
(117, 'Ignacio Medina', 21, '41777888', 'ignacio117@mail.com', 3),
(118, 'Jimena Castro', 22, 'jimena118@mail.com', 4),
(119, 'Kevin Herrera', 23, '41999000', 'kevin119@mail.com', 1),
(120, 'Lorena Molina', 24, '42000111', 'lorena120@mail.com', 2),

(121, 'Marcos Torres', 20, '42111222', 'marcos121@mail.com', 3),
(122, 'Natalia Díaz', 21, '42222333', 'natalia122@mail.com', 4),
(123, 'Oscar Suárez', 22, '42333444', 'oscar123@mail.com', 1),
(124, 'Paola López', 23, '42444555', 'paola124@mail.com', 2),
(125, 'Quique Ríos', 24, '42555666', 'quique125@mail.com', 3),
(126, 'Rita Flores', 22, '42666777', 'rita126@mail.com', 4),
(127, 'Simón Vega', 23, '42777888', 'simon127@mail.com', 1),
(128, 'Teresa Paz', 21, '42888999', 'teresa128@mail.com', 2),
(129, 'Uriel Acosta', 22, '42999000', 'uriel129@mail.com', 3),
(130, 'Valentín Ramos', 23, '43000111', 'valentin130@mail.com', 4),

(131, 'Walter Luna', 24, '43111222', 'walter131@mail.com', 1),
(132, 'Xenia Ibarra', 21, '43222333', 'xenia132@mail.com', 2),
(133, 'Yago Silva', 22, '43333444', 'yago133@mail.com', 3),
(134, 'Zulma Roldán', 23, '43444555', 'zulma134@mail.com', 4),
(135, 'Ariel Navarro', 20, '43555666', 'ariel135@mail.com', 1),
(136, 'Belinda Peralta', 21, '43666777', 'belinda136@mail.com', 2),
(137, 'César Cabrera', 22, '43777888', 'cesar137@mail.com', 3),
(138, 'Diana Ferreyra', 23, '43888999', 'diana138@mail.com', 4),
(139, 'Ernesto Soto', 24, '43999000', 'ernesto139@mail.com', 1),
(140, 'Fabiana Campos', 22, '44000111', 'fabiana140@mail.com', 2),

(141, 'Gabriel Ponce', 23, '44111222', 'gabriel141@mail.com', 3),
(142, 'Hilda Vidal', 21, '44222333', 'hilda142@mail.com', 4),
(143, 'Ismael Farias', 22, '44333444', 'ismael143@mail.com', 1),
(144, 'Julieta Godoy', 23, '44444555', 'julieta144@mail.com', 2),
(145, 'Kevin Benítez', 24, '44555666', 'kevin145@mail.com', 3),
(146, 'Lidia Leiva', 20, '44666777', 'lidia146@mail.com', 4),
(147, 'Manuel Sosa', 21, '44777888', 'manuel147@mail.com', 1),
(148, 'Nadia Giménez', 22, '44888999', 'nadia148@mail.com', 2),
(149, 'Omar Toledo', 23, '44999000', 'omar149@mail.com', 3),
(150, 'Patricia Aguirre', 24, '45000111', 'patricia150@mail.com', 4);

(151, 'Ricardo Núñez', 22, '45111222', 'ricardo151@mail.com', 1),
(152, 'Sandra Ortega', 23, '45222333', 'sandra152@mail.com', 2),
(153, 'Tomás Ponce', 24, '45333444', 'tomas153@mail.com', 3),
(154, 'Úrsula Rivas', 21, '45444555', 'ursula154@mail.com', 4),
(155, 'Víctor Salinas', 22, '45555666', 'victor155@mail.com', 1),
(156, 'Wanda Toledo', 23, '45666777', 'wanda156@mail.com', 2),
(157, 'Xavier Urrutia', 24, '45777888', 'xavier157@mail.com', 3),
(158, 'Yanina Valdez', 21, '45888999', 'yanina158@mail.com', 4),
(159, 'Zacarías Vera', 22, '45999000', 'zacarias159@mail.com', 1),
(160, 'Adela Zambrano', 23, '46000111', 'adela160@mail.com', 2),

(161, 'Bruno Alarcón', 24, '46111222', 'bruno161@mail.com', 3),
(162, 'Claudia Barrios', 21, '46222333', 'claudia162@mail.com', 4),
(163, 'Diego Cáceres', 22, '46333444', 'diego163@mail.com', 1),
(164, 'Elisa Delgado', 23, '46444555', 'elisa164@mail.com', 2),
(165, 'Facundo Escalante', 24, '46555666', 'facundo165@mail.com', 3),
(166, 'Graciela Farías', 21, '46666777', 'graciela166@mail.com', 4),
(167, 'Héctor Gutiérrez', 22, '46777888', 'hector167@mail.com', 1),
(168, 'Ivana Herrera', 23, '46888999', 'ivana168@mail.com', 2),
(169, 'Julián Iglesias', 24, '46999000', 'julian169@mail.com', 3),
(170, 'Karina Juárez', 21, '47000111', 'karina170@mail.com', 4),

(171, 'Leandro Koval', 22, '47111222', 'leandro171@mail.com', 1),
(172, 'María Lagos', 23, '47222333', 'maria172@mail.com', 2),
(173, 'Nicolás Mansilla', 24, '47333444', 'nico173@mail.com', 3),
(174, 'Olga Navarro', 21, '47444555', 'olga174@mail.com', 4),
(175, 'Pablo Ocampo', 22, '47555666', 'pablo175@mail.com', 1),
(176, 'Queralt Pérez', 23, '47666777', 'queralt176@mail.com', 2),
(177, 'Ramiro Quintana', 24, '47777888', 'ramiro177@mail.com', 3),
(178, 'Sofía Roldán', 21, '47888999', 'sofia178@mail.com', 4),
(179, 'Tobías Sánchez', 22, '47999000', 'tobias179@mail.com', 1),
(180, 'Ulises Tapia', 23, '48000111', 'ulises180@mail.com', 2),

(181, 'Valeria Uzal', 24, '48111222', 'valeria181@mail.com', 3),
(182, 'Walter Vargas', 21, '48222333', 'walter182@mail.com', 4),
(183, 'Ximena Wilchez', 22, '48333444', 'ximena183@mail.com', 1),
(184, 'Yamila Ximénez', 23, '48444555', 'yamila184@mail.com', 2),
(185, 'Zoe Yáñez', 24, '48555666', 'zoe185@mail.com', 3),
(186, 'Agustín Zárate', 21, '48666777', 'agustin186@mail.com', 4),
(187, 'Belén Aquino', 22, '48777888', 'belen187@mail.com', 1),
(188, 'Cristian Blanco', 23, '48888999', 'cristian188@mail.com', 2),
(189, 'Daniela Correa', 24, '48999000', 'daniela189@mail.com', 3),
(190, 'Esteban Domínguez', 21, '49000111', 'esteban190@mail.com', 4),

(191, 'Florencia Espíndola', 22, '49111222', 'florencia191@mail.com', 1),
(192, 'Gastón Figueroa', 23, '49222333', 'gaston192@mail.com', 2),
(193, 'Hernán Gallardo', 24, '49333444', 'hernan193@mail.com', 3),
(194, 'Ivana Hidalgo', 21, '49444555', 'ivana194@mail.com', 4),
(195, 'Jorge Ibarra', 22, '49555666', 'jorge195@mail.com', 1),
(196, 'Karen Juárez', 23, '49666777', 'karen196@mail.com', 2),
(197, 'Lucas Kranevitter', 24, '49777888', 'lucas197@mail.com', 3),
(198, 'Mariana Ledesma', 21, '49888999', 'mariana198@mail.com', 4),
(199, 'Nicolás Molina', 22, '49999000', 'nico199@mail.com', 1),
(200, 'Olivia Núñez', 23, '50000111', 'olivia200@mail.com', 2);

