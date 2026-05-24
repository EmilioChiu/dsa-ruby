# PROBLEMA: 3Sum
#
# Dado un arreglo de enteros 'nums', encuentra todos los triplets
# [nums[i], nums[j], nums[k]] tal que i != j, i != k, j != k,
# y nums[i] + nums[j] + nums[k] == 0.
#
# RESTRICCIONES:
# - El conjunto solucion no debe contener triplets duplicados
# - Los triplets pueden devolverse en cualquier orden
# - Resolver con two pointers (despues de ordenar)
#
# @param {Integer[]} nums
# @return {Integer[][]} array de triplets

def three_sum(nums)
  nums = nums.sort
  right = nums.length - 1
  left = 1
  answer = []

  nums.each_with_index do |item, index|
    next if index == 0

    target = -nums[index - 1]
    while left < right
      local_sum = nums[right] + nums[left]
      puts("local sum=#{local_sum}, target=#{target}")
      if local_sum == target
        answer << [nums[right], nums[left], nums[index - 1]]
        left += 1
        right -= 1
      elsif local_sum <= target
        left += 1
      elsif local_sum >= target
        right -= 1
      end
    end
    left = index + 1
    right = nums.length - 1
  end
  answer.uniq
end

def three_sum(nums)
  nums = nums.sort
  answer = []

  nums.each_with_index do |item, index|
    next if index > 0 and item == nums[index - 1]

    left = index + 1
    right = (nums.length - 1)
    while left < right
      sum = item + nums[right] + nums[left]
      if sum > 0
        right -= 1
      elsif sum < 0
        left += 1
      else
        answer.append([item, nums[right], nums[left]])
        left += 1
        while left < right and nums[left] == nums[left-1] 
          left += 1
        end
      end
    end
  end

  answer
end

# --- PRUEBAS ---
result1 = three_sum([-1, 0, 1, 2, -1, -4]).sort
expected1 = [[-1, -1, 2], [-1, 0, 1]].sort
puts "Test 1: #{result1 == expected1 ? 'PASS' : 'FAIL'}"

result2 = three_sum([0, 1, 1]).sort
expected2 = [].sort
puts "Test 2: #{result2 == expected2 ? 'PASS' : 'FAIL'}"

result3 = three_sum([0, 0, 0]).sort
expected3 = [[0, 0, 0]].sort
puts "Test 3: #{result3 == expected3 ? 'PASS' : 'FAIL'}"
