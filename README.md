# Workshop SQL - Oracle Academic (AD) 

Este repositorio contiene la resolución del taller de SQL para la gestión académica y administrativa universitaria, realizado en grupo.

## Integrantes y Roles
*   **Julian Duarte** - Líder de Datos (Enfoque: Rendimiento Académico)
*   **Julian Jimenez** - Analista Administrativo (Enfoque: Gestión de Facultades)
*   **Tomas Rincón** - Arquitecto de Datos (Enfoque: Consolidación y Limpieza)

---

## Objetivos del Taller

### 1. Análisis de Rendimiento Académico (Punto 1)
*   **Tareas:** Consultar detalles de estudiantes, notas por curso y resultados de exámenes.
*   **Entregables:** Queries SQL, Vistas y documento de análisis con gráficas de rendimiento.
*   **Responsable:** Julian Duarte.

### 2. Mejora de Capacidad Administrativa (Punto 2)
*   **Tareas:** Detalles de facultades y sus cursos.
*   **Entregables:** Propuesta administrativa, conclusiones y consultas SQL correlacionadas.
*   **Responsable:** Julian Jimenez.

### 3. Caracterización y Preparación de Temporada (Punto 3)
*   **Tareas:** Consolidación en una sola tabla, detección de duplicados y datos nulos.
*   **Entregables:** Análisis de años anteriores y reporte de facultades a fortalecer.
*   **Responsable:** Tomas Rincón.

---

## Metodología de Trabajo y Git

Para mantener el orden, utilizaremos el siguiente flujo de trabajo en Git:

### Ramas (Branches)
Cada integrante trabajará en una rama independiente:
1.  `feature/estudiantes` (Integrante A)
2.  `feature/facultades` (Integrante B)
3.  `feature/preparacion` (Integrante C)

### Comandos de inicio para cada integrante:
```bash
# 1. Clonar el repositorio
git clone [URL-DEL-REPO]

# 2. Crear y saltar a tu rama de trabajo
git checkout -b feature/[tu-nombre-de-rama]

# 3. Subir cambios a tu rama
git add .
git commit -m "Descripción de tu avance"
git push origin feature/[tu-nombre-de-rama]
```

---

## Estructura del Proyecto
*   `/sql`: Contiene los archivos `.sql` con las consultas y vistas.
*   `/docs`: Documentos de análisis, propuestas y conclusiones (PDF/Markdown).
*   `/assets`: Gráficas e imágenes resultantes del análisis.
*   `README.md`: Instrucciones y guía del proyecto.

---

## Entrega Final
1.  Consolidar todas las ramas en `main`.
2.  Verificar que el repositorio sea público.
3.  Enviar el link al formulario oficial: [Formulario Office](https://forms.office.com/r/sGWSt79VFk?origin=lprLink)
4.  Compartir con el usuario: `mariabaci`
