# Longest Substring Without Repeating Characters
#
# Given a string s, find the length of the longest substring without repeating characters.
#
# Constraints:
# - 0 <= s.length <= 5 * 10^4
# - s consists of English letters, digits, symbols and spaces.
#
# Example 1:
# Input: s = "abcabcbb"
# Output: 3 (The answer is "abc", with the length of 3)
#
# Example 2:
# Input: s = "bbbbb"
# Output: 1
#
# Example 3:
# Input: s = "pwwkew"
# Output: 3 (The answer is "wke", with the length of 3. "pwke" is a subsequence, not a substring)

def length_of_longest_substring(s)
  substring = Hash.new(0)
  uniq = 0
  local_length = 0
  longest_length = 0

  (0...s.length).each do | index |
    char = s[index]
    substring[char] += 1
    
    while substring[char] > 1 and uniq < index
      substring[s[uniq]] -= 1
      uniq += 1
    end
    local_length = index - uniq + 1 

    longest_length = [longest_length, local_length].max 
  end

  longest_length
end

# --- Test Cases ---
puts "Test 1: #{length_of_longest_substring("abcabcbb") == 3 ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{length_of_longest_substring("bbbbb") == 1 ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{length_of_longest_substring("pwwkew") == 3 ? 'PASSED' : 'FAILED'}"
puts "Test 4: #{length_of_longest_substring("") == 0 ? 'PASSED' : 'FAILED'}"
puts "Test 5: #{length_of_longest_substring(" ") == 1 ? 'PASSED' : 'FAILED'}"
puts "Test 6: #{length_of_longest_substring("dvdf") == 3 ? 'PASSED' : 'FAILED'}"
