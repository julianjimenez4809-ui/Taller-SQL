/* 
    Taller SQL - Punto 1: Análisis de Rendimiento Académico
    Responsable: Julian Duarte (Líder de Datos)
    Objetivo: Consultar detalles de estudiantes, notas y asistencia.
*/

-- 1. Consulta de detalles de estudiantes
-- Muestra la información básica de todos los estudiantes registrados.
SELECT 
    student_id, 
    first_name, 
    last_name, 
    parent_id, 
    registration_date, 
    email 
FROM AD_STUDENT_DETAILS;

-- 2. Consulta de notas por curso
-- Relaciona a los estudiantes con sus respectivos cursos y calificaciones finales.
SELECT 
    s.student_id, 
    s.first_name || ' ' || s.last_name AS student_full_name, 
    c.course_name, 
    sc.marks_obtained AS final_grade
FROM AD_STUDENT_DETAILS s
JOIN AD_STUDENT_COURSE_DETAILS sc ON s.student_id = sc.student_id
JOIN AD_COURSE_DETAILS c ON sc.course_id = c.course_id;

-- 3. Resultados de exámenes
-- Muestra el desempeño de los estudiantes en los diferentes tipos de exámenes.
SELECT 
    s.first_name || ' ' || s.last_name AS student_full_name, 
    er.exam_id, 
    er.marks AS exam_score, 
    et.exam_type_name
FROM AD_STUDENT_DETAILS s
JOIN AD_EXAM_RESULTS er ON s.student_id = er.student_id
JOIN AD_EXAM_DETAILS ed ON er.exam_id = ed.exam_id
JOIN AD_EXAM_TYPE et ON ed.exam_type_id = et.exam_type_id;

-- 4. CREACIÓN DE LA VISTA (Requerimiento Principal)
-- Estructura: Nombre Estudiante | Carrera | Materia | Nota Final | Asistencia
CREATE OR REPLACE VIEW VIEW_RENDIMIENTO_ACADEMICO AS
SELECT 
    s.first_name || ' ' || s.last_name AS "Nombre Estudiante",
    d.department_name AS "Carrera",
    c.course_name AS "Materia",
    sc.marks_obtained AS "Nota Final",
    NVL(TO_CHAR(sa.attendance_percentage), 'Sin Información') AS "Asistencia"
FROM AD_STUDENT_DETAILS s
JOIN AD_STUDENT_COURSE_DETAILS sc ON s.student_id = sc.student_id
JOIN AD_COURSE_DETAILS c ON sc.course_id = c.course_id
JOIN AD_DEPARTMENTS d ON c.department_id = d.department_id
LEFT JOIN AD_STUDENT_ATTENDANCE sa ON s.student_id = sa.student_id;

-- 5. Análisis: Materias con promedio más bajo
-- Ayuda a identificar las materias que presentan mayor dificultad.
SELECT 
    c.course_name, 
    ROUND(AVG(sc.marks_obtained), 2) AS average_grade
FROM AD_COURSE_DETAILS c
JOIN AD_STUDENT_COURSE_DETAILS sc ON c.course_id = sc.course_id
GROUP BY c.course_name
ORDER BY average_grade ASC;
