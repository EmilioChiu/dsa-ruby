# Two Sum (Optimizado con Hash Map)
#
# Dado un array de números enteros `nums` y un entero `target`, 
# retorna los índices de los dos números que sumen el `target`.
#
# Restricciones:
# - Solo hay una solución exacta.
# - No puedes usar el mismo elemento dos veces.
# - Debes lograr una complejidad temporal de O(n).
#
# Ejemplo:
# nums = [2, 7, 11, 15], target = 9
# Output: [0, 1] (porque nums[0] + nums[1] == 9)

def two_sum(nums, target)
  memory = {}
  nums.each_with_index do |item, index|
    wanted_value = target - item
    if memory[wanted_value]
      return [index, memory[wanted_value]]
    else
      memory[item] = index
    end
  end
end

# --- Casos de Prueba ---
def test_two_sum
  results = []
  results << (two_sum([2, 7, 11, 15], 9).sort == [0, 1])
  results << (two_sum([3, 2, 4], 6).sort == [1, 2])
  results << (two_sum([3, 3], 6).sort == [0, 1])
  
  if results.all?
    puts "✅ All tests passed!"
  else
    puts "❌ Some tests failed."
  end
end

test_two_sum
