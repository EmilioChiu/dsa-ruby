# Problema: Longest Substring Without Repeating Characters
#
# Dada una cadena 's', encuentra la longitud del sub-string más largo 
# sin caracteres repetidos.
#
# Ejemplo 1:
# Input: s = "abcabcbb"
# Output: 3
# Explicación: El sub-string es "abc", con longitud 3.
#
# Ejemplo 2:
# Input: s = "bbbbb"
# Output: 1
# Explicación: El sub-string es "b", con longitud 1.
#
# Restricciones:
# - 0 <= s.length <= 5 * 10^4
# - 's' consiste de letras inglesas, dígitos, símbolos y espacios.
# - Objetivo: O(n) tiempo.

def length_of_longest_substring(s)
  memory = Hash.new(0)
  longest_substring = 0
  local_length = 0
  uniq = 0

  (0...s.length).each do |index|
    char = s[index]
    memory[char] += 1
    local_length += 1

    while memory[char] > 1 and uniq < index 
      memory[s[uniq]] -= 1
      local_length -= 1
      uniq += 1
    end

    longest_substring = local_length if local_length > longest_substring
  end
  longest_substring
end

# Casos de prueba para validación automática
def test_solution
  tests = [
    { input: "abcabcbb", expected: 3 },
    { input: "bbbbb", expected: 1 },
    { input: "pwwkew", expected: 3 },
    { input: "", expected: 0 },
    { input: " ", expected: 1 },
    { input: "dvdf", expected: 3 }
  ]

  tests.each_with_index do |t, i|
    res = length_of_longest_substring(t[:input])
    if res == t[:expected]
      puts "Test #{i+1}: PASSED"
    else
      puts "Test #{i+1}: FAILED (Expected #{t[:expected]}, got #{res})"
    end
  end
end

test_solution if __FILE__ == $0
