## Merge Sort
## Link: https://leetcode.com/problems/sort-an-array/

## Problem
# Dado un array de enteros nums, ordenalo en orden ascendente usando
# Merge Sort. Debes implementar el algoritmo desde cero.

## Constraints
# - 1 <= nums.length <= 5 * 10^4
# - -5 * 10^4 <= nums[i] <= 5 * 10^4

## Examples
# merge_sort([38, 27, 43, 3, 9, 82, 10]) -> [3, 9, 10, 27, 38, 43, 82]
# merge_sort([5, 2, 3, 1]) -> [1, 2, 3, 5]
# merge_sort([1]) -> [1]

## Signature
def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length()/2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..])

  merge(left, right)
end

def merge(left, right)
  answer = []
  left_index = 0
  right_index = 0

  while left_index < left.length && right_index < right.length
    if left[left_index] <= right[right_index]
      answer << left[left_index]
      left_index += 1
    else
      answer << right[right_index]
      right_index += 1
    end
  end

  answer += right[right_index..] + left[left_index..]
end

## Tests
puts merge_sort([38, 27, 43, 3, 9, 82, 10]) == [3, 9, 10, 27, 38, 43, 82]
puts merge_sort([5, 2, 3, 1]) == [1, 2, 3, 5]
puts merge_sort([1]) == [1]
puts merge_sort([]) == []
puts merge_sort([3, 1, 2]) == [1, 2, 3]
  

# recuerda:
# cuando se quiere hacer el merge sort tienes que tener en cuenta cada paso
# primer paso: hacer que el array mida 1 de length (o bueno, separarlos para que hayan n arrays de 1 elemento) 
# esto hace que en teoria ya esten "ordenados" (en un array de un elemento ese elemento siempre sera el menor y el mayor al mismo tiempo)
# segundo paso: ir volviendo a conectar paso por paso
# es decir revisar el array vecino y ordenarlos, ej:
# tienes dos arrays [2], [1]
# revisas si i[0] es > a j[0]
# en este caso es un si (2 > 1)
# entonces con array auxiliar lo pones en orden 
# [] << 1 -> answer = [1]
# como ya esta vacio el array, se tiene que salir de loop, y concatenar los valores faltantes, los cuales sabemos que siempre van a ser mayores a los que ya estan en answer (solo van a sobrar de un lado) 
# answer << i[restantes] + j[restantes]
# repetimos el proceso hasta que tengamos el array completo
