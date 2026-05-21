# PROBLEMA: Permutations
#
# DESCRIPCION:
# Dado un array de elementos unicos, genera TODAS las permutaciones
# posibles (todas las formas de ordenar los elementos).
#
# Ejemplo:
#   permutations([1, 2]) -> [[1, 2], [2, 1]]
#
# RESTRICCIONES:
# - Debe ser una solucion recursiva
# - Array puede tener 0 a 8 elementos
# - Tiempo: O(n!) (factorial)
# - Espacio: O(n!) por el output + O(n) del call stack

def permutations(arr)
  return [arr] if arr.length <= 1

  permuts = permutations(arr[0...-1])
  last = arr[-1]
  permuts.flat_map do |sub_arr|
    range = sub_arr.length + 1
    (0...range).map do |index|
      sub_arr[0...index] + [last] + sub_arr[index..]
    end
  end
end

# --- PRUEBAS ---
result1 = permutations([])
puts "Test 1: #{result1 == [[]] ? 'PASSED' : 'FAILED'}"

result2 = permutations([1])
puts "Test 2: #{result2 == [[1]] ? 'PASSED' : 'FAILED'}"

result3 = permutations([1, 2])
puts "Test 3: #{result3.sort == [[1, 2], [2, 1]].sort ? 'PASSED' : 'FAILED'}"
puts "Test 3b: #{result3.length == 2 ? 'PASSED' : 'FAILED'}"

result4 = permutations([1, 2, 3])
puts "Test 4: #{result4.length == 6 ? 'PASSED' : 'FAILED'}"
puts "Test 4b: #{result4.include?([1, 2, 3]) && result4.include?([3, 2, 1]) ? 'PASSED' : 'FAILED'}"
