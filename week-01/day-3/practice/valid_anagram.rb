# PROBLEMA: Valid Anagram
#
# DESCRIPCIÓN:
# Dados dos strings s y t, devuelve true si t es un anagrama de s, o false
# si no lo es. Un anagrama es una palabra formada reordenando las letras de otra.
#
# Input:  s = "anagram", t = "nagaram"
# Output: true
#
# Input:  s = "rat", t = "car"
# Output: false
#
# RESTRICCIONES:
# - Tiempo: O(n) donde n = longitud de ambos strings
# - Espacio: O(1) si consideras que el alfabeto es fijo (26 letras minúsculas)

def is_anagram?(s, t)
  return false if s.length() != t.length()
  dict = {
    "a" => 0, "b" => 0, "c" => 0, "d" => 0, "e" => 0, "f" => 0, "g" => 0,
    "h" => 0, "i" => 0, "j" => 0, "k" => 0, "l" => 0, "m" => 0, "n" => 0, "o" => 0,
    "p" => 0, "q" => 0, "r" => 0, "s" => 0, "t" => 0, "u" => 0, "v" => 0, 
    "w" => 0, "x" => 0, "y" => 0, "z" => 0
  }

  s.downcase.each_char do |char|
    dict[char] += 1
  end

  t.downcase.each_char do |char|
    dict[char] -= 1
  end

  dict.each do |key, value|
    return false if value != 0
  end
  true
end

# --- PRUEBAS ---
puts "Test 1: #{is_anagram?("anagram", "nagaram") == true ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{is_anagram?("rat", "car") == false ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{is_anagram?("a", "ab") == false ? 'PASSED' : 'FAILED'}"
puts "Test 4: #{is_anagram?("", "") == true ? 'PASSED' : 'FAILED'}"
