## [162. Find Peak Element]
## Link: https://leetcode.com/problems/find-peak-element/
## Difficulty: Medium
##
## Problem
## A peak element is an element that is strictly greater than its neighbors.
## Given a 0-indexed integer array nums, find a peak element, and return its
## index. If the array contains multiple peaks, return the index to any of
## the peaks.
##
## You may imagine that nums[-1] = nums[n] = -infinity. In other words,
## an element is always considered to be strictly greater than a neighbor
## that is outside the array.
##
## You must write an algorithm that runs in O(log n) time.
##
## Constraints
## - 1 <= nums.length <= 1000
## - -2^31 <= nums[i] <= 2^31 - 1
## - nums[i] != nums[i + 1] for all valid i
##
## Examples
## Input: nums = [1,2,3,1]
## Output: 2 (nums[2] = 3 is a peak)
##
## Input: nums = [1,2,1,3,5,6,4]
## Output: 5 (nums[5] = 6 is a peak) or 1 (nums[1] = 2)

def find_peak_element(nums)
  left = 0
  right = nums.length() - 1

  while left < right
    mid = left + (right - left) / 2

    if nums[mid+1] > nums[mid]
      left = mid + 1
    else
      right = mid
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

  result1 = find_peak_element([1,2,3,1])
  puts "PASS example 1: got index #{result1} (value #{[1,2,3,1][result1]})" if [1,2,3,1][result1] == 3

  result2 = find_peak_element([1,2,1,3,5,6,4])
  peak2 = [1,2,1,3,5,6,4][result2]
  puts "PASS example 2: got index #{result2} (value #{peak2})" if peak2 == 2 || peak2 == 6

  assert_equal(0, find_peak_element([1]), "single element")
  assert_equal(1, find_peak_element([1,2]), "strictly increasing")
  assert_equal(0, find_peak_element([2,1]), "strictly decreasing")
  assert_equal(2, find_peak_element([1,2,3,2,1]), "peak at center")

  puts "--- Todos los tests ejecutados ---"
end

# por lo que entendi entra un array donde puede se tiene que revisar los vecinos de mid, ej:
# si mid + 1 es mayor se hace un left = mid + 1
# si no se puede hacer un right = mid
