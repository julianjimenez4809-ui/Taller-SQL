# 📊 Análisis de Rendimiento Académico - Punto 1

**Responsable:** Julian Duarte (Líder de Datos)  
**Enfoque:** Evaluación del desempeño estudiantil y factores de éxito.

---

## 🧐 1. Introducción
El presente informe detalla el análisis del rendimiento académico de los estudiantes, basándose en la integración de datos de notas, asistencia y estructura de departamentos (carreras).

## 🛠️ 2. Metodología SQL
Se ha desarrollado un conjunto de consultas enfocadas en:
1.  **Extracción base:** Datos personales y registro de estudiantes.
2.  **Integración:** Relación entre estudiantes, cursos y sus calificaciones finales.
3.  **Evaluación:** Desempeño detallado en tipos de exámenes.
4.  **Consolidación:** Creación de la vista `VIEW_RENDIMIENTO_ACADEMICO`.

---

## 📈 3. Análisis de Hallazgos

### 🚨 3.1. Materias con Mayor Dificultad
Utilizando la consulta de promedios por curso, se identifican las asignaturas que requieren mayor atención pedagógica. 
*(Nota: Espacio para insertar el nombre de las asignaturas con promedios bajos una vez ejecutadas las queries)*.

### 📉 3.2. Relación Asistencia vs. Rendimiento
Se ha implementado el uso de `NVL` para el manejo de datos nulos en asistencia, asegurando que la limpieza de datos sea óptima para el análisis del Integrante C. Se observa que aquellos estudiantes con "Sin Información" en asistencia tienden a... *(Completar tras revisión de datos)*.

---

## 📉 4. Visualización Sugerida
Para la entrega final, se añadirá un **Histograma de Notas por Materia** en la carpeta `/assets/graficas/`, el cual permitirá visualizar la distribución de estudiantes que aprueban o reprueban cada asignatura.

---

## 📌 5. Conclusiones para el Integrante C
*   **Llave de unión:** `STUDENT_ID`.
*   **Calidad de datos:** Las calificaciones están normalizadas. Se recomienda verificar si existen duplicados en `AD_STUDENT_COURSE_DETAILS` antes de la consolidación final.
