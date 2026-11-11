# 🎓 Base de datos para una academia preuniversitaria

## 📋 Datos Generales

| **Información** | **Detalle** |
|---|---|
| **Asignatura** | Base de Datos |
| **Ciclo** | 3 A |
| **Unidad** | 1 |
| **Docente** | Edwin René Guamán Quinche |
| **Fecha** | 11/11/2026 |
| **Estudiante** | Joaquín Moscol |
| **Universidad** | Universidad Nacional de Loja |
| **Facultad / Carrera** | FEIRNNR - Carrera de Computación |

**Resultado de aprendizaje de la unidad:**

Modela bases de datos de problemas reales, bajo los principios de solidaridad, responsabilidad, transparencia y honestidad.

---

## 1. 🎯 Título

**Base de datos para una academia preuniversitaria**

---

## 2. 📌 Contexto del Problema

En Loja hay academias que preparan a los chicos que salen del colegio para el examen de ingreso a la universidad. Tienen cursos por área (Salud, Ingenierías, Sociales, Económicas) en distintas jornadas, y durante el curso los estudiantes dan simulacros del examen para ver cómo van.

El problema es que las matrículas y las notas de los simulacros se llevan en cuadernos o en Excel, entonces cuesta saber quién está en cada curso, quién no ha dado los simulacros o cómo van sus puntajes. Esto le complica el trabajo a la secretaría y a los docentes, y los estudiantes no tienen un seguimiento claro.

Por eso se propone una base de datos que guarde los docentes, cursos, estudiantes, matrículas, simulacros y resultados en tablas relacionadas con claves primarias y foráneas.

---

## 3. 🎯 Objetivos

### 3.1. Objetivo General

Diseñar una base de datos relacional en MySQL para registrar los cursos, matrículas y resultados de simulacros de una academia preuniversitaria, para facilitar el seguimiento de los estudiantes.

### 3.2. Objetivos Específicos

1. Elaborar el modelo entidad-relación y el modelo relacional, definiendo entidades, atributos, relaciones y claves.

2. Crear la base de datos en SQL, insertar datos de prueba y resolver cinco consultas en álgebra relacional con su traducción a SQL.

---

## 4. 🗂️ Modelos Conceptuales de Bases de Datos

### 4.1. Modelo Entidad-Relación (E-R)

<p align="center">
  <img width="100%" src="Modelo%20entidad-relacion/er.png" alt="Diagrama Entidad-Relación" />
</p>

<p align="center">
  <strong>Figura 1.</strong> Diagrama Entidad-Relación de la academia preuniversitaria.
</p>

### 4.2. Modelo Relacional

<p align="center">
  <img width="1568" height="683" alt="image" src="https://github.com/user-attachments/assets/127beab5-15df-44bc-b810-a683cf5b9823" />

</p>

<p align="center">
  <strong>Figura 2.</strong> Modelo relacional de la academia preuniversitaria.
</p>

**Estructura de las tablas:**

- **DOCENTE** (`id_docente` PK, `cedula`, `nombres`, `apellidos`, `especialidad`)
- **ESTUDIANTE** (`id_estudiante` PK, `cedula`, `nombres`, `apellidos`, `fecha_nacimiento`, `carrera_aspirada`)
- **SIMULACRO** (`id_simulacro` PK, `nombre_simulacro`, `fecha_simulacro`)
- **CURSO** (`id_curso` PK, `nombre_curso`, `jornada`, `costo`, `id_docente` FK → DOCENTE)
- **MATRICULA** (`id_estudiante` PK, FK → ESTUDIANTE, `id_curso` PK, FK → CURSO, `fecha_matricula`, `estado_matricula`)
- **RESULTADO** (`id_estudiante` PK, FK → ESTUDIANTE, `id_simulacro` PK, FK → SIMULACRO, `puntaje`)

*Nota: PK = clave primaria; FK = clave foránea y la tabla a la que hace referencia.*

---

## 5. 💻 Código SQL

### 5.1. Creación de Tablas (DDL)

```sql
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
```

