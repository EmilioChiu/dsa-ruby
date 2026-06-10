# Evaluate Reverse Polish Notation (RPN) con Stack

Se completa Evaluate Reverse Polish Notation, tercer problema de stacks (w4d3). Se consolida la comprension del patron de evaluacion de expresiones postfijas con stack.

## Detalle del Conocimiento Establecido
- **RPN = postfija**: operador despues de los operandos, sin necesidad de parentesis.
- **Regla de pops**: `b = stack.pop` (segundo operando), `a = stack.pop` (primer operando). El orden importa para `/` y `-`.
- **Truncado a cero en Ruby**: `(a.to_f / b.to_f).to_i` fuerza truncado hacia cero (Ruby nativo trunca hacia -infinito).
- **Hash de operadores con `send`**: `{ '+' => :+, ... }` permite despachar operaciones sin if/else anidados.

## Evidencia
RPN implementado con solucion O(n) pasando los 3 tests del problema LeetCode 150.

## Pendiente
Daily Temperatures (04_daily_temperatures.rb) — completar para cerrar w4d3.
