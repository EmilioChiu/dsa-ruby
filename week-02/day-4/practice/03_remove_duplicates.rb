# Remove Duplicates from Sorted Array
# Dado un array SORTEADO nums, reacomoda los elementos unicos al inicio
# IN-PLACE. Devuelve k = la cantidad de elementos unicos.
#
# Contrato (como en LeetCode):
#   - Los primeros k elementos de nums deben ser los unicos en orden original
#   - El resto de nums (posiciones k..n-1) puede tener cualquier valor
#   - El caller solo leera los primeros k elementos
#
# Constraints:
#   - 1 <= nums.length <= 3 * 10^4
#   - -100 <= nums[i] <= 100
#   - nums esta ordenado en orden ascendente
#
# No uses delete_at, uniq!, reject! ni metodos que desplacen O(n).
# Solo usa asignacion directa por indice (O(1)).
#
# Ejemplo:
#   nums = [1, 1, 2] => return 2, nums[0..1] = [1, 2]
#   nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4] => return 5, nums[0..4] = [0, 1, 2, 3, 4]
#
# Requisito: O(n) tiempo, O(1) espacio extra

def remove_duplicates(nums)
  slow = 1
  memory = nums[0]

  nums.each_with_index do |item, index|
    next if index == 0
    next if nums[index] == memory

    nums[index], nums[slow] = nums[slow], nums[index]
    memory = item
    slow += 1
  end
  slow
end

# --- Tests ---
def run_tests
  cases = [
    { input: [1, 1, 2], expected: [2, [1, 2]] },
    { input: [0, 0, 1, 1, 1, 2, 2, 3, 3, 4], expected: [5, [0, 1, 2, 3, 4]] },
    { input: [1], expected: [1, [1]] },
    { input: [1, 1, 1], expected: [1, [1]] },
    { input: [1, 2, 3], expected: [3, [1, 2, 3]] }
  ]

  cases.each_with_index do |test, i|
    nums = test[:input].dup
    k = remove_duplicates(nums)
    first_k = nums.first(k)
    result = k == test[:expected][0] && first_k == test[:expected][1] ? 'PASS' : 'FAIL'
    puts "#{i + 1}. #{result} | k=#{k}, first_k=#{first_k.inspect}"
  end
end

run_tests
