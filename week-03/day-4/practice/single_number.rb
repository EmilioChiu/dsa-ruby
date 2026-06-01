require 'set'
## Single Number
# Link: https://leetcode.com/problems/single-number/

### Problem
# Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

# You must implement a solution with a linear runtime complexity and use only constant extra space.

### Constraints
# - 1 <= nums.length <= 3 * 10^4
# - -3 * 10^4 <= nums[i] <= 3 * 10^4
# - Each element appears twice except for one element which appears once.

### Examples
# Input: nums = [2,2,1]
# Output: 1

# Input: nums = [4,1,2,1,2]
# Output: 4

# Input: nums = [1]
# Output: 1

### Signature
def single_number(nums)
  answer = nums[0]


  nums.each_with_index do |item, index|
    next if index == 0
    answer ^= item
  end

  answer
end

### Tests
puts single_number([2,2,1]) == 1
puts single_number([4,1,2,1,2]) == 4
puts single_number([1]) == 1
puts single_number([-1,-1,-2]) == -2
