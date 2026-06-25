## [153. Find Minimum in Rotated Sorted Array]
## Link: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
## Difficulty: Medium
##
## Problem
## Suppose an array of length n sorted in ascending order is rotated between
## 1 and n times. Given the sorted rotated array nums of unique elements,
## return the minimum element of this array.
##
## You must write an algorithm that runs in O(log n) time.
##
## Constraints
## - n == nums.length
## - 1 <= n <= 5000
## - -5000 <= nums[i] <= 5000
## - All the integers of nums are unique
## - nums is sorted and rotated between 1 and n times
##
## Examples
## Input: nums = [3,4,5,1,2]
## Output: 1
##
## Input: nums = [4,5,6,7,0,1,2]
## Output: 0
##
## Input: nums = [11,13,15,17]
## Output: 11

def find_min(nums)

end

if $PROGRAM_NAME == __FILE__
  def assert_equal(expected, actual, msg = "")
    if expected == actual
      puts "PASS #{msg}"
    else
      puts "FAIL #{msg}: expected #{expected.inspect}, got #{actual.inspect}"
    end
  end

  assert_equal(1, find_min([3,4,5,1,2]), "example 1")
  assert_equal(0, find_min([4,5,6,7,0,1,2]), "example 2")
  assert_equal(11, find_min([11,13,15,17]), "example 3 (no rotation)")
  assert_equal(1, find_min([1]), "single element")
  assert_equal(0, find_min([2,0]), "two elements, rotated")
  assert_equal(1, find_min([1,2,3,4,5]), "no rotation, already sorted")
  assert_equal(1, find_min([5,1,2,3,4]), "rotated once")
  assert_equal(1, find_min([4,5,6,7,1,2,3]), "rotated at mid")

  puts "--- Todos los tests ejecutados ---"
end
