# Plan de Trabajo: Colaboración A y B 🤝

Este documento define cómo el Integrante A y el Integrante B (tú) deben preparar el terreno para la entrega final al Integrante C.

## 🛠️ Paso 1: Diccionario de Datos Común
Para que el Integrante C pueda unir todo, debemos acordar usar estos campos como llaves:
*   `FACULTY_ID`: Para unir departamentos con facultades.
*   `STUDENT_ID`: Para unir notas con estudiantes.
*   `COURSE_ID`: El puente entre los estudiantes y las facultades.

## 📊 Paso 2: Tareas Específicas

### Integrante A (Estudiantes)
*   **SQL:** Crear una vista que muestre: `Nombre Estudiante | Carrera | Materia | Nota Final | Asistencia`.
*   **Análisis:** Identificar qué materias tienen el promedio más bajo.
*   **Gráfica sugerida:** Histograma de notas por materia.

### Integrante B (Facultades - TU ROL)
*   **SQL:** Crear una vista que muestre: `Nombre Facultad | Nombre Departamento | Cantidad de Cursos | Jefe de Departamento`.
*   **Análisis:** Identificar qué facultades están "saturadas" (muchos cursos pero pocos departamentos).
*   **Gráfica sugerida:** Diagrama de barras comparando cantidad de cursos por facultad.

## 📤 Paso 3: Entrega al Integrante C
Al terminar sus puntos, deben entregarle al Integrante C:
1.  **Archivos SQL:** Con las sentencias `CREATE OR REPLACE VIEW...`.
2.  **Resumen de Hallazgos:** Un párrafo breve con lo más importante que encontraron (ej: "La facultad de Artes tiene notas muy bajas").

## 📌 Recomendación Técnica
Intenten que sus consultas no tengan valores nulos. Si encuentran un nulo, usen la función `NVL(campo, 'Sin Información')` para que el Integrante C no tenga problemas al limpiar los datos.
