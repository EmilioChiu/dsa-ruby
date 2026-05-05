# DSA en Ruby — De Cero a Entrevistado

Curso autodidacta de 12 semanas (~180 horas, 60 sesiones) de Estructuras de Datos y Algoritmos en Ruby, orientado a la preparación para entrevistas técnicas en empresas de tecnología.

## Meta

Dominar los fundamentos de DSA en Ruby para:

- Implementar estructuras de datos fundamentales (listas enlazadas, pilas, colas, árboles, grafos) desde cero
- Analizar con precisión la complejidad temporal y espacial (Big-O) de cualquier algoritmo
- Resolver ~250 problemas de nivel Easy y Medium del [NeetCode 150](https://neetcode.io)
- Explicar verbalmente decisiones de diseño y trade-offs entre soluciones

## ¿Cómo se creó?

Cuatro skills del ecosistema de agentes orquestan el curso:

| Skill | Autor | Propósito |
|---|---|---|
| `course-designer` | [teachingai](https://github.com/teachingai/full-stack-skills) | Diseñó el syllabus con taxonomía de Bloom, prerrequisitos, niveles cognitivos y rúbricas |
| `course-manager` | Creada por el autor del curso | Bootstrap de la estructura del repo, archivos de estado y validación de hitos |
| `course-mentor` | Creada por el autor del curso | Orquestador de las sesiones diarias con protocolo Socrático |
| `teach` | [Matt Pocock](https://github.com/mattpocock/skills) | Lecciones HTML interactivas y learning records. Se incorporó a partir de la semana 4 |

### Flujo de creación

1. **`course-designer`** genera el syllabus: 12 módulos, 60 milestones con niveles Bloom y prerrequisitos
2. **`course-manager`** materializa la estructura de carpetas (`week-N/day-M/`) y los archivos de estado
3. **`course-mentor`** guía cada sesión: sin respuestas directas, solo preguntas socráticas. Documenta en `notes.md`, actualiza `progress.json` y `debt.json`
4. A partir de la **semana 4**, se incorpora **`teach`** para producir lecciones visuales HTML y learning records, complementando a `course-mentor` que sigue siendo el orquestador de las sesiones diarias

## Estructura del repositorio

```
~/.course-manager/courses/dsa-ruby/
├── syllabus.json          # Plan maestro: 12 módulos, Bloom, prerequisitos, exámenes
├── progress.json          # Hito actual, racha, milestones completados
├── debt.json              # Deuda conceptual (debilidades y correcciones)
├── MISSION.md             # Por qué existe el curso y qué significa éxito
├── RESOURCES.md           # Recursos curados (VisuAlgo, NeetCode, LeetCode, etc.)
├── GLOSSARY.md            # Glosario de términos en español
├── NOTES.md               # Preferencias del estudiante
├── learning-records/      # Registros de aprendizaje (formato ADR)
├── lessons/               # Lecciones interactivas HTML
├── week-01/ a week-12/   # Módulos semanales
│   └── day-M/
│       ├── notes.md       # Notas de la sesión
│       └── practice/      # Soluciones .rb con formato LeetCode
├── evidence/              # Evidencias de validación
├── logs/                  # Logs de sesiones
└── reference/             # Material de referencia
```
