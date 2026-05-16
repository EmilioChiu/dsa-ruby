# PROBLEMA: Range Sum Query - Immutable
#
# DESCRIPCIÓN:
# Dado un arreglo de enteros 'nums', implementa la clase NumArray que puede
# responder consultas de suma en un rango [i, j] (inclusive) de forma eficiente.
#
# Ejemplo:
#   nums = [-2, 0, 3, -5, 2, -1]
#   NumArray.new(nums).sum_range(0, 2) -> 1
#   NumArray.new(nums).sum_range(2, 5) -> -1
#   NumArray.new(nums).sum_range(0, 5) -> -3
#
# RESTRICCIONES:
# - Múltiples llamadas a sum_range() sobre la misma instancia
# - Tiempo constructor: O(n)
# - Tiempo sum_range: O(1)
# - Espacio: O(n) incluyendo el arreglo de prefix sums

class NumArray
  def initialize(nums)
    @prefix = Array.new(nums.length, 0)
    @prefix[0] = nums[0]

    @prefix.each_with_index do |item, index|
      next if index == 0
      @prefix[index] = @prefix[index-1] + nums[index]
    end
  end

  def sum_range(start, final)
    return @prefix[final] if start == 0
    @prefix[final] - @prefix[start - 1] 
  end
end

# --- PRUEBAS ---
nums = [-2, 0, 3, -5, 2, -1]
obj = NumArray.new(nums)
puts "Test 1: #{obj.sum_range(0, 2) == 1 ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{obj.sum_range(2, 5) == -1 ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{obj.sum_range(0, 5) == -3 ? 'PASSED' : 'FAILED'}"
puts "Test 4: #{obj.sum_range(0, 0) == -2 ? 'PASSED' : 'FAILED'}"
