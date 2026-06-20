## [704. Binary Search]
## Link: https://leetcode.com/problems/binary-search/
##
## Problem
## Given an array of integers nums which is sorted in ascending order,
## and an integer target, write a function to search target in nums.
## If target exists, then return its index. Otherwise, return -1.
##
## You must write an algorithm with O(log n) runtime complexity.
##
## Constraints
## - 1 <= nums.length <= 10^4
## - -10^4 < nums[i], target < 10^4
## - All the integers in nums are unique
## - nums is sorted in ascending order
##
## Examples
## Input: nums = [-1,0,3,5,9,12], target = 9
## Output: 4
## Explanation: 9 exists in nums and its index is 4
##
## Input: nums = [-1,0,3,5,9,12], target = 2
## Output: -1
## Explanation: 2 does not exist in nums so return -1

def search(nums, target)
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

  -1
end

if $PROGRAM_NAME == __FILE__
  def assert_equal(expected, actual, msg = "")
    if expected == actual
      puts "PASS #{msg}"
    else
      puts "FAIL #{msg}: expected #{expected.inspect}, got #{actual.inspect}"
    end
  end

  assert_equal(4, search([-1,0,3,5,9,12], 9), "target exists in right half")
  assert_equal(-1, search([-1,0,3,5,9,12], 2), "target does not exist")
  assert_equal(0, search([5], 5), "single element, target exists")
  assert_equal(-1, search([5], 1), "single element, target missing")
  assert_equal(0, search([1,2,3,4,5], 1), "target at leftmost")
  assert_equal(4, search([1,2,3,4,5], 5), "target at rightmost")
  assert_equal(2, search([-10,-5,0,3,7,12,20], 0), "target in middle, negative numbers")
  assert_equal(-1, search([], 1), "empty array") if [].length == 0

  puts "--- Todos los tests ejecutados ---"
end
