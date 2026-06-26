# [Koko Eating Bananas]
# Link: https://leetcode.com/problems/koko-eating-bananas/
#
# Problem:
# Koko loves to eat bananas. There are n piles of bananas, the i-th pile has piles[i] bananas.
# The guards have gone and will come back in h hours.
#
# Koko can decide her bananas-per-hour eating speed k. Each hour, she chooses some pile of
# bananas and eats k bananas from that pile. If the pile has less than k bananas, she eats
# all of them instead and will not eat any more bananas during this hour.
#
# Return the minimum integer k such that she can eat all the bananas within h hours.
#
# Constraints:
# - 1 <= piles.length <= 10^4
# - piles.length <= h <= 10^9
# - 1 <= piles[i] <= 10^9
#
# Examples:
#   piles = [3,6,7,11], h = 8  -> 4
#   piles = [30,11,23,4,20], h = 5 -> 30
#   piles = [30,11,23,4,20], h = 6 -> 23

def min_eating_speed(piles, h)
  left = 1
  right = piles.max

  while left < right
    velocity = left + (right - left) / 2

    if can_koko_eat_it_all?(piles, h, velocity)
      right = velocity
    else
      left = velocity + 1
    end
  end

  left
end

def can_koko_eat_it_all?(piles, h, velocity)
  hours_to_eat_it_all = piles.sum do |pile|
    (pile.to_f / velocity.to_f).ceil
  end

  hours_to_eat_it_all <= h
end

# Tests
puts min_eating_speed([3,6,7,11], 8) == 4
puts min_eating_speed([30,11,23,4,20], 5) == 30
puts min_eating_speed([30,11,23,4,20], 6) == 23

