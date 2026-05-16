z# PROBLEMA: Maximum Subarray (EXAMEN)
#
# DESCRIPCIÓN:
# Dado un arreglo de enteros 'nums', encuentra el subarray contiguo
# (con al menos un elemento) que tenga la suma más grande y devuelve su suma.
#
# Intenta implementarlo sin ver tu código del día anterior.
#
# Ejemplo:
#   Input:  [-2, 1, -3, 4, -1, 2, 1, -5, 4]
#   Output: 6
#
# RESTRICCIONES:
# - Tiempo: O(n)
# - Espacio: O(1)

def max_sub_array(nums)
  max_sum = nums[0]
  local_sum = nums[0]

  nums.each_with_index do |item, index|
    next if index == 0
    local_sum += item
    max_sum = [local_sum, max_sum, item].max
    if local_sum < 0
      local_sum = 0
    end
  end
  max_sum
end

# --- PRUEBAS ---
puts "Test 1: #{max_sub_array([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{max_sub_array([1]) == 1 ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{max_sub_array([5, 4, -1, 7, 8]) == 23 ? 'PASSED' : 'FAILED'}"
puts "Test 4: #{max_sub_array([-1]) == -1 ? 'PASSED' : 'FAILED'}"
puts "Test 4: #{max_sub_array([-2, -1]) == -1 ? 'PASSED' : 'FAILED'}"
