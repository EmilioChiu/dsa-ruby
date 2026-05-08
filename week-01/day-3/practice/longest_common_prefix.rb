# PROBLEMA: Longest Common Prefix
#
# DESCRIPCIÓN:
# Escribe una función para encontrar el prefijo común más largo entre un
# array de strings. Si no hay prefijo común, devuelve un string vacío "".
#
# Input:  ["flower","flow","flight"]
# Output: "fl"
#
# Input:  ["dog","racecar","car"]
# Output: ""
#
# RESTRICCIONES:
# - Tiempo: O(n * m) donde n = cantidad de strings, m = largo del prefijo
# - Espacio: O(1) extra

def longest_common_prefix(strs)
  return strs[0] if strs.length == 1
  prefix = strs[0]

  strs[1..-1].each do | str |
    str_index = 0
    str.each_char  do | char |
      return "" if prefix[str_index] != char and str_index == 0
      if prefix[str_index] != char
        prefix = str.slice(0..str_index-1)
        break
      end
      if str.length < prefix.length and str_index == str.length - 1
        prefix = str
      end
      str_index += 1
    end
  end
  prefix
end

# --- VERSIÓN RECOMENDADA (AI REFERENCE) ---
# Esta versión es más idiomática en Ruby. Usa el método .start_with? para 
# evitar el manejo manual de índices y hacer el código más legible.
def longest_common_prefix_recommended(strs)
  return "" if strs.empty?
  prefix = strs[0]

  strs[1..-1].each do |word|
    while !word.start_with?(prefix)
      prefix = prefix.slice(0...-1)
      return "" if prefix.empty?
    end
  end
  prefix
end

# --- PRUEBAS ---
puts "Test 1: #{longest_common_prefix(["flower","flow","flight"]) == "fl" ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{longest_common_prefix(["dog","racecar","car"]) == "" ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{longest_common_prefix(["",""]) == "" ? 'PASSED' : 'FAILED'}"
puts "Test 4: #{longest_common_prefix(["a"]) == "a" ? 'PASSED' : 'FAILED'}"
puts "Test 5: #{longest_common_prefix(["interspecies","interstellar","interstate"]) == "inters" ? 'PASSED' : 'FAILED'}"
