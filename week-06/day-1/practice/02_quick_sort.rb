## Quick Sort
## Link: https://leetcode.com/problems/sort-an-array/

## Problem
# Dado un array de enteros nums, ordenalo en orden ascendente usando
# Quick Sort (particion de Lomuto). Debes implementar el algoritmo desde cero.

# ## Constraints
# - 1 <= nums.length <= 5 * 10^4
# - -5 * 10^4 <= nums[i] <= 5 * 10^4

## Examples
# quick_sort([10, 7, 8, 9, 1, 5]) -> [1, 5, 7, 8, 9, 10]
# quick_sort([5, 2, 3, 1]) -> [1, 2, 3, 5]
# quick_sort([1]) -> [1]

## Signature
def sort_if_not_sorted(arr, left = 0, right = arr.length - 1)
  return arr if sorted?(arr)
  quick_sort(arr)
  arr
end

def quick_sort(arr, left = 0, right = arr.length - 1)
  return arr if left >= right

  pivot = partition(arr, left, right)
  quick_sort(arr, left, pivot-1)
  quick_sort(arr, pivot+1, right)
end

def partition(arr, left, right)
  pivot = right
  boundary = left

  (left...right).each do |index| 
    if arr[index] <= arr[pivot]
      arr[index], arr[boundary] = arr[boundary], arr[index]
      boundary += 1
    end
  end

  arr[boundary], arr[pivot] = arr[pivot], arr[boundary]
  boundary
end

def sorted?(arr)
  prev = arr[0]

  arr.each_with_index do |element, index|
    next if index == 0
    return false if prev > element
    prev = element
  end
  true
end

## Tests
puts sort_if_not_sorted([10, 7, 8, 9, 1, 5]) == [1, 5, 7, 8, 9, 10]
puts sort_if_not_sorted([5, 2, 3, 1]) == [1, 2, 3, 5]
puts sort_if_not_sorted([1]) == [1]
puts sort_if_not_sorted([]) == []
puts sort_if_not_sorted([3, 3, 3]) == [3, 3, 3]
puts sort_if_not_sorted([5, 1, 1, 2, 0, 0]) == [0, 0, 1, 1, 2, 5]

# este me costo entenderlo, pero vemos si puedo hacerlo de 0
# en primer lugar tenemos que entender sus limitaciones y sus beneficios
# es un algoritmo que hace los cambios in place
# esto quiere decir que a diferencia del merge sort es O(log n) en espacio (supongo que es por el stack)
# sin embargo en el peor de los casos es o(n^2) cuadratica, y a comparacion de merge sort que es o(n log n) que es muchoo peor
# cuando pasa el peor de los casos? 
# cuando se pone el pivot al final y todos los elementos ya estan ordenados
# como se puede arreglar?
# la leccion no dice, pero yo me imagino que se puede revisar primero hasta que punto ya esta ordenado (ej: hacer un each en la lista y en caso que siempre este en ascendente (mayor que n -1) regresar el array como ya esta)
# esto hara que sea o(n) en el mejor de los casos 
# y o(n log n) en el peor de los casos
#
# pero ahora tengo que plasmar como se hace este algoritmo
# primero el pivot: 
# el pivot casi siempre va hasta el final (no se en que casos no)
# una vez puesto el pivot necesitamos el boundary 
# que es el boundary?
# donde sabemos que estan todos los elementos menores al pivot (la primera vez se pone en 0 porque todavia no se ha recorrido nada)
# entonces
# primero hacemos el partition
# que es o que hace el partition?:
# el partition lo que va a ser es va a recorrer el array de left -> right
# donde left es el boundary que le pongamos (se tiene que crear la variable al inicio, ya que left va a ir avanzando)
# y right es el pivot
#
# va a recorrer y va a preguntar
# arr[left] <= arr[pivot]
# en caso que si tenemos que hacer un switch con el boundary
# arr[left], arr[boundary] = arr[boundary], arr[left]
# y aumentar el boundary
# boundary += 1
# repetimos el proceso hasta que se termine el array
# y por ultimo tenemos que hacer el switch con el pivot y el boundary 
# porque?
# para que ahora lo que este a la izquierda del pivot sea menor al pivot y lo mayor este a la derecha
# arr[boundary], arr[pivot] = arr[pivot], arr[boundary]
# y regresamos a boundary (el nuevo pivot)
#
# repetimos el proceso pero ahora con el pivot que nos regreso partition, tanto para adelante como para atras con dos funciones extras: (pivot-1 = left y pivot + 1 = right)
#
# nota: tuve que añadir una funcion que haga el wrap a quick sort para evitar el n^2
