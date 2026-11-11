USE academia_db;

INSERT INTO DOCENTE VALUES
 (1, '1104567890', 'Carmen', 'Jaramillo', 'Matematica'),
 (2, '1103456789', 'Luis', 'Ordonez', 'Fisica'),
 (3, '1105678901', 'Patricia', 'Cueva', 'Biologia'),
 (4, '1102345678', 'Diego', 'Riofrio', 'Lenguaje'),
 (5, '1106789012', 'Andrea', 'Valdivieso', 'Razonamiento');

INSERT INTO ESTUDIANTE VALUES
 (1, '1150123456', 'Valentina', 'Torres', '2008-03-14', 'Medicina'),
 (2, '1150234567', 'Mateo', 'Castillo', '2007-11-02', 'Ingenieria Civil'),
 (3, '1150345678', 'Camila', 'Ojeda', '2008-06-21', 'Medicina'),
 (4, '1150456789', 'Sebastian', 'Pineda', '2008-01-30', 'Computacion'),
 (5, '1150567890', 'Daniela', 'Romero', '2007-09-09', 'Odontologia'),
 (6, '1150678901', 'Andres', 'Guerrero', '2007-12-17', 'Derecho'),
 (7, '1150789012', 'Sofia', 'Armijos', '2008-04-05', 'Enfermeria'),
 (8, '1150890123', 'Joel', 'Sarango', '2007-08-12', 'Economia');

INSERT INTO SIMULACRO VALUES
 (1, 'Diagnostico', '2026-09-19'),
 (2, 'Parcial 1', '2026-10-10'),
 (3, 'Parcial 2', '2026-10-31');

INSERT INTO CURSO VALUES
 (1, 'Ciencias de la Salud', 'MATUTINA', 450.00, 1),
 (2, 'Ciencias de la Salud', 'VESPERTINA', 450.00, 3),
 (3, 'Ingenierias', 'MATUTINA', 420.00, 2),
 (4, 'Ciencias Sociales', 'FIN_DE_SEMANA', 350.00, 4),
 (5, 'Ciencias Economicas', 'VESPERTINA', 350.00, 5);

INSERT INTO MATRICULA VALUES
 (1, 1, '2026-08-20', 'ACTIVA'),
 (2, 3, '2026-08-21', 'ACTIVA'),
 (3, 1, '2026-08-22', 'ACTIVA'),
 (4, 3, '2026-08-25', 'ACTIVA'),
 (5, 2, '2026-08-26', 'ACTIVA'),
 (6, 4, '2026-08-28', 'ACTIVA'),
 (7, 2, '2026-09-01', 'RETIRADA'),
 (8, 5, '2026-09-02', 'ACTIVA');

INSERT INTO RESULTADO VALUES
 (1, 1, 712), (1, 2, 768), (1, 3, 805),
 (2, 1, 690), (2, 2, 735), (2, 3, 781),
 (3, 1, 640), (3, 2, 702), (3, 3, 755),
 (4, 1, 598), (4, 2, 655),
 (5, 1, 720), (5, 2, 742), (5, 3, 790),
 (7, 1, 540);
