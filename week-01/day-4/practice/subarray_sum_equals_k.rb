# PROBLEMA: Subarray Sum Equals K
#
# DESCRIPCIÓN:
# Dado un arreglo de enteros 'nums' y un entero 'k', devuelve el número
# total de subarrays contiguos cuya suma sea igual a k.
#
# Ejemplos:
#   Input:  nums = [1, 1, 1], k = 2
#   Output: 2  (subarrays: [1, 1] en índices 0-1 y 1-2)
#
#   Input:  nums = [1, 2, 3], k = 3
#   Output: 2  (subarrays: [1, 2] y [3])
#
# RESTRICCIONES:
# - Tiempo: O(n)
# - Espacio: O(n)

def subarray_sum(nums, k)
  counter = 0
  subarray = {0 => 1}
  local_sum = 0

  nums.each do |item|
    local_sum += item
    diff = local_sum - k

    counter += subarray[diff] ? subarray[diff] : 0

    subarray[local_sum] = subarray[local_sum] ? subarray[local_sum] + 1 : subarray[local_sum] = 1
  end
  counter
end


# --- PRUEBAS ---
puts "Test 1: #{subarray_sum([1, 1, 1], 2) == 2 ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{subarray_sum([1, 2, 3], 3) == 2 ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{subarray_sum([1, -1, 0], 0) == 3 ? 'PASSED' : 'FAILED'}"
puts "Test 4: #{subarray_sum([3, 4, 7, 2, -3, 1, 4, 2], 7) == 4 ? 'PASSED' : 'FAILED'}"

# si la suma es menor o igual al target que siga recorriendo el array, pero si la suma es mayor al target que vaya restando desde el principio hasta que sea menor o igual al target
# por cada item sumado o restado checar si es igual al target
# si la suma es igual al target que sume uno al counter
# si llega al final 
# regresar el counter
