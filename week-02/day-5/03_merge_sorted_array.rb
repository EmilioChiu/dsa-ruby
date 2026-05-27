# [Merge Sorted Array]
# Link: https://leetcode.com/problems/merge-sorted-array/
#
# Problema:
# Dados dos arrays de enteros ordenados ascendentemente nums1 y nums2,
# junto con m y n que representan la cantidad de elementos validos en cada uno,
# fusiona nums2 en nums1 (que tiene espacio extra al final) de modo que
# nums1 quede ordenado ascendentemente.
#
# Nota: nums1 tiene longitud m + n, donde los ultimos n espacios son 0
# (placeholder). No devuelvas nada, modifica nums1 IN-PLACE.
#
# Constraints:
#   - nums1.length == m + n
#   - nums2.length == n
#   - 0 <= m, n <= 200
#   - 1 <= m + n <= 200
#   - -10^9 <= nums1[i], nums2[i] <= 10^9
#
# Ejemplos:
#   nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
#   merge(nums1, m, nums2, n) => nums1 queda [1,2,2,3,5,6]
#
#   nums1 = [1], m = 1, nums2 = [], n = 0
#   merge(nums1, m, nums2, n) => nums1 queda [1]
#
# Requisito: O(m + n) tiempo, O(1) espacio extra
#
# [-2, 0] [-3, 1, 2, 3]
# [-3, 0] [-2, 1]

def merge(nums1, m, nums2, n)
  return if n == 0
  slow = 0
  nums1.each_with_index do |item, index|
    break if index == m
    if slow < n and item > nums2[slow] 
      nums1[index], nums2[slow] = nums2[slow], nums1[index]
      slow += 1
    end
  end

  slow = 0
  (m...m+n).each do |i| 
    nums1[i] = nums2[slow]
    slow += 1
  end
end

# --- Tests ---
def run_tests
  cases = [
    { nums1: [1,2,3,0,0,0], m: 3, nums2: [2,5,6], n: 3, expected: [1,2,2,3,5,6] },
    { nums1: [1], m: 1, nums2: [], n: 0, expected: [1] },
    { nums1: [0], m: 0, nums2: [1], n: 1, expected: [1] },
    { nums1: [4,5,6,0,0,0], m: 3, nums2: [1,2,3], n: 3, expected: [1,2,3,4,5,6] },
    { nums1: [2,0], m: 1, nums2: [1], n: 1, expected: [1,2] },
  ]

  cases.each_with_index do |test, i|
    nums1 = test[:nums1]
    merge(nums1, test[:m], test[:nums2], test[:n])
    status = nums1 == test[:expected] ? "PASS" : "FAIL"
    puts "#{i+1}. #{status} | expected: #{test[:expected]}, got: #{nums1}"
  end
end

run_tests
