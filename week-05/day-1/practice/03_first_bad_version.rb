## [278. First Bad Version]
## Link: https://leetcode.com/problems/first-bad-version/
##
## Problem
## You are a product manager and currently leading a team to develop a
## new product. Since each version is developed based on the previous
## version, all the versions after a bad version are also bad.
##
## Suppose you have n versions [1, 2, ..., n] and you want to find out
## the first bad one, which causes all the following ones to be bad.
##
## You are given an API bool isBadVersion(version) which returns whether
## version is bad. Implement a function to find the first bad version.
## You should minimize the number of calls to the API.
##
## Constraints
## - 1 <= bad <= n <= 2^31 - 1
##
## Examples
## Input: n = 5, bad = 4
## Output: 4
## Explanation:
##   call isBadVersion(3) -> false
##   call isBadVersion(5) -> true
##   call isBadVersion(4) -> true
##   Then 4 is the first bad version.
##
## Input: n = 1, bad = 1
## Output: 1

$is_bad_version = nil

def is_bad_version(version)
  version >= $is_bad_version
end

def first_bad_version(right)
  left = 1

  while left <= right
    mid = left + (right - left) / 2
    is_bad_version(mid) ? right = mid - 1 : left = mid + 1
  end

  left
end

if $PROGRAM_NAME == __FILE__
  def assert_equal(expected, actual, msg = "")
    if expected == actual
      puts "PASS #{msg}"
    else
      puts "FAIL #{msg}: expected #{expected.inspect}, got #{actual.inspect}"
    end
  end

  $is_bad_version = 4
  assert_equal(4, first_bad_version(5), "bad version at 4 of 5")

  $is_bad_version = 1
  assert_equal(1, first_bad_version(1), "only one version, it is bad")

  $is_bad_version = 1
  assert_equal(1, first_bad_version(3), "first version is bad")

  $is_bad_version = 3
  assert_equal(3, first_bad_version(3), "last version is bad")

  $is_bad_version = 50
  assert_equal(50, first_bad_version(100), "bad version in middle of large range")

  $is_bad_version = 100
  assert_equal(100, first_bad_version(100), "last version is bad in large range")

  puts "--- Todos los tests ejecutados ---"
end
