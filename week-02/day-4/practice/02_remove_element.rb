# Remove Element
# Dado un array nums y un valor val, mueve todas las ocurrencias de val
# al final IN-PLACE (o simplemente sobreescribe). El orden relativo de los
# elementos que NO son val puede cambiar o mantenerse, segun tu enfoque.
#
# Constraints:
#   - 0 <= nums.length <= 100
#   - 0 <= nums[i] <= 50
#   - 0 <= val <= 100
#
# No uses delete_at, delete, reject! ni metodos que desplacen O(n).
# Solo reacomoda los valores con asignacion directa por indice.
#
# Contrato (como en LeetCode):
#   - Devuelve k = cantidad de elementos que NO son val
#   - Los primeros k elementos de nums deben ser los valores que no son val
#   - El resto de nums (posiciones k..n-1) puede tener cualquier valor
#   - El caller solo leera los primeros k elementos
#
# Ejemplo:
#   nums = [3, 2, 2, 3], val = 3 => return 2, nums[0..1] = [2, 2]
#   nums = [0, 1, 2, 2, 3, 0, 4, 2], val = 2 => return 5, nums[0..4] = [0, 1, 4, 0, 3]
#
# Requisito: O(n) tiempo, O(1) espacio extra

def remove_element(nums, val)
  slow = 0

  nums.each_with_index do |item, index|
    if item != val
      nums[index], nums[slow] = nums[slow], nums[index]
      slow += 1
    end
  end
  slow
end

# --- Tests ---
def run_tests
  cases = [
    { input: [[3, 2, 2, 3], 3], expected: [2, [2, 2]] },
    { input: [[0, 1, 2, 2, 3, 0, 4, 2], 2], expected: [5, [0, 1, 4, 0, 3]] },
    { input: [[], 0], expected: [0, []] },
    { input: [[1], 1], expected: [0, []] },
    { input: [[1, 2, 3], 4], expected: [3, [1, 2, 3]] },
  ]

  cases.each_with_index do |test, i|
    nums = test[:input][0].dup
    val = test[:input][1]
    k = remove_element(nums, val)
    first_k = nums.first(k).sort
    expected_k = test[:expected][0]
    expected_first_k = test[:expected][1].sort
    result = (k == expected_k && first_k == expected_first_k) ? "PASS" : "FAIL"
    puts "#{i + 1}. #{result} | k=#{k}, first_k=#{nums.first(k).inspect}"
  end
end

run_tests

