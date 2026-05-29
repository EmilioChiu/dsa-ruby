# Maximum Sum Subarray of Size K
#
# Dado un array de números positivos y un entero positivo 'k',
# encuentra la suma máxima de cualquier subarray contiguo de tamaño 'k'.
#
# Ejemplo:
# Input: [2, 1, 5, 1, 3, 2], k=3
# Output: 9 (El subarray [5, 1, 3] suma 9)
#
# Restricciones:
# - Complejidad temporal deseada: O(n)
# - Complejidad espacial: O(1)

def max_sum_subarray(arr, k)
  start = 0
  max_sum = 0
  local_sum = 0

  (0...k).each do |i|
    max_sum += arr[i]
    local_sum += arr[i]
  end

  (k...arr.length).each do |i|
    local_sum += arr[i]
    local_sum -= arr[start]
    start += 1

    max_sum = local_sum if local_sum >= max_sum 
  end

  max_sum
end

# --- Casos de Prueba ---
def test_max_sum
  puts "Test 1: #{max_sum_subarray([2, 1, 5, 1, 3, 2], 3) == 9 ? 'PASSED' : 'FAILED'}"
  puts "Test 2: #{max_sum_subarray([2, 3, 4, 1, 5], 2) == 7 ? 'PASSED' : 'FAILED'}"
  puts "Test 3: #{max_sum_subarray([1, 2, 3], 3) == 6 ? 'PASSED' : 'FAILED'}"
end

test_max_sum
