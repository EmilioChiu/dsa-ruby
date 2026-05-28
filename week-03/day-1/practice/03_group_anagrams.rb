# Group Anagrams
#
# Dado un array de strings `strs`, agrupa los anagramas.
# Puedes retornar la respuesta en cualquier orden.
#
# Un Anagrama es una palabra formada al reordenar las letras de otra.
#
# Ejemplo:
# strs = ["eat","tea","tan","ate","nat","bat"]
# Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
#
# Restricciones:
# - 1 <= strs.length <= 10^4
# - strs[i] consiste de letras minúsculas inglesas.

def group_anagrams(strs)
  memory = Hash.new { |hash, key| hash[key] = [] }
  strs.each_with_index do |str, _index|
    key = str.chars.sort.join
    memory[key] << str
  end
  memory.values
end

# --- Casos de Prueba ---
def test_group_anagrams
  input = %w[eat tea tan ate nat bat]
  expected = [['bat'], %w[nat tan], %w[ate eat tea]]

  result = group_anagrams(input).map(&:sort).sort
  sorted_expected = expected.map(&:sort).sort

  if result == sorted_expected
    puts '✅ All tests passed!'
  else
    puts '❌ Test failed.'
    puts "Expected: #{sorted_expected}"
    puts "Got:      #{result}"
  end
end

test_group_anagrams
