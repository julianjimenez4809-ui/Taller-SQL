# FORMATO DE ENTREGA (PARA EL INTEGRANTE C) 📤

Este documento sirve como puente para que el **Integrante C** pueda consolidar el trabajo de los puntos 1 y 2 en el informe final y la "Gran Tabla". Cada integrante (A y B) debe llenar su sección correspondiente.

---

## 🅰️ SECCIÓN INTEGRANTE A: Rendimiento Académico

### 1. Consultas SQL (Vistas)
*   **Nombre de la Vista:** `V_RENDIMIENTO_ESTUDIANTES`
*   **Código SQL:**
    ```sql
    -- Pegar el código de la vista aquí
    ```

### 2. Hallazgos Clave
*   **Materia con menor rendimiento:** [Nombre de la materia]
*   **Porcentaje de reprobación:** [%]
*   **Causa detectada:** [Ej: Falta de asistencia / Dificultad del examen]

### 3. Propuesta de Mejora (Resumen)
*   [Escribir aquí una idea para mejorar las notas de estos estudiantes]

---

## 🅱️ SECCIÓN INTEGRANTE B: Gestión de Facultades (TU SECCIÓN)

### 1. Consultas SQL (Vistas)
*   **Nombre de la Vista:** `V_ESTRUCTURA_FACULTADES`
*   **Código SQL:**
    ```sql
    -- Pegar el código de la vista aquí
    ```

### 2. Hallazgos Administrativos
*   **Facultad con más carga académica:** [Nombre de la facultad]
*   **Relación Curso/Departamento:** [Relación numérica X a Y]
*   **Necesidad detectada:** [Ej: Falta de directores de departamento]

### 3. Propuesta Administrativa (Resumen)
*   [Escribir aquí una idea para optimizar la gestión de las facultades]

---

## 🗺️ MAPA DE CONSOLIDACIÓN (Instrucciones para C)
Para unir estas dos secciones en una sola tabla, el Integrante C debe:
1.  Hacer un `JOIN` entre `V_RENDIMIENTO_ESTUDIANTES` y `V_ESTRUCTURA_FACULTADES` usando el campo `COURSE_ID` o `FACULTY_ID`.
2.  Identificar registros nulos (estudiantes sin facultad o facultades sin cursos) usando `IS NULL`.
3.  Generar las gráficas comparativas cruzando el rendimiento de los estudiantes con la facultad a la que pertenecen.

---

**Nota:** Una vez que A y B llenen este formato, el Integrante C tendrá todo el material listo para el Punto 3 y el reporte final en GitHub.
