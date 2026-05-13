# [0, 1, 2, 3] -> [3, 2, 1, 0]
def reverse_in_place(arr)
  left = 0
  right = arr.length - 1

  while left < right
    arr[left], arr[right] = arr[right], arr[left]
    left += 1
    right -= 1
  end
  arr
end

# Pruebas para validar tu código
test_arr = [1, 2, 3, 4, 5]
reverse_in_place(test_arr)
puts "Test 1: #{test_arr == [5, 4, 3, 2, 1] ? 'PASSED' : 'FAILED'} (#{test_arr})"

test_arr2 = ["a", "b", "c"]
reverse_in_place(test_arr2)
puts "Test 2: #{test_arr2 == ["c", "b", "a"] ? 'PASSED' : 'FAILED'} (#{test_arr2})"
