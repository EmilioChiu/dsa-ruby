# Progreso: Stacks — Valid Parentheses y Min Stack (w4d3)

Se avanza en el modulo de Stacks de la semana 4, completando Valid Parentheses (repaso conceptual LIFO) y Min Stack (patron two-stack para minimo O(1)).

## Detalle del Conocimiento Establecido
- **Valid Parentheses**: Implementacion con stack de aperturas y hash de pares `{ ')' => '(', '}' => '{', ']' => '[' }`. Comprension de que la estructura LIFO resuelve naturalmente problemas de anidamiento.
- **Min Stack**: Diseno de dos stacks sincronizados donde el stack auxiliar `@mins` mantiene el minimo actual. La clave es hacer `pop` del minimo solo cuando el valor extraido coincide con el tope de `@mins`.

## Evidencia
Min Stack implementado con tests pasando: `get_min` retorna -3, luego de `pop` retorna -2, `top` retorna 0.
