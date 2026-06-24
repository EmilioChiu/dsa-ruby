## [1011. Capacity To Ship Packages Within D Days]
## Link: https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/
##
## Problem
## A conveyor belt has packages that must be shipped from one port to
## another within days days.
##
## The ith package on the conveyor belt has a weight of weights[i].
## Each day, we load the ship with packages in the same order as they
## appear. We may not load more weight than the maximum weight capacity
## of the ship.
##
## Return the least weight capacity of the ship that will result in all
## the packages being shipped within days days.
##
## Constraints
## - 1 <= days <= weights.length <= 5 * 10^4
## - 1 <= weights[i] <= 500
##
## Examples
## Input: weights = [1,2,3,4,5,6,7,8,9,10], days = 5
## Output: 15
## Explanation: A capacity of 15 is the minimum to ship all in 5 days.
##
## Input: weights = [3,2,2,4,1,4], days = 3
## Output: 6
##
## Input: weights = [1,2,3,1,1], days = 4
## Output: 3

def ship_within_days(weights, days)
  left = weights.max
  right = weights.sum 

  while left < right
    mid = left + (right - left) / 2

    if feasible?(weights, days, mid)
      right = mid
    else
      left = mid + 1
    end
  end

  left
end

def feasible?(weights, days, capacity)
  day = 1
  daily_charge = 0

  weights.each do |weight|
    if daily_charge + weight <= capacity
      daily_charge += weight 
    else 
      day += 1
      daily_charge = weight
    end
  end

  day <= days
end

if $PROGRAM_NAME == __FILE__
  def assert_equal(expected, actual, msg = "")
    if expected == actual
      puts "PASS #{msg}"
    else
      puts "FAIL #{msg}: expected #{expected.inspect}, got #{actual.inspect}"
    end
  end

  assert_equal(15, ship_within_days([1,2,3,4,5,6,7,8,9,10], 5), "example 1")
  assert_equal(6, ship_within_days([3,2,2,4,1,4], 3), "example 2")
  assert_equal(3, ship_within_days([1,2,3,1,1], 4), "example 3")
  assert_equal(10, ship_within_days([10,10,10,10], 4), "each day one package")
  assert_equal(20, ship_within_days([10,10,10,10], 3), "need to combine some days")

  puts "--- Todos los tests ejecutados ---"
end
