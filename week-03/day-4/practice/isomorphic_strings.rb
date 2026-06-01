require 'set'
## Isomorphic Strings
# Link: https://leetcode.com/problems/isomorphic-strings/

# ### Problem
# Given two strings s and t, determine if they are isomorphic.

# Two strings s and t are isomorphic if the characters in s can be replaced to get t.

# All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

# ### Constraints
# - 1 <= s.length <= 5 * 10^4
# - t.length == s.length
# - s and t consist of any valid ASCII character.

# ### Examples
# Input: s = "egg", t = "add"
# Output: true

# Input: s = "foo", t = "bar"
# Output: false

# Input: s = "paper", t = "title"
# Output: true

### Signature
def is_isomorphic(s, t)
  return false if s.length != t.length
  memory = Hash.new
  answer = ""
  chars_used = Set.new

  (0...s.length).each do |index|
    char_s = s[index]
    char_t = t[index]

    if memory[char_s]
      answer << memory[char_s]
    elsif chars_used.include?(char_t)
      return false
    else
      memory[char_s] = char_t
      answer << char_t
      chars_used.add(char_t)
    end
  end
  answer == t
end

### Tests
puts is_isomorphic("egg", "add") == true
puts is_isomorphic("foo", "bar") == false
puts is_isomorphic("paper", "title") == true
puts is_isomorphic("badc", "baba") == false
puts is_isomorphic("a", "a") == true

# necesitamos hacer que s se vuelva t
# para esto necesitamos pasar por cada letra de s y compararla con la letra t en el mismo indice
# y tenemos que hacer una serie de preguntas
# primero tenemos que revisar si la guardamos en el memory
# en caso que no este en el memory se va a cambiar la letra en s por la letra en t y se guardara en memory ej: a => b (de esta forma la proxima vez que salga una a se pasara a "b")
# en caso que si este se remplazara por la que este en la memory
#
#para guardar el resultado se necesitara 
