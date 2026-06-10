# Learning Record: Daily Temperatures y el Patrón Monotonic Stack

Se completa el ejercicio 04 de la semana 4 (Stacks), aplicando el patrón de Monotonic Stack para optimizar de O(n²) a O(n).

## Detalle del Conocimiento Establecido
- **Monotonic Stack**: Un stack que mantiene sus elementos en un orden específico (en este caso, temperaturas decrecientes).
- **Índices en el Stack**: Para problemas donde el resultado depende de la distancia entre elementos (`i - prev_i`), es fundamental guardar el índice en el stack en lugar de solo el valor.
- **Eficiencia O(n)**: Aunque hay un bucle anidado (`while` dentro de `each`), la complejidad es lineal porque cada elemento entra y sale del stack como máximo una vez.
- **Uso de ceros por defecto**: Inicializar el array de resultados con ceros simplifica el algoritmo, ya que los elementos que quedan en el stack (que no encuentran un valor mayor) ya tienen su respuesta correcta (0).

## Evidencia
Implementación en `04_daily_temperatures.rb` pasando los casos de prueba base.
- Test 1 ([73, 74, ...]): PASSED
- Test 2 ([30, 40, ...]): PASSED
- Test 3 ([30, 30, ...]): PASSED

## Pendiente
- Continuar con la práctica de Stacks de la semana 4.
