require 'set'
## Happy Number
# Link: https://leetcode.com/problems/happy-number/

### Problem
# Write an algorithm to determine if a number n is happy.

# A happy number is a number defined by the following process:
# - Starting with any positive integer, replace the number by the sum of the squares of its digits.
# - Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
# - Those numbers for which this process ends in 1 are happy.

# Return true if n is a happy number, and false if not.

### Constraints
# - 1 <= n <= 2^31 - 1

### Examples
# Input: n = 19
# Output: true
# Explanation:
# 1^2 + 9^2 = 82
# 8^2 + 2^2 = 68
# 6^2 + 8^2 = 100
# 1^2 + 0^2 + 0^2 = 1

# Input: n = 2
# Output: false

### Signature
def is_happy(n)
  memory = Set.new([n])

  while
    n = n.digits.map {|digit| digit ** 2}.sum
    return true if n == 1
    return false if memory.include?(n)
    memory << n
  end
end

### Tests
puts is_happy(19) == true
puts is_happy(2) == false
puts is_happy(1) == true
puts is_happy(7) == true
