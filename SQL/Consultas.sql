USE academia_db;

-- Consulta 1
SELECT nombres, apellidos, carrera_aspirada
FROM ESTUDIANTE
NATURAL JOIN MATRICULA
NATURAL JOIN CURSO
WHERE nombre_curso = 'Ciencias de la Salud'
  AND jornada = 'MATUTINA'
  AND estado_matricula = 'ACTIVA';

-- Consulta 2
SELECT nombres, apellidos
FROM ESTUDIANTE
NATURAL JOIN MATRICULA
WHERE estado_matricula = 'ACTIVA'
  AND id_estudiante NOT IN (SELECT id_estudiante FROM RESULTADO);

-- Consulta 3
SELECT nombres, apellidos
FROM ESTUDIANTE e
WHERE NOT EXISTS (
    SELECT * FROM SIMULACRO s
    WHERE NOT EXISTS (
        SELECT * FROM RESULTADO r
        WHERE r.id_estudiante = e.id_estudiante
          AND r.id_simulacro = s.id_simulacro));

-- Consulta 4
SELECT nombres, apellidos
FROM ESTUDIANTE
WHERE id_estudiante IN (SELECT id_estudiante FROM RESULTADO WHERE puntaje >= 750)
  AND id_estudiante IN (SELECT id_estudiante FROM MATRICULA NATURAL JOIN CURSO
                        WHERE jornada = 'MATUTINA' AND estado_matricula = 'ACTIVA');

-- Consulta 5
SELECT nombres, apellidos
FROM DOCENTE
NATURAL JOIN CURSO
WHERE nombre_curso = 'Ciencias de la Salud' AND jornada = 'MATUTINA'
UNION
SELECT nombres, apellidos
FROM ESTUDIANTE
NATURAL JOIN MATRICULA
NATURAL JOIN CURSO
WHERE nombre_curso = 'Ciencias de la Salud' AND jornada = 'MATUTINA'
  AND estado_matricula = 'ACTIVA';