### 5.2. Inserción de Datos (DML)

Para ver los datos que se insertaron en cada tabla:

<p align="center">
  <a href="SQL/Inserts.sql">
    <img src="https://img.shields.io/badge/🗄️%20VER%20INSERCIÓN%20DE%20DATOS-00758F?style=for-the-badge&logo=mysql&logoColor=white" alt="Ver inserción de datos" />
  </a>
</p>

---

# 6. Consultas de Álgebra Relacional y SQL

## 6.1. Resumen de consultas

| N.º | Operador | Consulta |
|:---:|---|---|
| 1 | Selección (σ), Proyección (π) y Reunión natural (⋈) | Estudiantes activos del curso de Salud matutino. |
| 2 | Diferencia (−) | Estudiantes activos que no han dado ningún simulacro. |
| 3 | División (÷) | Estudiantes que dieron todos los simulacros. |
| 4 | Intersección (∩) | Estudiantes matutinos con 750 puntos o más. |
| 5 | Unión (∪) | Docente y estudiantes del curso de Salud matutino. |

---

## 6.2. Consulta 1: Selección, proyección y reunión natural (σ, π, ⋈)

**Descripción:** Mostrar los estudiantes con matrícula activa en el curso de Ciencias de la Salud de la jornada matutina, junto con la carrera a la que aspiran.

**Álgebra relacional:**

```text
π nombres, apellidos, carrera_aspirada (σ nombre_curso == 'Ciencias de la Salud' and jornada == 'MATUTINA' and estado_matricula == 'ACTIVA' (estudiante ⋈ matricula ⋈ curso))
```

<p align="center">
  <img width="840" src="Relational/capturas/consulta1.png" alt="Consulta 1 en Relational" />
</p>

* Figura 3. Resultado de la consulta 1 en Relational.

**Código SQL:**

```sql
SELECT nombres, apellidos, carrera_aspirada
FROM ESTUDIANTE
NATURAL JOIN MATRICULA
NATURAL JOIN CURSO
WHERE nombre_curso = 'Ciencias de la Salud'
  AND jornada = 'MATUTINA'
  AND estado_matricula = 'ACTIVA';
```

## 6.3. Consulta 2: Diferencia (−)

**Descripción:** Mostrar los estudiantes con matrícula activa que todavía no han dado ningún simulacro.

**Álgebra relacional:**

```text
π nombres, apellidos ((π id_estudiante (σ estado_matricula == 'ACTIVA' (matricula)) - π id_estudiante (resultado)) ⋈ estudiante)
```

<p align="center">
  <img width="840" src="Relational/capturas/consulta2.png" alt="Consulta 2 en Relational" />
</p>

* Figura 4. Resultado de la consulta 2 en Relational.

**Código SQL:**

```sql
SELECT nombres, apellidos
FROM ESTUDIANTE
NATURAL JOIN MATRICULA
WHERE estado_matricula = 'ACTIVA'
  AND id_estudiante NOT IN (SELECT id_estudiante FROM RESULTADO);
```

## 6.4. Consulta 3: División (÷)

**Descripción:** Mostrar los estudiantes que dieron todos los simulacros.

**Álgebra relacional:**

```text
π nombres, apellidos ((π id_estudiante, id_simulacro (resultado) ÷ π id_simulacro (simulacro)) ⋈ estudiante)
```

<p align="center">
  <img width="840" src="Relational/capturas/consulta3.png" alt="Consulta 3 en Relational" />
</p>

* Figura 5. Resultado de la consulta 3 en Relational.

**Código SQL:**

```sql
SELECT nombres, apellidos
FROM ESTUDIANTE e
WHERE NOT EXISTS (
    SELECT * FROM SIMULACRO s
    WHERE NOT EXISTS (
        SELECT * FROM RESULTADO r
        WHERE r.id_estudiante = e.id_estudiante
          AND r.id_simulacro = s.id_simulacro));
```

## 6.5. Consulta 4: Intersección (∩)

