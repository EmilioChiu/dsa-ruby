# Problema: Group Anagrams
#
# Dado un array de strings 'strs', agrupa los anagramas. 
# Puedes devolver la respuesta en cualquier orden.
#
# Ejemplo 1:
# Input: strs = ["eat","tea","tan","ate","nat","bat"]
# Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
#
# Restricciones:
# - 1 <= strs.length <= 10^4
# - 0 <= strs[i].length <= 100
# - strs[i] consiste de letras inglesas minúsculas.
# - Objetivo: O(n * m) donde m es la longitud máxima de un string.

def group_anagrams(strs)
  memory = Hash.new()

  strs.each do |str|
    local_hash = Hash.new(0)
    (0...str.length).each do |index|
      char = str[index]
      local_hash[char] += 1
    end
    if memory[local_hash]
      memory[local_hash] << str
    else
      memory[local_hash] = [str]
    end
  end

  memory.values
end

# Casos de prueba para validación automática
def test_solution
  tests = [
    { 
      input: ["eat","tea","tan","ate","nat","bat"], 
      expected: [["eat","tea","ate"],["tan","nat"],["bat"]] 
    },
    { input: [""], expected: [[""]] },
    { input: ["a"], expected: [["a"]] }
  ]

  tests.each_with_index do |t, i|
    res = group_anagrams(t[:input]).map(&:sort).sort
    expected = t[:expected].map(&:sort).sort
    if res == expected
      puts "Test #{i+1}: PASSED"
    else
      puts "Test #{i+1}: FAILED"
    end
  end
end

test_solution if __FILE__ == $0

# crear el answer: sera un hash de hashes, donde cada hash vaya guardando un array que guarde los anagramas
# pasar por cada palabra e ir creando un hash por cada palabra, despues revisar con los hash guardados ej: memory[anagram] y si existe guardar el nuevo anagram y si no, crear el key => value con el nuevo hash(key) y el anagrama([value])
