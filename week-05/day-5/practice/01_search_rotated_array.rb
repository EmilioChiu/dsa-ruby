# [Search in Rotated Sorted Array]
# Link: https://leetcode.com/problems/search-in-rotated-sorted-array/
#
# Problem:
# There is an integer array nums sorted in ascending order (with distinct values).
#
# Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k
# such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]].
# Given the array nums after the possible rotation and an integer target, return the index of
# target if it is in nums, or -1 if it is not in nums.
#
# You must write an algorithm with O(log n) runtime complexity.
#
# Constraints:
# - 1 <= nums.length <= 5000
# - -10^4 <= nums[i] <= 10^4
# - All values of nums are unique.
# - nums is an ascending array that is possibly rotated.
# - -10^4 <= target <= 10^4
#
# Examples:
#   nums = [4,5,6,7,0,1,2], target = 0 -> 4
#   nums = [4,5,6,7,0,1,2], target = 3 -> -1
#   nums = [1], target = 0             -> -1

def search(nums, target)
  left = 0
  right = nums.length() - 1
  part_to_look_for = target >= nums[0] && nums[0] > nums[right] ? 1 : 2

  while left < right
    mid = left + (right - left) / 2 

    return mid if target == nums[mid]

    if part_to_look_for == 2
      if nums[mid] >= nums[0]
        left = mid + 1
      else
        where_to = where_to_go(target, nums, mid, left, right)
        left = where_to[:left]
        right = where_to[:right]
      end
    else
      if nums[mid] <= nums[0]
        right = mid - 1
      else
        where_to = where_to_go(target, nums, mid, left, right)
        left = where_to[:left]
        right = where_to[:right]
      end
    end
  end

  nums[left] == target ? left : -1
end

def where_to_go(target, nums, mid, left, right)
  if nums[mid] > target
    right = mid 
  else
    left = mid + 1
  end

  {right: right, left: left}
end

# Tests
puts search([4,5,6,7,0,1,2], 0) == 4
puts search([4,5,6,7,0,1,2], 3) == -1
puts search([1], 0) == -1
puts search([3,1], 1) == 1
puts search([5,1,3], 3) == 2
puts search([1,3], 3) == 1

