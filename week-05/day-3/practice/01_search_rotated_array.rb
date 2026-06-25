## [33. Search in Rotated Sorted Array]
## Link: https://leetcode.com/problems/search-in-rotated-sorted-array/
## Difficulty: Medium
##
## Problem
## There is an integer array nums sorted in ascending order (with distinct values).
## Prior to being passed to your function, nums is possibly rotated at an unknown
## pivot index k (1 <= k < nums.length) such that the resulting array is
## [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]].
## Given the array nums after the possible rotation and an integer target,
## return the index of target if it is in nums, or -1 if it is not in nums.
##
## You must write an algorithm with O(log n) runtime complexity.
##
## Constraints
## - 1 <= nums.length <= 5000
## - -10^4 <= nums[i] <= 10^4
## - All values of nums are unique
## - nums is guaranteed to be rotated at some pivot
## - -10^4 <= target <= 10^4
##
## Examples
## Input: nums = [4,5,6,7,0,1,2], target = 0
## Output: 4
##
## Input: nums = [4,5,6,7,0,1,2], target = 3
## Output: -1
##
## Input: nums = [1], target = 0
## Output: -1

# ubicar si el target esta en la primera o segunda mitad
# en caso que esta en la primera mitad asegurarnos de nunca pasarnos a la segunda mitad


def search(nums, target)
  right = nums.length() - 1
  left = 0
  first_part_of_the_array = nums[0]

  while left < right
    mid = left + (right - left) / 2

    return mid if nums[mid] == target

    if target >= first_part_of_the_array # pregunta si necesita buscar en la primera mitad
      if nums[mid] < first_part_of_the_array # aqui ya nos pasamos a la segunda mitad, sabemos que si hacemos right = mid - 1 nos acercara o nos pondra en la primera mitad
        right = mid - 1 
      else # no nos hemos pasado, podemos seguir buscando
        go_to = choose_where_to_go(nums, mid, target, right, left)
        left, right = go_to[:left], go_to[:right]
      end
    else # si target se encuentra en la segunda mitad
      if nums[mid] >= first_part_of_the_array # seguimos en la primera mitad
        left = mid + 1
      else
        go_to = choose_where_to_go(nums, mid, target, right, left)
        left, right = go_to[:left], go_to[:right]
      end
    end
  end

  nums[left] == target ? left : -1
end

def choose_where_to_go(nums, mid, target, right, left)
  if nums[mid] > target
    right = mid - 1
  else
    left = mid + 1
  end

  { left: left, right: right }
end


if $PROGRAM_NAME == __FILE__
  def assert_equal(expected, actual, msg = "")
    if expected == actual
      puts "PASS #{msg}"
    else
      puts "FAIL #{msg}: expected #{expected.inspect}, got #{actual.inspect}"
    end
  end

  assert_equal(4, search([4,5,6,7,0,1,2], 0), "example 1")
  assert_equal(-1, search([4,5,6,7,0,1,2], 3), "example 2")
  assert_equal(-1, search([1], 0), "example 3")
  assert_equal(0, search([1], 1), "single element, found")
  assert_equal(0, search([3,1], 3), "two elements, left half")
  assert_equal(1, search([3,1], 1), "two elements, right half")
  assert_equal(4, search([4,5,6,7,8,1,2,3], 8), "target in right-rotated part")
  assert_equal(2, search([5,1,2,3,4], 2), "rotated at 1")

  puts "--- Todos los tests ejecutados ---"
end

# normalmente debemos checar a la mitad sin embargo en este problema tenemos un array desordenado
# lo que quiere decir que una mitad esta al principio y otra al final, es como tomar un desk de cartas cortarlo a la mitad y pasarlo al principio
# por lo que tenemos que checar en que momento regresa al principio, como lo podemos hacer?
# creamos mid como siempre, luego debemos checar si es menor a left (esto nos indicara que ya estamos en la segunda mitad, la que antes era el principio) y si es mayor significara que todavia no encontramos ese quiebre
# y como buscamos?
# depende del target, si se nos pide que sea mayor a left (primera mitad) tendremos que quedarnos en esa mitad, pero si nos pide que sea mayor a left, tendremos que buscar el punto de quiebre y buscar en la segunda mitad
# podemos hacerlo en dos funciones, una que lo que haga es buscar el punto de quiebre y regresar la mitad donde esta el target
# y la segunda que sea para buscar el target en el array ya ordenado y con certeza de que el target esta en esa mitad
# la otra forma es hacerlo todo en la misma funcion revisar la mitad y checar si es mayor o menor al target y revisar si es mayor o menor a left (esto nos indicara si ya pasamos la primera mitad)


# first version:
# def search(nums, target)
#   return nums[0] == target ? 0 : -1 if nums.length == 1
#   answer = return_wantend_array(nums, target)
#   array_ordered = answer[1]
#   start = target < nums[0] ? answer[0] : 0

#   left = 0 
#   right = array_ordered.length() - 1 

#   while left < right
#     mid = left + (right - left) / 2

#     return mid + start if array_ordered[mid] == target

#     if target > array_ordered[mid]
#       left = mid + 1
#     else 
#       right = mid - 1
#     end
#   end

#   array_ordered[left] == target ? start + left : -1
# end

# def return_wantend_array(unorder_arr, target)
#   left = 0
#   right = unorder_arr.length() - 1
#   first_part_of_the_array = 0
#   part_of_array_wanted = target >= unorder_arr[left] ? 1 : 2
#   answer = []

#   while left < right
#     mid = left + (right - left) / 2

#     if unorder_arr[first_part_of_the_array] > unorder_arr[mid] # indicador si estamos en la segunda parte del array
#       right = mid - 1
#     else
#       left = mid + 1
#     end
#   end
#   start = unorder_arr[left] < unorder_arr[left - 1] ? left : left + 1

#   if part_of_array_wanted == 1
#     answer = unorder_arr[0...start]
#   else
#     answer = unorder_arr[start..-1]
#   end
#   [start, answer]
# end
