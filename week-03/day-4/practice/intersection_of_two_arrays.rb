# frozen_string_literal: true

require('set')
# Intersection of Two Arrays
# Link: https://leetcode.com/problems/intersection-of-two-arrays/

### Problem
# Given two integer arrays nums1 and nums2, return an array of their intersection.
# Each element in the result must be unique and you may return the result in any order.

### Constraints
# - 1 <= nums1.length, nums2.length <= 1000
# - 0 <= nums1[i], nums2[i] <= 1000

### Examples
# Input: nums1 = [1,2,2,1], nums2 = [2,2]
# Output: [2]

# Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
# Output: [9,4]
# Explanation: [4,9] is also accepted.

### Signature
def intersection(nums1, nums2)
  answer = Set.new()
  if nums1.length >= nums2.length
    min_array = Set.new(nums1)
    max_array = nums2
  else
    min_array = Set.new(nums2)
    max_array = nums1
  end

  max_array.each do |item|
    answer << item if min_array.include?(item)
  end
  answer.to_a
end

### Tests
puts intersection([1, 2, 2, 1], [2, 2]) == [2]
puts intersection([4, 9, 5], [9, 4, 9, 8, 4]).sort == [4, 9]
puts intersection([1, 2, 3], [4, 5, 6]) == []
puts intersection([1], [1]) == [1]
puts intersection([], [1, 2]) == []
