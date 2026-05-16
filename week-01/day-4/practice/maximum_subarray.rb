# PROBLEMA: Maximum Subarray
#
# DESCRIPCIÓN:
# Dado un arreglo de enteros 'nums', encuentra el subarray contiguo
# (con al menos un elemento) que tenga la suma más grande y devuelve su suma.
#
# Ejemplos:
#   Input:  [-2, 1, -3, 4, -1, 2, 1, -5, 4]
#   Output: 6  (subarray [4, -1, 2, 1])
#
#   Input:  [5, 4, -1, 7, 8]
#   Output: 23
#
# RESTRICCIONES:
# - Tiempo: O(n)
# - Espacio: O(1)

def max_sub_array(nums)
  max_sub = nums[0]
  sum = nums[0]

  nums.each_with_index do |item, index|
    next if index == 0
    if sum < 0 
      sum = 0
    end
    sum += item
    max_sub = [max_sub, sum].max
  end
  max_sub
end

# --- PRUEBAS ---
puts "Test 1: #{max_sub_array([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{max_sub_array([1]) == 1 ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{max_sub_array([5, 4, -1, 7, 8]) == 23 ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{max_sub_array([5, 4, -4]) == 9 ? 'PASSED' : 'FAILED'}"
puts "Test 4: #{max_sub_array([-1]) == -1 ? 'PASSED' : 'FAILED'}"

