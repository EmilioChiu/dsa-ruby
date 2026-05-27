# [Climbing Stairs]
# Link: https://leetcode.com/problems/climbing-stairs/
#
# Problema:
# Estas subiendo una escalera de n escalones. Puedes saltar 1 o 2 escalones
# en cada movimiento. Encuentra el numero de formas distintas de llegar al
# escalon n.
#
# Constraints:
#   - 1 <= n <= 45
#
# Ejemplos:
#   climb_stairs(2) => 2  (1+1, 2)
#   climb_stairs(3) => 3  (1+1+1, 1+2, 2+1)
#
# Requisito: O(n) tiempo, O(1) espacio extra

def climb_stairs(n)
  return n if n < 2

  j = 1
  x = 2

  (3..n).each do |_i|
    j, x = x, j + x
  end
  x
end

# --- Tests ---
def run_tests
  cases = [
    { input: 1, expected: 1 },
    { input: 2, expected: 2 },
    { input: 3, expected: 3 },
    { input: 4, expected: 5 },
    { input: 5, expected: 8 },
    { input: 10, expected: 89 },
    { input: 45, expected: 1_836_311_903 }
  ]

  cases.each_with_index do |test, i|
    result = climb_stairs(test[:input])
    status = result == test[:expected] ? 'PASS' : 'FAIL'
    puts "#{i + 1}. #{status} | input: #{test[:input]}, expected: #{test[:expected]}, got: #{result}"
  end
end

run_tests
