-- ==========================================================
-- TALLER SQL: PUNTO 2 - MEJORA ADMINISTRATIVA (FACULTADES)
-- INTEGRANTE B: Gestion de Facultades (Docentes) y Cursos
-- OBJETIVO: Identificar sobrecarga administrativa por Docente/Departamento
-- USANDO EL ESQUEMA VERIFICADO (AD) - CORRECCIÓN DE TIPOS DE DATOS
-- ==========================================================

-- 1. CARGA ACADÉMICA POR DOCENTE (FACULTY DETAILS)
-- Identifica qué profesores tienen más cursos asignados bajo su gestión.
SELECT 
    f.FIRST_NAME || ' ' || f.LAST_NAME AS NOMBRE_DOCENTE,
    f.EMAIL,
    COUNT(fc.COURSE_ID) AS TOTAL_CURSOS_ASIGNADOS
FROM 
    AD.AD_FACULTY_DETAILS f
LEFT JOIN 
    AD.AD_FACULTY_COURSE_DETAILS fc ON f.FACULTY_ID = fc.FACULTY_ID
GROUP BY 
    f.FIRST_NAME, f.LAST_NAME, f.EMAIL
ORDER BY 
    TOTAL_CURSOS_ASIGNADOS DESC;

-- 2. CARGA POR DEPARTAMENTO
-- Analiza cuántos cursos están bajo la administración de cada departamento.
SELECT 
    d.DEPARTMENT_NAME, 
    COUNT(c.COURSE_ID) AS CANTIDAD_CURSOS
FROM 
    AD.AD_DEPARTMENTS d
LEFT JOIN 
    AD.AD_COURSE_DETAILS c ON d.DEPARTMENT_ID = c.DEPARTMENT_ID
GROUP BY 
    d.DEPARTMENT_NAME
ORDER BY 
    CANTIDAD_CURSOS DESC;

-- 3. RELACIÓN DE LIDERAZGO (DEPARTAMENTOS Y SUS JEFES)
-- CORREGIDO: El campo HOD contiene nombres (MARK SMITH), no IDs. 
-- El JOIN se hace comparando el nombre completo.
SELECT 
    d.DEPARTMENT_NAME,
    d.HOD AS NOMBRE_JEFE_HOD,
    f.EMAIL AS CONTACTO_JEFE,
    f.FACULTY_ID AS ID_INTERNO_DOCENTE
FROM 
    AD.AD_DEPARTMENTS d
LEFT JOIN 
    AD.AD_FACULTY_DETAILS f ON UPPER(d.HOD) = UPPER(f.FIRST_NAME || ' ' || f.LAST_NAME);

-- 4. VISTA PARA EL INTEGRANTE C (CONSOLIDADO FINAL)
-- Esta vista une las 3 tablas clave para que el integrante C pueda cruzar datos.
CREATE OR REPLACE VIEW V_PUNTO2_FACULTADES AS
SELECT 
    d.DEPARTMENT_ID,
    d.DEPARTMENT_NAME,
    d.HOD AS JEFE_DEPARTAMENTO,
    c.COURSE_NAME
FROM 
    AD.AD_DEPARTMENTS d
JOIN 
    AD.AD_COURSE_DETAILS c ON d.DEPARTMENT_ID = c.DEPARTMENT_ID;

-- 5. DATOS FALTANTES (Requerimiento Punto 3)
-- Cursos que no tienen un departamento asignado.
SELECT 
    COURSE_NAME 
FROM 
    AD.AD_COURSE_DETAILS 
WHERE 
    DEPARTMENT_ID IS NULL;
