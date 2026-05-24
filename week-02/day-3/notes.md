# Semana 2, Dia 3 - Two Pointers (opuestos)

**Fecha:** 2026-05-23
**Bloom:** Apply

## Temas
- Two pointers convergiendo (left/right)
- Decidir que puntero mover basado en restricciones
- Verificacion de caracteres alfanumericos con rangos

## Problemas
- [x] Valid Palindrome (2 pointers, sin regex)
- [x] Container With Most Water
- [x] 3Sum

## Notas
- Valid Palindrome: extraer logica de validacion alfanumerica a metodo aparte (valid_char?). Comparar con rangos (char >= "a" && char <= "z") or (char >= "0" && char <= "9") en vez de diccionario o regex.
- Container: mover el puntero con la altura mas baja en cada paso. El "cuello de botella" determina que mover al mas bajo porque el mas alto no puede mejorar el area (la altura ya esta limitada por el mas bajo). Area = min(h[left], h[right]) * (right - left).
- 3Sum: evolucion de v1 (target indirecto, uniq al final, puts debug) a v2 (item directo, skip duplicados en fixed y left, condiciones sum>0/sum<0, sin uniq).
- Debt-001 resuelto: space complexity (5 snippets analizados).
- Debt-002 resuelto: Product of Array Except Self O(1) space.
