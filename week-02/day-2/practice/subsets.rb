# PROBLEMA: Subsets (Power Set)
#
# DESCRIPCION:
# Dado un array de elementos unicos, genera TODOS los subconjuntos
# posibles (el power set). El orden de los subconjuntos no importa.
#
# Ejemplo:
#   subsets([1, 2]) -> [[], [1], [2], [1, 2]]
#
# RESTRICCIONES:
# - Debe ser una solucion recursiva
# - Array puede tener 0 a 10 elementos
# - Tiempo: O(2^n)
# - Espacio: O(2^n) por el output + O(n) del call stack

def subsets_recursive(arr)
  return [arr] if arr == []

  subs = subsets_recursive(arr[0...-1])
  subs + subs.map { |sub| sub + [arr.last] }
end


def subsets_iterative(arr)
  answer = [[]]
  arr.each_with_index do |item, index|
    answer << [item]
    subset = []
    arr.each_with_index do |sub_item, sub_index|
      next if sub_index == index
      subset << sub_item
      answer << Array.new(subset.sort!)
    end
  end
  answer << arr
  answer.uniq
end

# --- PRUEBAS ---
result1 = subsets_recursive([])
puts "Test 1: #{result1 == [[]] ? 'PASSED' : 'FAILED'}" # solo el conjunto vacio

result2 = subsets_recursive([1])
puts "Test 2: #{result2.sort == [[], [1]].sort ? 'PASSED' : 'FAILED'}"

result3 = subsets_recursive([1, 2])
puts "Test 3: #{result3.sort == [[], [1], [2], [1, 2]].sort ? 'PASSED' : 'FAILED'}"
puts "Test 3b: #{result3.length == 4 ? 'PASSED' : 'FAILED'}"

result4 = subsets_recursive([1, 2, 3])
puts "Test 4: #{result4.length == 8 ? 'PASSED' : 'FAILED'}"
puts "Test 4b: #{result4.include?([]) && result4.include?([1,2,3]) ? 'PASSED' : 'FAILED'}"
