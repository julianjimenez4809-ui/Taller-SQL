-- ==========================================================
-- TALLER SQL: PUNTO 3 - CARACTERIZACIÓN Y PREPARACIÓN DE TEMPORADA
-- INTEGRANTE C: Tomas Rincón (Arquitecto de Datos)
-- OBJETIVO: Consolidar datos de años académicos, cursos, departamentos
-- y profesores en una sola tabla/vista. Detectar nulos y duplicados.
-- ==========================================================

-- 1. CONSOLIDACIÓN EN UNA SOLA TABLA (VISTA PRINCIPAL)
-- Cumple con el requerimiento de consolidar toda la información en una sola vista permanente.
-- Muestra el año académico (Sesión), Departamento, Jefe, Curso y Docente asignado.
CREATE OR REPLACE VIEW V_PUNTO3_CONSOLIDADO AS
SELECT 
    sess.SESSION_ID AS ACADEMIC_SESSION,
    d.DEPARTMENT_NAME,
    d.HOD AS HEAD_OF_DEPARTMENT,
    c.COURSE_NAME,
    f.FIRST_NAME || ' ' || f.LAST_NAME AS FACULTY_NAME,
    f.EMAIL AS FACULTY_EMAIL
FROM 
    AD.AD_ACADEMIC_SESSION sess
JOIN 
    AD.AD_COURSE_DETAILS c ON sess.SESSION_ID = c.SESSION_ID
LEFT JOIN 
    AD.AD_DEPARTMENTS d ON c.DEPARTMENT_ID = d.DEPARTMENT_ID
LEFT JOIN 
    AD.AD_FACULTY_COURSE_DETAILS fc ON c.COURSE_ID = fc.COURSE_ID
LEFT JOIN 
    AD.AD_FACULTY_DETAILS f ON fc.FACULTY_ID = f.FACULTY_ID;

-- 2. DETECCIÓN DE INFORMACIÓN FALTANTE (NULL VALUES)
-- Busca registros críticos en departamentos o cursos donde falten asignaciones
SELECT 
    'CURSO SIN DEPARTAMENTO' AS TIPO_FALLA,
    COURSE_NAME AS IDENTIFICADOR
FROM 
    AD.AD_COURSE_DETAILS
WHERE 
    DEPARTMENT_ID IS NULL
UNION ALL
SELECT 
    'DEPARTAMENTO SIN JEFE (HOD)' AS TIPO_FALLA,
    DEPARTMENT_NAME AS IDENTIFICADOR
FROM 
    AD.AD_DEPARTMENTS
WHERE 
    HOD IS NULL;

-- 3. DETECCIÓN DE DUPLICADOS
-- Verifica si hay cursos duplicados (mismo nombre) en el sistema para una misma sesión
SELECT 
    c.COURSE_NAME,
    c.SESSION_ID,
    COUNT(c.COURSE_ID) AS CANTIDAD_DUPLICADOS
FROM 
    AD.AD_COURSE_DETAILS c
GROUP BY 
    c.COURSE_NAME, c.SESSION_ID
HAVING 
    COUNT(c.COURSE_ID) > 1;

-- 4. FACULTADES/DEPARTAMENTOS A FORTALECER
-- Identifica qué departamentos tienen una oferta académica muy pobre o nula.
-- Esto responde a identificar las facultades que necesitan fortalecerse.
SELECT 
    d.DEPARTMENT_NAME,
    COUNT(c.COURSE_ID) AS TOTAL_CURSOS_OFERTADOS
FROM 
    AD.AD_DEPARTMENTS d
LEFT JOIN 
    AD.AD_COURSE_DETAILS c ON d.DEPARTMENT_ID = c.DEPARTMENT_ID
GROUP BY 
    d.DEPARTMENT_NAME
ORDER BY 
    TOTAL_CURSOS_OFERTADOS ASC;

-- 5. RELACIÓN ALUMNO-CURSO-PROFESOR (PREPARACIÓN NUEVA TEMPORADA)
-- Consulta para medir la densidad esperada por docente en sus cursos.
SELECT 
    c.COURSE_NAME AS CURSO,
    f.FIRST_NAME || ' ' || f.LAST_NAME AS DOCENTE_ASIGNADO,
    COUNT(sc.STUDENT_ID) AS ALUMNOS_MATRICULADOS
FROM 
    AD.AD_COURSE_DETAILS c
LEFT JOIN 
    AD.AD_STUDENT_COURSE_DETAILS sc ON c.COURSE_ID = sc.COURSE_ID
LEFT JOIN 
    AD.AD_FACULTY_COURSE_DETAILS fc ON c.COURSE_ID = fc.COURSE_ID
LEFT JOIN 
    AD.AD_FACULTY_DETAILS f ON fc.FACULTY_ID = f.FACULTY_ID
GROUP BY 
    c.COURSE_NAME, 
    f.FIRST_NAME, 
    f.LAST_NAME
ORDER BY 
    ALUMNOS_MATRICULADOS DESC;
