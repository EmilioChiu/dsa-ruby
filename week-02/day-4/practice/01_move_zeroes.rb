# Move Zeroes
# Dado un array nums, mueve todos los ceros al final manteniendo el orden
# relativo de los elementos no-cero. Debe hacerse IN-PLACE.
#
# Constraints:
#   - 1 <= nums.length <= 10^4
#   - -2^31 <= nums[i] <= 2^31 - 1
#
# Debes modificarlo in-place, sin crear un nuevo array.
#
# Ejemplo:
#   move_zeroes([0, 1, 0, 3, 12]) => [1, 3, 12, 0, 0]
#   move_zeroes([0]) => [0]
#
# Requisito: O(n) tiempo, O(1) espacio extra

def move_zeroes(nums)
  slow = 0
  target = 0

  nums.each_with_index do |item, index|
    if item != target
      nums[index], nums[slow] = nums[slow], nums[index]
      slow += 1
    end
  end
end

# --- Tests ---
def run_tests
  cases = [
    { input: [0, 1, 0, 3, 12], expected: [1, 3, 12, 0, 0] },
    { input: [0], expected: [0] },
    { input: [1, 2, 3], expected: [1, 2, 3] },
    { input: [0, 0, 1], expected: [1, 0, 0] },
    { input: [4, 0, 0, 0, 5], expected: [4, 5, 0, 0, 0] },
  ]

  cases.each_with_index do |test, i|
    arr = test[:input].dup
    move_zeroes(arr)
    result = arr == test[:expected] ? "PASS" : "FAIL"
    puts "#{i + 1}. #{result} | expected: #{test[:expected]}, got: #{arr}"
  end
end

run_tests
