# PROBLEMA: Squares of a Sorted Array
#
# DESCRIPCIÓN:
# Dado un arreglo de enteros 'nums' ordenado de forma ascendente, 
# devuelve un nuevo arreglo con los cuadrados de cada número, 
# también ordenado de forma ascendente.
#
# EL TRUCO:
# Al elevar al cuadrado, los números negativos grandes se vuelven positivos muy grandes.
# Ej: [-4, -1, 0, 3] -> [16, 1, 0, 9]. 
# Como ves, el orden se rompe. Tu misión es que el resultado final sea [0, 1, 9, 16]
# y que lo hagas recorriendo el arreglo UNA SOLA VEZ.
#
# EXPECTATIVAS:
# - Input: Array ordenado (ej: [-4, -1, 0, 3, 10])
# - Output: Array de cuadrados ordenado (ej: [0, 1, 9, 16, 100])
#
# RESTRICCIONES TÉCNICAS:
# - Tiempo deseado: O(n) -> No puedes usar .sort al final (sería O(n log n)).
# - Espacio deseado: O(n) -> Para el nuevo arreglo de resultados.
#
# PISTA:
# Los cuadrados más grandes siempre estarán en los extremos (ya sea el negativo 
# más pequeño o el positivo más grande). Usa un puntero al inicio (left) 
# y otro al final (right), y ve llenando un nuevo arreglo DESDE EL FINAL hacia el inicio.

def sorted_squares(nums)
  return nums if nums.length() <= 1
  left = 0
  right = nums.length() -1
  arr = Array.new(nums.length)
  index = -1

  while left <= right
    if nums[left] ** 2 > nums[right] ** 2 
      arr[index] = nums[left] ** 2
      left += 1
    else
      arr[index] = nums[right] ** 2
      right -= 1 
    end
    index -= 1
  end
  arr
end

# --- PRUEBAS ---
puts "Test 2: #{sorted_squares([-7, -3, 2, 3, 11]) == [4, 9, 9, 49, 121] ? 'PASSED' : 'FAILED'}"
