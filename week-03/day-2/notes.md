# Sliding Window (Ventana Deslizante) - Tamaño Fijo

El patrón de **Sliding Window** se utiliza para reducir la complejidad algorítmica de $O(n \times K)$ a $O(n)$ en problemas que involucran subarrays o subsegmentos.

## Concepto Clave
En lugar de procesar cada ventana desde cero, "reutilizamos" el resultado de la ventana anterior:
1. **Restamos** el elemento que sale por la izquierda.
2. **Sumamos** el elemento que entra por la derecha.

## ¿Cuándo usarlo?
- El problema menciona un **subarray** o **substring** continuo.
- Se pide un valor máximo, mínimo o una suma sobre un tamaño fijo **K**.

## Ejemplo Visual (K=3)
Array: `[1, 2, 3, 4, 5, 6]`

1. Primera ventana: `[1, 2, 3]` -> Suma = 6
2. Deslizar: Restamos 1, sumamos 4.
3. Segunda ventana: `[2, 3, 4]` -> Suma = 6 - 1 + 4 = 9
