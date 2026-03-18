/* 
    ==========================================================
    TALLER SQL: PUNTO 1 - ANÁLISIS DE RENDIMIENTO ACADÉMICO
    RESPONSABLE: Julian Duarte (Líder de Datos)
    CONTENIDO: 5 Consultas de Análisis (Verificadas)
    ==========================================================
*/

-- 1. DETALLE DE ESTUDIANTES
-- Muestra la información básica y de contacto de los alumnos.
SELECT 
    student_id, 
    first_name, 
    parent_id, 
    student_reg_year, 
    email_addr 
FROM AD.AD_STUDENT_DETAILS;

-- 2. RELACIÓN ESTUDIANTES Y MATERIAS
-- Cruza la tabla de cursos con la de inscripciones para ver la carga académica.
SELECT 
    s.student_id, 
    s.first_name AS student_name, 
    c.course_name, 
    c.session_id
FROM AD.AD_STUDENT_DETAILS s
JOIN AD.AD_STUDENT_COURSE_DETAILS sc ON s.student_id = sc.student_id
JOIN AD.AD_COURSE_DETAILS c ON sc.course_id = c.course_id;

-- 3. RENDIMIENTO EN EXÁMENES (POR TIPO)
-- Unión corregida usando EXAM_TYPE (VARCHAR2) según export(3).csv
SELECT 
    s.first_name AS student_name, 
    er.marks AS calificacion, 
    et.exam_name AS tipo_examen,
    ed.name AS nombre_del_examen
FROM AD.AD_STUDENT_DETAILS s
JOIN AD.AD_EXAM_RESULTS er ON s.student_id = er.student_id
JOIN AD.AD_EXAM_DETAILS ed ON er.exam_id = ed.exam_id
JOIN AD.AD_EXAM_TYPE et ON ed.exam_type = et.exam_type;

-- 4. CONSULTA CONSOLIDADA (PUNTO 1 RECEPTOR)
-- NOTA: Se eliminó COURSE_ID de la unión ya que no existe en la tabla de exámenes.
-- Se asocia el curso mediante los estudiantes inscritos.
SELECT 
    s.first_name AS "Nombre Estudiante",
    c.course_name AS "Materia",
    ed.name AS "Examen",
    er.marks AS "Nota Final",
    NVL(TO_CHAR(sa.no_of_working_days), 'Sin Información') AS "Asistencia"
FROM AD.AD_STUDENT_DETAILS s
JOIN AD.AD_STUDENT_COURSE_DETAILS sc ON s.student_id = sc.student_id
JOIN AD.AD_COURSE_DETAILS c ON sc.course_id = c.course_id
LEFT JOIN AD.AD_EXAM_RESULTS er ON s.student_id = er.student_id
LEFT JOIN AD.AD_EXAM_DETAILS ed ON er.exam_id = ed.exam_id
LEFT JOIN AD.AD_STUDENT_ATTENDANCE sa ON s.student_id = sa.student_id;

-- 5. ANÁLISIS: PROMEDIO POR EXAMEN
-- Identifica el nivel de dificultad general de cada examen aplicado.
SELECT 
    ed.name AS "Nombre del Examen", 
    ROUND(AVG(er.marks), 2) AS promedio_general
FROM AD.AD_EXAM_DETAILS ed
JOIN AD.AD_EXAM_RESULTS er ON ed.exam_id = er.exam_id
GROUP BY ed.name
ORDER BY promedio_general ASC;

-- 6. CALIDAD DE DATOS (REQUERIMIENTO PUNTO 3)
SELECT 
    first_name, 
    student_id 
FROM AD.AD_STUDENT_DETAILS 
WHERE student_reg_year IS NULL OR email_addr IS NULL;
