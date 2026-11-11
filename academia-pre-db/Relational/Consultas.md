# Consultas en Relational

Archivos cargados: docente.csv, estudiante.csv, curso.csv, matricula.csv, simulacro.csv, resultado.csv

### Consulta 1
Estudiantes activos del curso de Ciencias de la Salud en la jornada matutina.
```
π nombres, apellidos, carrera_aspirada (σ nombre_curso == 'Ciencias de la Salud' and jornada == 'MATUTINA' and estado_matricula == 'ACTIVA' (estudiante ⋈ matricula ⋈ curso))
```
<img src="capturas/consulta1.png" width="800">

### Consulta 2
Estudiantes activos que todavía no rinden ningún simulacro.
```
π nombres, apellidos ((π id_estudiante (σ estado_matricula == 'ACTIVA' (matricula)) - π id_estudiante (resultado)) ⋈ estudiante)
```
<img src="capturas/consulta2.png" width="800">

### Consulta 3
Estudiantes que rindieron todos los simulacros.
```
π nombres, apellidos ((π id_estudiante, id_simulacro (resultado) ÷ π id_simulacro (simulacro)) ⋈ estudiante)
```
<img src="capturas/consulta3.png" width="800">

### Consulta 4
Estudiantes activos de la jornada matutina que sacaron 750 o más en algún simulacro.
```
π nombres, apellidos ((π id_estudiante (σ puntaje >= 750 (resultado)) ∩ π id_estudiante (σ jornada == 'MATUTINA' and estado_matricula == 'ACTIVA' (matricula ⋈ curso))) ⋈ estudiante)
```
<img src="capturas/consulta4.png" width="800">

### Consulta 5
Docente y estudiantes activos del curso de Ciencias de la Salud matutino en una sola lista.
```
π nombres, apellidos (σ nombre_curso == 'Ciencias de la Salud' and jornada == 'MATUTINA' (docente ⋈ curso)) ∪ π nombres, apellidos (σ nombre_curso == 'Ciencias de la Salud' and jornada == 'MATUTINA' and estado_matricula == 'ACTIVA' (estudiante ⋈ matricula ⋈ curso))
```
<img src="capturas/consulta5.png" width="800">
