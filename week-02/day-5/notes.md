# w2d5 - Milestone 2: Examen Integrador

Fecha: 2026-05-26

## Problemas resueltos

### 1. 3Sum (Medium) - Two Pointers (opuestos)
- Sort + fijo + dos punteros izquierda/derecha
- Skip duplicados del fijo con `next if index > 0 && nums[index] == nums[index-1]`
- Skip duplicados de `left` despues de encontrar match
- O(n^2) tiempo, O(1) espacio extra

### 2. Climbing Stairs (Easy) - Fibonacci / DP
- Reconocer subestructura Fibonacci: f(n) = f(n-1) + f(n-2)
- Bottom-up con dos variables (no array), parallel assignment
- O(n) tiempo, O(1) espacio

### 3. Merge Sorted Array (Easy) - Two Pointers (swap)
- Swap de elementos menores de nums2 hacia adelante en nums1
- `break if index == m` para no tocar placeholders
- Copia final de nums2 (con swaps ya realizados) a las posiciones restantes
- O(m + n) tiempo, O(1) espacio extra

### Alternativa: punteros desde el final (solucion canonica)
```ruby
def merge(nums1, m, nums2, n)
  p1, p2, p = m - 1, n - 1, m + n - 1
  while p2 >= 0
    if p1 >= 0 && nums1[p1] > nums2[p2]
      nums1[p] = nums1[p1]; p1 -= 1
    else
      nums1[p] = nums2[p2]; p2 -= 1
    end
    p -= 1
  end
end
```

Diferencias con mi solucion:
| Mi solucion (swap-and-copy) | Canonica (punteros desde atras) |
|---|---|
| Modifica nums2 | No toca nums2 |
| Dos pasadas: swap + copia final | Una sola pasada |
| Usa `break if index == m` | Sin condiciones extra |
| Swaps entre arrays | Solo asignacion directa |
| Avanza desde el inicio | Avanza desde el final |

La canonica aprovecha que los placeholders estan al final — llena desde ahi hacia atras comparando los elementos mas grandes de cada array, sin necesidad de swaps ni segunda copia.

## Proximo: w3d1 - Hash Maps en Ruby
