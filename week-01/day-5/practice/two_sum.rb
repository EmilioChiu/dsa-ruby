# PROBLEMA: Two Sum
#
# DESCRIPCIÓN:
# Dado un arreglo de enteros 'nums' y un entero 'target', devuelve los índices 
# de los dos números tales que sumen el target.
#
# Puedes asumir que cada entrada tendría exactamente una solución, y no puedes
# usar el mismo elemento dos veces. Puedes devolver la respuesta en cualquier orden.
#
# Ejemplo:
#   Input: nums = [2, 7, 11, 15], target = 9
#   Output: [0, 1] (porque nums[0] + nums[1] == 9)
#
# RESTRICCIONES:
# - Tiempo: O(n)
# - Espacio: O(n)

def two_sum(nums, target)
  prefix = {} 
  nums.each_with_index do |item, index|
    value_needed = target - item
    if prefix.has_key?(value_needed)
      return [index, prefix[value_needed]]
    end
    prefix[item] = index
  end
end

# --- PRUEBAS ---
puts "Test 1: #{two_sum([2, 7, 11, 15], 9).sort == [0, 1] ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{two_sum([3, 2, 4], 6).sort == [1, 2] ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{two_sum([3, 2, 3], 6).sort == [0, 2] ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{two_sum([3, 3], 6).sort == [0, 1] ? 'PASSED' : 'FAILED'}"

# se tendra un answer que regresara al final con los indices de los valores que sumados den el target
# idea? se puede crear un hash donde se guarde n: [i, k] donde n es el resultado de la suma de i, k
#
# otra idea, restar del target el valor del item, e ir metiendo esos valores en una lista (estos valores seran los faltantes para llegar al target, ej: target = 7, item = 4, el valor que guardariamos seria 3 (7-4))
# una vez obtenida la primera tabla, podriamos buscar 

