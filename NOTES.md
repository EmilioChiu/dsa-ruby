# Notas de Aprendizaje - DSA Ruby

## Preferencias del Estudiante
- **Formato**: Uso estricto de la skill `/teach` (en lugar del `course-manager/mentor`). El progreso se sigue a través de `MISSION.md`, `RESOURCES.md`, `GLOSSARY.md`, `learning-records/` y lecciones interactivas HTML.
- **Idioma**: Español para las lecciones, discusiones y notas.
- **Lenguaje**: Ruby.
- **Estilo de aprendizaje**: Preferencia por lecciones visuales interactivas en formato HTML seguidas de resolución de problemas reales (tipo LeetCode) en el workspace de práctica.
- **Preferencia importante**: No incluir soluciones de ejercicios pendientes en materiales de referencia (ej. cheatsheets).

## Notas del Mentor (Historial)
- El estudiante ya completó las semanas 1 a 3 (Arrays & Hashing, Two Pointers, Sliding Window, Bitwise Operations, Bucket Sort) y parte de la semana 4 (Linked List implementation and patterns).
- Nivel anterior: Semana 4, Día 3 (Stacks). Completados: Valid Parentheses, Min Stack, RPN, Daily Temperatures.
- Las deudas conceptuales anteriores fueron resueltas y cerradas.

## Sesión 2026-06-11
- **Logro**: Implementación de Queues usando Dos Stacks y Buffer Circular.
- **Fortaleza**: Excelente comprensión de la complejidad amortizada O(1).
- **A tener en cuenta**: El usuario tiene buen ojo para detectar inconsistencias en la lógica (detectó el bug del `if @stack2.empty?`).
- **Estado**: Listo para el Milestone 4 (Examen Integrador).
- **Próximo reto sugerido**: Introducción teórica a LRU Cache antes de implementarlo en el examen.

## Sesión 2026-06-12 (Corte de sesión)
- **Estado**: El estudiante encontró dificultad significativa en LRU Cache.
- **Bloqueo**: Confusión entre nodos reales y centinelas (head.prev/tail.next).
- **Instrucción**: No pasar a Árboles (Week 5) hasta que los punteros de la lista doble sean intuitivos.
- **Próximo paso**: Ejercicios de 'calentamiento' de punteros.

## Sesión 2026-06-19 — Deuda Técnica (DLL + LRU)
- **Logro**: Deuda técnica de punteros en DLL con centinelas saldada.
- **Actividades**: Lección 0009 (DLL centinelas) + práctica 01_dll_sentinels.rb, Lección 0010 (Reverse DLL) + práctica 02_reverse_dll.rb, re-intento LRU Cache (03_lru_cache.rb).
- **Aprendizajes**: `head.prev` y `tail.next` son siempre nil; distinguir entre `==`, `===` y `equal?` en Ruby; orden correcto en `put` (update antes que eviction).
- **Próximo milestone**: w5d1 (Binary Search básico).

## Sesión 2026-06-20 — Binary Search (w5d1)
- **Logro**: Lección 0006 mejorada (contraste, visualización paso a paso, quizzes). Tres problemas resueltos: LeetCode 704, 35, 278.
- **Aprendizajes clave**: `left` como respuesta natural al salir del loop; `right = mid - 1` (no `right -= 1`) para O(log n).
- **Próximo milestone**: w5d2 (BS en respuesta — Koko Eating Bananas, etc.).

## Sesión 2026-06-24 — BS en Rotated Array (w5d3)
- **Logro**: Resueltos LC 33, 153, 162. Entendido el patrón de BS en arrays rotados.
- **Aprendizajes clave**: Diferencia entre `right = mid` y `right = mid - 1` según si mid puede ser la respuesta; `>=` vs `>` en la condición de pertenencia a mitad (bug corregido de `target > nums[0]` a `target >= nums[0]`).
- **Lección de refuerzo**: 0013-binary-search-off-by-one.html (loop invariant, 4 movimientos, cuándo cada uno es seguro).
- **Siguiente**: w5d4 (BS avanzado — BS en 2D, elegir entre estrategias).

## Sesion 2026-06-25 — BS en 2D + Framework (w5d4) COMPLETADO
- **Logro**: Leccion 0014 (BS en 2D + framework de 4 patrones). Mapeo `row = mid / n`, `col = mid % n`.
- **Practica**: LC 74 (Search a 2D Matrix) resuelto. Todos los tests pasaron.
- **Aprendizaje clave**: El mapeo 2D a 1D convierte cualquier matriz fully sorted en un array plano. La pregunta correcta no es "esta ordenado?" sino "existe una propiedad monotona?".
- **Estado**: w5d4 completado. Proximo: w5d5 (Milestone 5 — examen integrador de BS).

## Convencion de Codigo
- Usar SIEMPRE nombres completos y descriptivos para variables en ejercicios y lecciones.
- Evitar abreviaciones como `lo`, `hi`, `i`, `j`, `idx`.
- Preferir: `left`, `right`, `boundary`, `current`, `left_index`, `right_index`, `pivot_value`, etc.
- Si el nombre choca con algun metodo interno de Ruby, buscar sinonimo descriptivo en vez de abreviar.

## Preferencia Futura
- **Proxima sesion (w6d2):** Antes de empezar, hacer un quiz verbal en el chat donde el usuario deba diferenciar Merge Sort vs Quick Sort (cual usar segun el escenario). Esto como warmup de refuerzo.

## Sesion 2026-06-26 — Sorting Algorithms (w6d1) COMPLETADO
- **Warmup**: Leccion 0015 (BS loop invariants warmup). 8 escenarios practicados. Debt-002 resuelta.
- **Logro**: Leccion 0016 (Merge Sort + Quick Sort). Visualizacion paso a paso, implementacion en Ruby, tabla comparativa.
- **Reference**: 0007-sorting-cheatsheet.html creado.
- **Practica**: Archivos 01_merge_sort.rb, 02_quick_sort.rb, 03_sort_an_array.rb preparados.
- **Aprendizajes clave**:
  - Merge Sort: siempre O(n log n), O(n) espacio, estable. `merge()` crea array auxiliar.
  - Quick Sort: O(n log n) promedio, O(n^2) peor caso (array ordenado + pivot ultimo). In-place con swaps.
  - Lomuto vs Hoare: Lomuto es mas simple para entrevistas; Hoare es mas eficiente.
  - Para evitar loop infinito en `while left < right` con `left = mid`, usar `mid = ceil()` (mid superior).
- **Estado**: w6d1 completado. Proximo: w6d2 (Custom Sort Patterns).
