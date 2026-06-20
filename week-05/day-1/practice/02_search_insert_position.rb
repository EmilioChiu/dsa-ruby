## [35. Search Insert Position]
## Link: https://leetcode.com/problems/search-insert-position/
##
## Problem
## Given a sorted array of distinct integers and a target value,
## return the index if the target is found. If not, return the index
## where it would be if it were inserted in order.
##
## You must write an algorithm with O(log n) runtime complexity.
##
## Constraints
## - 1 <= nums.length <= 10^4
## - -10^4 <= nums[i] <= 10^4
## - nums contains distinct values sorted in ascending order
## - -10^4 <= target <= 10^4
##
## Examples
## Input: nums = [1,3,5,6], target = 5
## Output: 2
##
## Input: nums = [1,3,5,6], target = 2
## Output: 1
##
## Input: nums = [1,3,5,6], target = 7
## Output: 4

def search_insert(nums, target)
  left = 0
  right = nums.length() - 1

  while left <= right
    mid = left + (right - left) / 2

    if nums[mid] == target
      return mid
    elsif nums[mid] > target
      right = mid - 1
    else
      left = mid + 1
    end
  end

  left
end

if $PROGRAM_NAME == __FILE__
  def assert_equal(expected, actual, msg = "")
    if expected == actual
      puts "PASS #{msg}"
    else
      puts "FAIL #{msg}: expected #{expected.inspect}, got #{actual.inspect}"
    end
  end

  assert_equal(2, search_insert([1,3,5,6], 5), "target exists in middle")
  assert_equal(1, search_insert([1,3,5,6], 2), "target inserted in middle")
  assert_equal(4, search_insert([1,3,5,6], 7), "target inserted at end")
  assert_equal(0, search_insert([1,3,5,6], 0), "target inserted at beginning")
  assert_equal(0, search_insert([1], 0), "single element, insert before")
  assert_equal(1, search_insert([1], 2), "single element, insert after")
  assert_equal(0, search_insert([1], 1), "single element, target exists")

  puts "--- Todos los tests ejecutados ---"
end

# sigue el patron natural, solo que al final obtienes mid y ese es el inidice mas cercano a target, por lo que deberia estar uno adelante u atras dependiendo si es mayor o menor del target
# vamos a revisar si estoy en lo correcto
