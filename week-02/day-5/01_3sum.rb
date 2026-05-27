# [3Sum]
# Link: https://leetcode.com/problems/3sum/
#
# Problema:
# Dado un array de enteros nums, devuelve todos los triplets
# [nums[i], nums[j], nums[k]] tal que i != j, i != k, j != k,
# y nums[i] + nums[j] + nums[k] == 0.
#
# Constraints:
#   - 3 <= nums.length <= 3000
#   - -10^5 <= nums[i] <= 10^5
#
# Ejemplos:
#   three_sum([-1,0,1,2,-1,-4]) => [[-1,-1,2],[-1,0,1]]
#   three_sum([0,1,1]) => []
#   three_sum([0,0,0]) => [[0,0,0]]
#
# Requisito: O(n^2) tiempo, O(1) espacio extra (sin contar output)

def three_sum(nums)
  nums = nums.sort
  target = 0
  answer = []

  nums.each_with_index do |item, index|
    if index != 0 and nums[index] == nums[index-1]
      next
    end

    left = index + 1
    right = nums.length() - 1
    while left < right
      sum = nums[index] + nums[left] + nums[right]

      if sum == target
        answer << [nums[index], nums[left], nums[right]]
        left += 1
        while nums[left] == nums[left-1] and left < right
          left += 1
        end
      elsif sum > target
        right -= 1
      else
        left += 1
      end
    end
  end
  answer
end

# --- Tests ---
def run_tests
  cases = [
    { input: [-1, 0, 1, 2, -1, -4], expected: [[-1, -1, 2], [-1, 0, 1]] },
    { input: [0, 1, 1], expected: [] },
    { input: [0, 0, 0], expected: [[0, 0, 0]] },
    { input: [1, 2, -2, -1], expected: [] },
    { input: [-2, 0, 0, 2, 2], expected: [[-2, 0, 2]] }
  ]

  cases.each_with_index do |test, i|
    result = three_sum(test[:input])
    sorted = result.map(&:sort).sort
    expected_sorted = test[:expected].map(&:sort).sort
    status = sorted == expected_sorted ? 'PASS' : 'FAIL'
    puts "#{i + 1}. #{status} | expected: #{test[:expected]}, got: #{result}"
  end
end

run_tests