**Descripción:** Mostrar los estudiantes activos de la jornada matutina que sacaron 750 puntos o más en algún simulacro.

**Álgebra relacional:**

```text
π nombres, apellidos ((π id_estudiante (σ puntaje >= 750 (resultado)) ∩ π id_estudiante (σ jornada == 'MATUTINA' and estado_matricula == 'ACTIVA' (matricula ⋈ curso))) ⋈ estudiante)
```

<p align="center">
  <img width="840" src="Relational/capturas/consulta4.png" alt="Consulta 4 en Relational" />
</p>

* Figura 6. Resultado de la consulta 4 en Relational.

**Código SQL:**

```sql
SELECT nombres, apellidos
FROM ESTUDIANTE
WHERE id_estudiante IN (SELECT id_estudiante FROM RESULTADO WHERE puntaje >= 750)
  AND id_estudiante IN (SELECT id_estudiante FROM MATRICULA NATURAL JOIN CURSO
                        WHERE jornada = 'MATUTINA' AND estado_matricula = 'ACTIVA');
```

## 6.6. Consulta 5: Unión (∪)

**Descripción:** Mostrar en una sola lista a la docente y a los estudiantes activos del curso de Ciencias de la Salud de la jornada matutina.

**Álgebra relacional:**

```text
π nombres, apellidos (σ nombre_curso == 'Ciencias de la Salud' and jornada == 'MATUTINA' (docente ⋈ curso)) ∪ π nombres, apellidos (σ nombre_curso == 'Ciencias de la Salud' and jornada == 'MATUTINA' and estado_matricula == 'ACTIVA' (estudiante ⋈ matricula ⋈ curso))
```

<p align="center">
  <img width="840" src="Relational/capturas/consulta5.png" alt="Consulta 5 en Relational" />
</p>

* Figura 7. Resultado de la consulta 5 en Relational.

**Código SQL:**

```sql
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
```

---

# 7. Conclusiones

**Conclusión 1: Modelo entidad-relación y modelo relacional**

Hacer el diagrama entidad-relación me ayudó a ordenar cómo funciona la academia antes de pensar en las tablas. Lo más difícil fue definir las cardinalidades y darme cuenta de que la matrícula y los resultados de los simulacros son relaciones de muchos a muchos, por lo que cada una termina siendo una tabla con dos claves foráneas.

**Conclusión 2: Implementación de SQL**

Al escribir el código SQL vi para qué sirven las restricciones. Con las claves foráneas no se puede registrar una matrícula de un estudiante que no existe, y con `CHECK` no se puede guardar un puntaje mayor a 1000 o una jornada que no sea válida.

**Conclusión 3: Álgebra relacional**

El álgebra relacional sirvió para pensar primero qué datos necesitaba y después escribir el SQL. Con la herramienta Relational pude comprobar los resultados de cada consulta. Las que más me costaron fueron la división y la diferencia, pero también fueron las más útiles para saber qué estudiantes dieron todos los simulacros y cuáles no han dado ninguno.

---

# 8. Bibliografía

[1] R. Elmasri y S. B. Navathe, *Fundamentos de Sistemas de Bases de Datos*, 7.ª ed. Madrid, España: Pearson, 2016.

[2] Oracle, "MySQL 8.0 Reference Manual." [En línea]. Disponible: https://dev.mysql.com/doc/refman/8.0/en/. (Accedido: 11 de noviembre de 2026).

[3] S. Tomasi, "Relational." [En línea]. Disponible: https://ltworf.github.io/relational/. (Accedido: 11 de noviembre de 2026).

<p align="center">
  <a href="Relational">
    <img src="https://img.shields.io/badge/📊%20DATOS%20CSV%20DEL%20PROYECTO-00758F?style=for-the-badge&logo=github&logoColor=white" alt="Datos CSV" />
  </a>
  <a href="Informe_U1.pdf">
    <img src="https://img.shields.io/badge/📄%20INFORME%20PDF-B22222?style=for-the-badge&logo=adobeacrobatreader&logoColor=white" alt="Informe PDF" />
  </a>
</p>
