# Learning Record: Pitfalls en Listas Doblemente Enlazadas (LRU Cache)

Durante la implementación de un Caché LRU, se identificaron errores críticos en la manipulación de punteros al usar Nodos Dummy (`head` y `tail`).

## Detalle del Conocimiento Establecido
- **Nodos Centinela (Dummy Nodes)**: Se utilizan para evitar verificar nulos (`nil`) en cada operación. Sin embargo, su posición es fija: `head` siempre es el inicio (ficticio) y `tail` el fin (ficticio).
- **Inserción vs. Posición Relativa**: Al querer insertar el elemento "más reciente", este debe ir **entre** el `head` y el primer elemento real. Intentar acceder a `head.prev` resulta en `nil` porque no hay nada antes del centinela de inicio.
- **Desalojo (Eviction)**: El elemento "menos recientemente usado" (LRU) no es la cola misma (`tail`), sino el nodo inmediatamente **anterior** a ella (`tail.prev`).

## Errores Identificados
1. **Error de Acceso a Nil**: `prev = @head.prev` resultó en `nil`, causando que `prev.next` fallara.
2. **Error de Lógica de Desalojo**: `lru = @tail.next` intentaba acceder al nodo después del final, el cual es `nil`.

## Próximos Pasos
- Reforzar la visualización de punteros en operaciones de inserción y borrado en listas dobles.
