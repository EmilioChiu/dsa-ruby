# Semana 2, Dia 2 - Recursion avanzada

**Fecha:** 2026-05-20
**Bloom:** Analyze

## Temas
- Arbol de recursion (recursion tree)
- Multiples llamadas recursivas
- Trazar ejecucion recursiva
- Subsets: patron recursion + map (include/exclude)

## Problemas
- [x] Tower of Hanoi (revisado, base case n==0 vs n==1)
- [x] Climbing Stairs
- [x] Subsets (recursivo + iterativo)
- [x] Permutations

## Notas
- Tower of Hanoi: base case n==0 es mas limpio que n==1 porque evita duplicar el puts. Cada llamada con n>=1 imprime su movimiento; n==0 es "no hay nada que mover".
- Subsets: patron subs + subs.map { |sub| sub + [last] }. La recursion construye el power set tomando todos los subsets sin el ultimo elemento y agregandole copias con ese elemento.
- Permutations: patron `flat_map` + `(0...range).map` para insertar el ultimo elemento en cada posicion de cada sub-permutacion. Diferencia clave con subsets: subsets usa include/exclude con map, permutations inserta en n+1 posiciones.
- Debt-004 resuelto: O(n^2) vs O(2^n) — el primero es un loop anidado (polynomial), el segundo es recursion binaria (exponencial). Crecimiento drasticamente diferente.
- Debt-003 resuelto: usar prefix/suffix en vez de left/right_prods para evitar ambiguedad.
- Videos vistos (referencia):
  - Subsets: https://www.youtube.com/watch?v=UP3dOYJa05s
  - Subsets: https://www.youtube.com/watch?v=REOH22Xwdkk
  - Tower of Hanoi: https://www.youtube.com/watch?v=rf6uf3jNjbo

