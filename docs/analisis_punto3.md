# Análisis de Preparación y Consolidación de Temporada - Punto 3

**Objetivo:** Consolidar el panorama académico general reuniendo la información de años anteriores, cursos, departamentos y cuerpo docente, de cara a la nueva temporada académica. Asimismo, auditar la integridad de los datos para detectar información duplicada o faltante y diagnosticar las facultades que requieren fortalecimiento.

---

## 1. Consolidación de Resumen Histórico (Vista Única)

Para satisfacer el requerimiento directivo de "ver todo en una sola tabla", se creó la vista `V_PUNTO3_CONSOLIDADO`. 
Esta tabla permite cruzar rápidamente un periodo académico (`ACADEMIC_SESSION`) con los `DEPARTMENTS`, sus jefes de departamento (`HOD`), la asignatura impartida (`COURSE_NAME`), y el docente (`FACULTY_NAME`) a cargo.
Este modelo desnormalizado y consolidado será la fuente primaria para crear los Dashboards de la próxima temporada, eliminando la necesidad de buscar fragmentos en múltiples tablas maestras.

---

## 2. Auditoría de Integridad de Datos

### A. Detección de Información Faltante (Nulls)
Durante el análisis de calidad de los datos para la carga de temporada, descubrimos ciertas falencias:
* Existen asignaturas creadas que no poseen un departamento doliente asignado (`DEPARTMENT_ID IS NULL`).
* Esto causa vacíos institucionales al no haber un control sobre el plan de estudios.
* Algunos departamentos no cuentan con registros formales de **HOD** (Head of Department) en la tabla `AD_DEPARTMENTS`. Es indispensable actualizar los nulos antes del ingreso de nuevas matrículas.

### B. Detección de Registros Duplicados 
Se verificó la estructura de cursos por periodo académico:
* Al ejecutar el análisis de duplicidad (contando repeticiones del mismo `COURSE_NAME` y `SESSION_ID`), se audita constantemente que un curso no haya sido creado dos veces por error humano durante la apertura del año académico, manteniendo limpio el sistema contable y de registro.

---

## 3. Facultades y Áreas a Fortalecer

A través de la cuantificación de `COURSE_LEVELS` y oferta de asignaturas (`COURSE_NAME`) por cada Facultad/Departamento:

1. **Departamentos Secundarios o de Minoría:** Facultades con **1 o ningún curso** asociado deben ser sometidas a escrutinio. La baja oferta académica puede deberse a desinversión, por lo que es necesario fortalecer la plantilla docente o unificar la facultad con otra más fuerte.
2. Basado en el Punto 1 y 2 de nuestros analistas, los departamentos como "Accounting" o "Computer Science" tienen una carga superior a la media, mientras que ciertos departamentos de humanidades se ven relegados. Es vital **abrir nuevas materias** o reasignar presupuesto de facultades poco atractivas hacia los departamentos técnicos sobresaturados.

---

## 4. Conclusión para la Nueva Temporada

Para preparar a la universidad para la nueva carga estudiantil, la recomendación administrativa es enfática:
1. **Limpiar datos maestros:** Antes de habilitar el portal de inscripción, asignar obligatoriamente todos los **departamentos faltantes** a sus cursos y sus jefes, evitando inscripciones huérfanas.
2. **Refuerzo Proyeccional:** Redistribuir aulas y personal de soporte hacia las facultades que muestran un déficit de recursos respecto a su gran número de alumnos proyectados por asignatura.

---

**Entregables Vinculados:**
- Archivo SQL: `sql/punto3_preparacion.sql`
- Vista Consolidada: `V_PUNTO3_CONSOLIDADO`
- Datos de Referencia (CSVs): Exportados según indicaciones de plataforma.
