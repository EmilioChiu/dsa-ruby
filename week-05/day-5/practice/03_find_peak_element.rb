# [Find Peak Element]
# Link: https://leetcode.com/problems/find-peak-element/
#
# Problem:
# A peak element is an element that is strictly greater than its neighbors.
#
# Given a 0-indexed integer array nums, find a peak element, and return its index.
# If the array contains multiple peaks, return the index to any of the peaks.
#
# You may imagine that nums[-1] = nums[n] = -infinity. In other words, an element
# is always considered to be strictly greater than a neighbor that is outside the array.
#
# You must write an algorithm that runs in O(log n) time.
#
# Constraints:
# - 1 <= nums.length <= 1000
# - -2^31 <= nums[i] <= 2^31 - 1
# - nums[i] != nums[i+1] for all valid i
#
# Examples:
#   nums = [1,2,3,1]     -> 2
#   nums = [1,2,1,3,5,6,4] -> 1 or 5

def find_peak_element(nums)
  left = 0
  right = nums.length() - 1

  while left < right
    mid = left + (right-left) /2

    if nums[mid] < nums[mid+1]
      left = mid + 1
    else
      right = mid
    end
  end

  left
end

# Tests
puts find_peak_element([1,2,3,1]) == 2
result = find_peak_element([1,2,1,3,5,6,4])
puts result == 1 || result == 5
puts find_peak_element([1]) == 0
puts find_peak_element([2,1]) == 0
puts find_peak_element([1,2]) == 1

# se tiene que revisar el neighbor de la derecha n + 1, si es mayor te mueves
