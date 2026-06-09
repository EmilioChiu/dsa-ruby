require 'set'
# Problema: Top K Frequent Elements
#
# Dado un array de enteros 'nums' y un entero 'k', devuelve los 'k' 
# elementos más frecuentes. Puedes devolver la respuesta en cualquier orden.
#
# Ejemplo 1:
# Input: nums = [1,1,1,2,2,3], k = 2
# Output: [1,2]
#
# Ejemplo 2:
# Input: nums = [1], k = 1
# Output: [1]
#
# Restricciones:
# - 1 <= nums.length <= 10^5
# - k está en el rango [1, número de elementos únicos en el array].
# - Es garantizado que la respuesta es única.
# - Objetivo: Mejor que O(n log n) tiempo.

def top_k_frequent(nums, k)
  memory = Hash.new(0)
  kubs = Array.new(nums.length).map { |a| a = [] }
  answer = []

  nums.each_with_index do |item, index|
    memory[item] += 1
  end

  memory.each do |key, value|
    kubs[value-1] << key
  end
  
  left = kubs.length - 1
  while left >= 0 and k > answer.length
    answer.concat(kubs[left])
    left -= 1
  end

  answer
end

# Casos de prueba para validación automática
def test_solution
  tests = [
    { input: [[1,1,1,2,2,3], 2], expected: [1,2] },
    { input: [[1], 1], expected: [1] },
    { input: [[4,1,-1,2,-1,2,3], 2], expected: [-1,2] }
  ]

  tests.each_with_index do |t, i|
    res = top_k_frequent(t[:input][0], t[:input][1]).sort
    expected = t[:expected].sort
    if res == expected
      puts "Test #{i+1}: PASSED"
    else
      puts "Test #{i+1}: FAILED (Expected #{expected}, got #{res})"
    end
  end
end

test_solution if __FILE__ == $0
