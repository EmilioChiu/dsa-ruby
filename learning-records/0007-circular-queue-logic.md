# Learning Record: Implementación de Circular Queue (Ring Buffer)

Se implementó una cola circular utilizando un array de tamaño fijo, optimizando el uso de memoria y evitando el costo O(n) del método `shift` de Ruby.

## Detalle del Conocimiento Establecido
- **Aritmética Circular**: Los punteros de inserción y eliminación deben "dar la vuelta" al llegar al final del array. Esto se puede lograr con el operador módulo `%` o con condiciones manuales.
- **Gestión de Estado (Counter vs Pointers)**: Utilizar un contador (`@counter`) simplifica drásticamente la verificación de estados `is_full` e `is_empty`, resolviendo la ambigüedad que ocurre cuando los punteros de inicio y fin coinciden.
- **Rubyismo de Índice Negativo**: Se observó que `array[-1]` en Ruby facilita el acceso al último elemento insertado cuando el puntero de escritura ha vuelto a la posición inicial.

## Evidencia
Implementación final en `02_circular_queue.rb`:
- Todas las operaciones en O(1) real.
- Pruebas de desbordamiento (overflow) y subdesbordamiento (underflow) superadas.

## Próximos Pasos
- Milestone 4: Examen integrador de Linked Lists, Stacks y Queues.
