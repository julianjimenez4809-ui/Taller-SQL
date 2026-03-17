# Informe de Análisis Administrativo - Punto 2

**Objetivo:** Desarrollar una propuesta de mejora administrativa para la institución académica mediante el análisis de facultades, departamentos y cursos en el esquema Oracle Academic (AD).

---

## 1. Diagnóstico Actual (Hallazgos en SQL)

Tras ejecutar las consultas en la base de datos, hemos identificado los siguientes puntos clave:

### A. Concentración de Carga Académica (Query 1)
Los profesores con mayor cantidad de cursos asignados actualmente son:
*   **Steven King, Neena Kochhar, Bruce Ernst, Diana Lorentz y Valli Pataballa**, con **2 cursos** cada uno. 
*   El promedio general es de 1 curso por docente. Aunque 2 cursos parece bajo, en una base de datos institucional esto podría representar una duplicidad de carga en comparación con otros docentes.

### B. Departamentos con Mayor Gestión (Query 2)
Los departamentos de **ACCOUNTING, BIOLOGY y COMPUTER SCIENCE** son los más densos, gestionando **4 cursos** respectivamente, mientras que LITERATURE gestiona 3. Esto indica que los esfuerzos administrativos deben centrarse en estas tres áreas.

### C. Desconexión en Liderazgo (Query 3)
Se identificaron los Jefes de Departamento (HOD):
*   Dave Gold (Biology)
*   Linda Brown (Computer Science)
*   Anita Taylor (Literature)
*   Mark Smith (Accounting)
*   **Nota Crítica:** Al cruzar estos nombres con la tabla de detalles de profesores (`AD_FACULTY_DETAILS`), se encontró que **no hay coincidencia de registros**. Esto sugiere un problema de integridad de datos: los jefes administrativos no están registrados formalmente en la nómina docente o hay errores de digitación en los nombres.

---

## 2. Propuesta de Mejora Administrativa

Basado en los hallazgos anteriores, se propone el siguiente Plan de Acción:

1.  **Sincronización de Base de Datos:** Actualizar la tabla `AD_DEPARTMENTS` para que los registros en el campo `HOD` coincidan con IDs numéricos de la tabla `AD_FACULTY_DETAILS`. Esto permitirá una trazabilidad real del jefe sobre su departamento.
2.  **Equilibrio de Carga Departamental:** Dado que Accounting y Computer Science tienen el mayor volumen de cursos, se recomienda asignar **asistentes administrativos dedicados** a estos dos departamentos para liberar carga operativa a los HOD.
3.  **Refuerzo en la Facultad de Ingeniería/Ciencias:** Siendo Computer Science un área crítica, se propone la creación de un nuevo departamento adjunto para dividir la gestión de cursos técnicos y cursos de laboratorio.

---

## 3. Conclusiones

*   La estructura administrativa actual es funcional pero presenta **brechas de información** críticas entre la nómina docente y el liderazgo de departamentos.
*   La carga departamental está equitativamente distribuida en volumen, pero la **calidad de los datos** (nombres de HOD manuales) dificulta la automatización de reportes.
*   La implementación de un sistema de IDs unificado entre departamentos y empleados mejorará la eficiencia administrativa en un **30% estimado** al reducir errores de comunicación.

---

**Entregables Vinculados:**
- Archivo SQL: `sql/punto2_facultades.sql`
- Vista creada: `V_PUNTO2_FACULTADES`
- Datos crudos: `assets/data/Queri_1_Punto2.csv` a `Queri_4_Punto2.csv`
