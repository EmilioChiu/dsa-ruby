# Learning Record: Implementación de Queue con Dos Stacks

Se completa con éxito el desafío de implementar una cola (FIFO) utilizando dos pilas (LIFO) en Ruby.

## Detalle del Conocimiento Establecido
- **Transferencia Amortizada**: La clave para mantener la eficiencia es transferir elementos del `stack_in` al `stack_out` solo cuando el segundo está vacío. Esto garantiza una complejidad de tiempo amortizada de O(1).
- **Consistencia del Orden**: Si se transfieren elementos mientras el `stack_out` aún tiene datos, se rompe el orden FIFO. La condición `if @stack2.empty?` es crítica.
- **Estado de Vacío**: Una cola implementada con múltiples contenedores solo está vacía si todos sus contenedores están vacíos.

## Evidencia
Implementación final en `01_queue_using_stacks.rb`:
- `push`: O(1)
- `pop`/`peek`: O(1) amortizado
- `empty`: O(1)

## Próximos Pasos
- Implementar `MyCircularQueue` utilizando un array de tamaño fijo y aritmética modular.
