CREATE DATABASE academia_db;
USE academia_db;

CREATE TABLE DOCENTE (
    id_docente INT NOT NULL,
    cedula VARCHAR(10) NOT NULL UNIQUE,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_docente)
);

CREATE TABLE ESTUDIANTE (
    id_estudiante INT NOT NULL,
    cedula VARCHAR(10) NOT NULL UNIQUE,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    carrera_aspirada VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_estudiante)
);

CREATE TABLE SIMULACRO (
    id_simulacro INT NOT NULL,
    nombre_simulacro VARCHAR(50) NOT NULL,
    fecha_simulacro DATE NOT NULL,
    PRIMARY KEY (id_simulacro)
);

CREATE TABLE CURSO (
    id_curso INT NOT NULL,
    nombre_curso VARCHAR(50) NOT NULL,
    jornada VARCHAR(15) NOT NULL CHECK (jornada IN ('MATUTINA', 'VESPERTINA', 'FIN_DE_SEMANA')),
    costo DECIMAL(6,2) NOT NULL CHECK (costo > 0),
    id_docente INT NOT NULL,
    PRIMARY KEY (id_curso),
    FOREIGN KEY (id_docente) REFERENCES DOCENTE(id_docente)
);

CREATE TABLE MATRICULA (
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    fecha_matricula DATE NOT NULL,
    estado_matricula VARCHAR(10) NOT NULL DEFAULT 'ACTIVA' CHECK (estado_matricula IN ('ACTIVA', 'RETIRADA')),
    PRIMARY KEY (id_estudiante, id_curso),
    FOREIGN KEY (id_estudiante) REFERENCES ESTUDIANTE(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES CURSO(id_curso)
);

CREATE TABLE RESULTADO (
    id_estudiante INT NOT NULL,
    id_simulacro INT NOT NULL,
    puntaje INT NOT NULL CHECK (puntaje BETWEEN 0 AND 1000),
    PRIMARY KEY (id_estudiante, id_simulacro),
    FOREIGN KEY (id_estudiante) REFERENCES ESTUDIANTE(id_estudiante),
    FOREIGN KEY (id_simulacro) REFERENCES SIMULACRO(id_simulacro)
);
