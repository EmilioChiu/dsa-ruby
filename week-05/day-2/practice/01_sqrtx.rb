## [70. Sqrt(x)]
## Link: https://leetcode.com/problems/sqrtx/
##
## Problem
## Given a non-negative integer x, return the square root of x rounded
## down to the nearest integer. The returned integer should be
## non-negative as well.
##
## You must not use any built-in exponent function or operator.
##
## Constraints
## - 0 <= x <= 2^31 - 1
##
## Examples
## Input: x = 4
## Output: 2
##
## Input: x = 8
## Output: 2
## Explanation: The square root of 8 is 2.82842..., and since we round
## it down, 2 is returned.

def my_sqrt(x)
  left = 1
  right = x
  while left < right
    mid = left + (right - left + 1) / 2

    if feassible(mid, x)
      left = mid
    else
      right = mid - 1
    end
  end
  left
end

def feassible(mid, target)
  mid * mid <= target
end

if $PROGRAM_NAME == __FILE__
  def assert_equal(expected, actual, msg = "")
    if expected == actual
      puts "PASS #{msg}"
    else
      puts "FAIL #{msg}: expected #{expected.inspect}, got #{actual.inspect}"
    end
  end

  # assert_equal(2, my_sqrt(4), "sqrt(4)")
  assert_equal(2, my_sqrt(8), "sqrt(8)")
  assert_equal(0, my_sqrt(0), "sqrt(0)")
  assert_equal(1, my_sqrt(1), "sqrt(1)")
  assert_equal(3, my_sqrt(9), "sqrt(9)")
  assert_equal(10, my_sqrt(100), "sqrt(100)")
  assert_equal(10, my_sqrt(101), "sqrt(101)")
  assert_equal(46340, my_sqrt(2147483647), "sqrt(MAX_INT)")

  puts "--- Todos los tests ejecutados ---"
end
