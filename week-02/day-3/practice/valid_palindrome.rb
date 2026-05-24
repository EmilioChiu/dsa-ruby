# PROBLEMA: Valid Palindrome
#
# Dado un string s, determinar si es un palindromo.
# Un palindromo es una frase que se lee igual hacia adelante y hacia atras,
# ignorando mayusculas, espacios y caracteres no alfanumericos.
#
# RESTRICCIONES:
# - Resolver con 2 pointers (uno al inicio, otro al final, convergiendo)
# - No usar .reverse, .reverse_each, ni invertir el string
# - No usar expresiones regulares
#
# @param {String} s
# @return {Boolean} true si es palindromo, false en otro caso
def is_palindrome(s)
  s = s.downcase
  right = s.length - 1
  left = 0

  while left <= right do
    if not valid_char?(s[right])
      right -= 1
      next
    end

    if not valid_char?(s[left])
      left += 1
      next
    end

    return false if s[left] != s[right]

    left += 1
    right -= 1
  end
  true
end

def valid_char?(char)
  (char >= "a" && char <= "z") or (char >= "0" && char <= "9")
end

# --- PRUEBAS ---
puts "Test 1: #{is_palindrome('A man, a plan, a canal: Panama') == true ? 'PASS' : 'FAIL'}"
puts "Test 2: #{is_palindrome('race a car') == false ? 'PASS' : 'FAIL'}"
puts "Test 3: #{is_palindrome(' ') == true ? 'PASS' : 'FAIL'}"
puts "Test 4: #{is_palindrome('.,') == true ? 'PASS' : 'FAIL'}"
puts "Test 5: #{is_palindrome('0P') == false ? 'PASS' : 'FAIL'}"
