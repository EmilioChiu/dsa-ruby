# PROBLEMA: Reverse String
#
# DESCRIPCIÓN:
# Escribe una función que invierta un string. Debes hacerlo in-place
# modificando el arreglo de caracteres recibido (como si fuera un string mutable).
#
# Input:  ["h","e","l","l","o"]  (array de chars)
# Output: ["o","l","l","e","h"]
#
# RESTRICCIONES:
# - Tiempo: O(n)
# - Espacio: O(1) extra (debes modificar el arreglo in-place)

def reverse_string(s)
  return s if s.length() <= 1

  right = s.length() - 1
  left = 0

  while left < right
    s[left], s[right] = s[right], s[left]
    left += 1
    right -= 1
  end
  s
end

# --- PRUEBAS ---
puts "Test 1: #{reverse_string(%w[h e l l o]) == %w[o l l e h] ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{reverse_string(%w[H a n n a h]) == %w[h a n n a H] ? 'PASSED' : 'FAILED'}"
