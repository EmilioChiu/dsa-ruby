# PROBLEMA: Palindrome Number
#
# DESCRIPCIÓN:
# Dado un entero x, devuelve true si x es un palíndromo (se lee igual al
# derecho y al revés).
#
# Input:  x = 121
# Output: true  (121 se lee 121 al revés)
#
# Input:  x = -121
# Output: false (por el signo, -121 no es igual a 121-)
#
# Input:  x = 10
# Output: false (01 no es igual a 10)
#
# RESTRICCIONES:
# - Tiempo: O(log n) o O(n) según enfoque
# - Espacio: O(1)
#
# BONUS: Resuélvelo SIN convertir a string.

def is_palindrome?(x)
  return false if x < 0
  reversed_num = 0
  original_x = x

  while x >= 1
    digit = x % 10
    reversed_num = (reversed_num * 10) + digit
    x /= 10
  end
  reversed_num == original_x
end

# --- PRUEBAS ---
puts "Test 1: #{is_palindrome?(121) == true ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{is_palindrome?(-121) == false ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{is_palindrome?(10) == false ? 'PASSED' : 'FAILED'}"
puts "Test 4: #{is_palindrome?(0) == true ? 'PASSED' : 'FAILED'}"
puts "Test 5: #{is_palindrome?(12321) == true ? 'PASSED' : 'FAILED'}"
