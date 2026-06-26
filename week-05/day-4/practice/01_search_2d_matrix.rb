# typed: strict

=begin
## [74] Search a 2D Matrix
Link: https://leetcode.com/problems/search-a-2d-matrix/

### Problem
Write an efficient algorithm that searches for a value target in an m x n
integer matrix. This matrix has the following properties:
- Integers in each row are sorted in ascending order from left to right.
- The first integer of each row is greater than the last integer of the
  previous row.

### Constraints
- m == matrix.length
- n == matrix[i].length
- 1 <= m, n <= 100
- -10^4 <= matrix[i][j], target <= 10^4

### Examples
Input:  matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
Output: true

Input:  matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
Output: false
=end

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  m = matrix.length
  n = matrix[0].length

  left = 0
  right = m * n 

  while left < right
    mid = left + (right - left) / 2
    row_to_look = (mid / n).floor
    index_to_look = mid - (row_to_look * n)
    current_element = matrix[row_to_look][index_to_look]

    return true if current_element == target

    if current_element < target
      left = mid + 1
    else 
      right = mid
    end
  end

  false
end

# Test cases
if __FILE__ == $0
  # Example 1
  matrix = [
    [1, 3, 5, 7],
    [10, 11, 16, 20],
    [23, 30, 34, 60]
  ]
  raise "Example 1 failed" unless search_matrix(matrix, 3) == true

  # Example 2
  raise "Example 2 failed" unless search_matrix(matrix, 13) == false

  # Single element
  raise "Single element found" unless search_matrix([[1]], 1) == true
  raise "Single element not found" unless search_matrix([[1]], 0) == false

  # Single row
  raise "Single row found" unless search_matrix([[1, 3, 5]], 5) == true
  raise "Single row not found" unless search_matrix([[1, 3, 5]], 4) == false

  # Single column
  raise "Single col found" unless search_matrix([[1], [3], [5]], 5) == true
  raise "Single col not found" unless search_matrix([[1], [3], [5]], 4) == false

  # Negative numbers
  raise "Negative found" unless search_matrix([[-10, -5], [-3, 0]], -3) == true
  raise "Negative not found" unless search_matrix([[-10, -5], [-3, 0]], -4) == false

  puts "All tests passed!"
end

# en este caso es un array ordenado, facilmente podria hacer un concat de los diferentes arrays y de ahi podria hacer el bs de forma normal, sin embargo supongo que el concat no esta permitido
# siguiente: si no puedo hacer concat debe hacer otra cosa, que es calcular el mid dentro de los rows, que ya se que siempre tienen el mismo tamaño
# sabiendo eso sabemos que el lenght completo es == m * n
# por lo que ya tenemos right y left
# sin embargo tenemos que saber a que row vamos a entrar cada que se calcule mid 
# podemos hacer lo siguiente:
# mid / n (n es el lengt de rows) == row_to_look (debemos de hacer un .floor para tener el entero mas bajo)
# y luego mid - (row_to_look * n) == a la posicion exacta dentro del row ya encontrado
