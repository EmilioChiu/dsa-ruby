## Sort an Array (LeetCode 912)
## Link: https://leetcode.com/problems/sort-an-array/

## Problem
# Given an array of integers nums, sort the array in ascending order and return it.
# You must solve the problem without using any built-in sort methods (no .sort!).

## Constraints
# - 1 <= nums.length <= 5 * 10^4
# - -5 * 10^4 <= nums[i] <= 5 * 10^4

## Examples
# sort_array([5, 2, 3, 1]) -> [1, 2, 3, 5]
# sort_array([5, 1, 1, 2, 0, 0]) -> [0, 0, 1, 1, 2, 5]

## Signature
def sort_array(nums, left = 0, right = nums.length())
  return nums if nums.length <= 1

  mid = right/2
  left_half = sort_array(nums[left...mid])
  right_half = sort_array(nums[mid..])

  nums = merge(left_half, right_half)
end

def merge(left_half, right_half)
  answer = []
  left_index = 0
  right_index = 0

  while left_index < left_half.length && right_index < right_half.length
    if left_half[left_index] < right_half[right_index]
      answer << left_half[left_index]
      left_index += 1
    else
      answer << right_half[right_index]
      right_index += 1
    end
  end

  answer += left_half[left_index..] + right_half[right_index..]
end

## Tests
puts sort_array([5, 2, 3, 1]) == [1, 2, 3, 5]
puts sort_array([5, 1, 1, 2, 0, 0]) == [0, 0, 1, 1, 2, 5]
puts sort_array([1]) == [1]
puts sort_array([]) == []

# voy a usar merge_sort, creo que es el mas simple y optimo, sin tener en cuenta la memoria
# como era?
# divides hasta que sea un array de un elemento ([4,2] -> [[4], [2]])
# luego los comparamos y juntamos ([[4], [2]] -> [2, 4])
#
# eso es en pocas palabras, pero como lo divides?
# usas un half_left y un half_right y recursion
# si el array es de length <= 1 return arr
#
# despues haces la funcion de merge
