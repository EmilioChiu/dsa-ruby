# Día 3 — Strings en Ruby

## Warm-up Big-O
*   **Busca de carácter (`.include?`)**: O(n) porque recorre el string hasta encontrarlo o llegar al final.
*   **Concatenación con `<<` (Shovel)**: O(1) amortizado (modifica in-place).
*   **Concatenación con `+=`**: O(n^2) en bucles (crea una copia nueva en cada iteración).

## Conceptos nuevos

### Inmutabilidad y Eficiencia
*   A diferencia de otros lenguajes, en Ruby los strings son **mutables** por defecto.
*   Para ahorrar memoria y tiempo en algoritmos, es preferible modificar el string original si es posible (O(1) espacio extra).

### El Truco Matemático (Sin Strings)
*   Para obtener dígitos de un número: `numero % 10`.
*   Para eliminar el último dígito: `numero / 10`.
*   Para construir un número a la inversa: `acumulado = (acumulado * 10) + digito`.

### Control de Flujo Avanzado
*   `break`: Rompe el bucle más cercano. Útil para dejar de procesar una palabra cuando ya encontramos un error.
*   `return`: Finaliza la función inmediatamente. Ideal para "Early Returns" (cuando la respuesta ya es definitiva).

## Observaciones / Insights
*   **Longest Common Prefix**: La forma "Ruby-ista" prefiere usar métodos de alto nivel como `.start_with?` y `.slice` en lugar de manejar índices manuales (`i += 1`), lo que reduce errores de "fuera de rango" (out of bounds).

## Dudas pendientes
*   Diferencia entre Base 8 (Octal) y Base 10 (Decimal) en Ruby (ej. 010 == 8).
