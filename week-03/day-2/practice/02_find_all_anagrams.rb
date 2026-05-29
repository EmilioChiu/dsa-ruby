# Find All Anagrams in a String
#
# Dadas dos strings `s` y `p`, devuelve un array con todos los índices de inicio
# de los anagramas de `p` en `s`. Puedes devolver la respuesta en cualquier orden.
#
# Ejemplo:
# s = "cbaebabacd", p = "abc"
# Output: [0, 6]
# Explicación:
# En el índice 0 está "cba", que es un anagrama de "abc".
# En el índice 6 está "bac", que es un anagrama de "abc".
#
# Restricciones:
# - s y p consisten en letras minúsculas.
# - El tamaño de la ventana es FIJO y es igual a p.length.
# - Complejidad temporal deseada: O(n) donde n es s.length.

def find_anagrams(s, p)
  anagram = {
    "a" => 0, "b" => 0, "c" => 0, "d" => 0, "e" => 0, "f" => 0, "g" => 0, 
    "h" => 0, "i" => 0, "j" => 0, "k" => 0, "l" => 0, "m" => 0, "n" => 0, 
    "o" => 0, "p" => 0, "q" => 0, "r" => 0, "s" => 0, "t" => 0, "u" => 0, 
    "v" => 0, "w" => 0, "x" => 0, "y" => 0, "z" => 0 
  }

  posible_anagram = {
    "a" => 0, "b" => 0, "c" => 0, "d" => 0, "e" => 0, "f" => 0, "g" => 0, 
    "h" => 0, "i" => 0, "j" => 0, "k" => 0, "l" => 0, "m" => 0, "n" => 0, 
    "o" => 0, "p" => 0, "q" => 0, "r" => 0, "s" => 0, "t" => 0, "u" => 0, 
    "v" => 0, "w" => 0, "x" => 0, "y" => 0, "z" => 0 
  }

  answer = []

  (0...p.length).each do |index|
    char = p[index]
    anagram[char] += 1
  end

  (0...s.length).each do |index|
    char = s[index]
    posible_anagram[char] += 1

    if index >= p.length
      char_to_remove = s[index - p.length()]
      posible_anagram[char_to_remove] -= 1
    end

    if posible_anagram == anagram
      answer << index - (p.length() - 1)
    end
  end

  answer
end

# --- Casos de Prueba ---
def test_anagrams
  puts "Test 1: #{find_anagrams('cbaebabacd', 'abc').sort == [0, 6] ? 'PASSED' : 'FAILED'}"
  puts "Test 2: #{find_anagrams('abab', 'ab').sort == [0, 1, 2] ? 'PASSED' : 'FAILED'}"
  puts "Test 3: #{find_anagrams('af', 'be') == [] ? 'PASSED' : 'FAILED'}"
end

test_anagrams
# ok, necesito identificar lo que se pasa y se devuelve:
# primero: array que tenga los indices, hay dos formas para obtener un array iniciarlo en [] o hacer un hash y que los valores sean los indices cual de los dos puede ser?
# constante: p.length <- este sera la constante para saber si cumplen los anagramas
# opciones: puedo crear un hash que guarde p y las repeticiones de sus letras ej: holaa => {h => 1, o => 1, l => 1, a => 2}
# con ese hash puedo ir recorriendo s e ir viendo si estan las letras
