# Consultas en Relational

Archivos cargados: docente.csv, estudiante.csv, curso.csv, matricula.csv, simulacro.csv, resultado.csv

### Consulta 1
Estudiantes activos del curso de Ciencias de la Salud en la jornada matutina.
```
π nombres, apellidos, carrera_aspirada (σ nombre_curso == 'Ciencias de la Salud' and jornada == 'MATUTINA' and estado_matricula == 'ACTIVA' (estudiante ⋈ matricula ⋈ curso))
```
<img width="1568" height="426" alt="image" src="https://github.com/user-attachments/assets/0c3d8c8b-5558-4d58-9445-3508499872a7" />


### Consulta 2
Estudiantes activos que todavía no rinden ningún simulacro.
```
π nombres, apellidos ((π id_estudiante (σ estado_matricula == 'ACTIVA' (matricula)) - π id_estudiante (resultado)) ⋈ estudiante)
```
<img width="1568" height="450" alt="image" src="https://github.com/user-attachments/assets/107631c0-6b2d-4497-97ff-b402b01b0a12" />


### Consulta 3
Estudiantes que rindieron todos los simulacros.
```
π nombres, apellidos ((π id_estudiante, id_simulacro (resultado) ÷ π id_simulacro (simulacro)) ⋈ estudiante)
```
<img width="1568" height="479" alt="image" src="https://github.com/user-attachments/assets/917a5a88-36aa-4385-8892-f2b0abc49cf9" />


### Consulta 4
Estudiantes activos de la jornada matutina que sacaron 750 o más en algún simulacro.
```
π nombres, apellidos ((π id_estudiante (σ puntaje >= 750 (resultado)) ∩ π id_estudiante (σ jornada == 'MATUTINA' and estado_matricula == 'ACTIVA' (matricula ⋈ curso))) ⋈ estudiante)
```
<img width="1568" height="497" alt="image" src="https://github.com/user-attachments/assets/1395e192-48ee-473d-a960-9a3144344e15" />


### Consulta 5
Docente y estudiantes activos del curso de Ciencias de la Salud matutino en una sola lista.
```
π nombres, apellidos (σ nombre_curso == 'Ciencias de la Salud' and jornada == 'MATUTINA' (docente ⋈ curso)) ∪ π nombres, apellidos (σ nombre_curso == 'Ciencias de la Salud' and jornada == 'MATUTINA' and estado_matricula == 'ACTIVA' (estudiante ⋈ matricula ⋈ curso))
```
<img width="1568" height="512" alt="image" src="https://github.com/user-attachments/assets/a49d793f-0cef-4878-8d1c-9bcc18e14f5a" />

