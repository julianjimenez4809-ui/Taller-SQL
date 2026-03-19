# Preparación de la Nueva Temporada - Punto 3

**Objetivo del Informe:** 
Queremos consolidar la información de la institución (años académicos, cursos, departamentos y profesores) en un solo lugar. Esto nos servirá como base para organizarnos antes de la llegada de los estudiantes en la nueva temporada, identificando si hay problemas graves en nuestros archivos (como cursos duplicados o sin organizar) y descubriendo de paso qué facultades necesitan más atención y recursos.

---

## 1. La Tabla Única (Nuestra Vista Principal)

La directiva pidió una forma fácil de "ver todo en una sola tabla" para no perderse navegando entre distintos archivos. Por eso consolidamos toda la red académica en una vista general llamada `V_PUNTO3_CONSOLIDADO`. 

**¿Qué nos muestra esta tabla?**
De un solo vistazo, podemos saber el año académico, el departamento, su jefe directivo, el curso que dictan y el profesor a cargo. Tener todos estos datos juntos hará que planear los nuevos horarios de clases sea un proceso sumamente ágil y directo.

*(Referencia visual: `Queri_1.png`)*

---

## 2. Limpieza de Nuestros Datos (Auditoría de Calidad)

Antes de abrir inscripciones, debíamos estar absolutamente seguros de que el sistema no tuviera vacíos o cursos "fantasma" que desorientaran a los alumnos. ¡Las buenas noticias son que nuestro sistema está muy sólido!

### A. Evaluando Vacíos y Nulos
Buscamos en la base de datos si existían cursos que no pertenecieran a ninguna facultad (cursos "huérfanos") o departamentos que no tuvieran un jefe directivo (`HOD`) anotado. 
Al ejecutar nuestra auditoría, el sistema arrojó cero resultados. Esto significa que **absolutamente todos los cursos tienen supervisión** y no hay departamentos desamparados.

*(Referencia visual: `Queri_2.png`)*

### B. Evaluando Cursos Duplicados
Hicimos un chequeo para ver si un mismo curso se había creado dos veces por error durante el mismo ciclo académico. De nuevo, la base de datos pasó la prueba sin fallos. Esto nos garantiza que ningún estudiante terminará pagando o matriculándose en un curso clon irreale.

*(Referencia visual: `Queri_3.png`)*

---

## 3. Profesores y Facultades que Necesitamos Fortalecer

Al auditar la distribución de peso entre las facultades, encontramos lo siguiente:

1. **La Facultad de Literatura está perdiendo terreno:** Notamos que todas las ramas (Computación, Biología y Contabilidad) lideran con fuerza ofreciendo **4 cursos** cada una de forma equitativa. Sin embargo, "Literatura" está por detrás ofreciendo solo 3 cursos. La institución debe fortalecer esta área de inmediato abriendo nuevas clases artísticas para no dejarla rezagada frente a las carreras de ciencias. *(Referencia visual: `Queri_4.png`)*
2. **Monitorear a nuestros docentes más solicitados:** Confirmamos que el profesor **Steven King** es un pilar fundamental para nosotros, ya que está encargado de cursos súper concurridos (como *Cost Accounting* con 3 alumnos, y *Strategic Tax Planning* con 2). Su carga acumulada supera bastante la media de sus colegas (que suelen tener 2 alumnos). Debemos cuidarlo asignándole asistentes o abrir nuevos horarios para aligerar su volumen de trabajo. *(Referencia visual: `Queri_5.png`)*

---

## 4. Conclusión para la Nueva Temporada

Si queremos arrancar el próximo semestre con éxito, sugerimos dos puntos de acción rápidos:
1. **Estamos técnicamente cubiertos:** A nivel de archivo, la matrícula puede abrirse hoy mismo, ya que no detectamos ni cursos huérfanos ni errores de duplicidad en nuestro análisis de limpieza.
2. **Equilibrar a la academia:** Concentrar esfuerzos en sacar adelante al Departamento de Literatura (creando nuevas asignaturas) y alivianar de inmediato la inmensa acumulación de trabajo del profesor Steven King en el departamento contable.

---

**Archivos Entregables Asociados:**
- Archivo SQL: `sql/punto3_preparacion.sql`
- Datos Resultantes (CSVs): Carpeta `assets/data/Punto_3/`
- Capturas y Gráficas de las Consultas: Carpeta `assets/capturas/Punto_3/`
