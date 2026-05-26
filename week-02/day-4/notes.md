# w2d4 - Two Pointers (mismo lado)

Fecha: 2026-05-25

## Temas
- Fast-slow pointers (ambos punteros desde el lado izquierdo)
- In-place modification con asignacion directa (no swap)
- Diferencia entre convergin pointers y same-side pointers

## Ejercicios resueltos
- Move Zeroes: O(n) tiempo, O(1) espacio
- Remove Element: O(n) tiempo, O(1) espacio
- Remove Duplicates from Sorted Array: O(n) tiempo, O(1) espacio

## Conceptos clave
- slow marca donde escribir el proximo valido, fast escanea
- fast solo lee, slow solo escribe
- slow siempre escribe en posiciones que fast ya leyo
- En array ordenado, comparar con nums[slow - 1] (ultimo unico colocado), no con el indice anterior del array original
- No se necesita swap ni memoria auxiliar O(1) con single assignment

## Debts resueltos
- debt-007: Two Pointers decision de movimiento (warm-up al inicio)

## Proximo: w2d5 - Milestone 2 (examen integrador)
