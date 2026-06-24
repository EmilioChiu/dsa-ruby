## [875. Koko Eating Bananas]
## Link: https://leetcode.com/problems/koko-eating-bananas/
##
## Problem
## Koko loves to eat bananas. There are n piles of bananas, the ith pile
## has piles[i] bananas. The guards have gone and will come back in h
## hours.
##
## Koko can decide her bananas-per-hour eating speed of k. Each hour,
## she chooses some pile of bananas and eats k bananas from that pile.
## If the pile has less than k bananas, she eats all of them instead
## and will not eat any more bananas during this hour.
##
## Return the minimum integer k such that she can eat all the bananas
## within h hours.
##
## Constraints
## - 1 <= piles.length <= 10^4
## - piles.length <= h <= 10^9
## - 1 <= piles[i] <= 10^9
##
## Examples
## Input: piles = [3,6,7,11], h = 8
## Output: 4
##
## Input: piles = [30,11,23,4,20], h = 5
## Output: 30
##
## Input: piles = [30,11,23,4,20], h = 6
## Output: 23

def min_eating_speed(piles, h)
  left = 1
  right = piles.max

  while left < right
    mid = left + (right - left) / 2

    if can_eat_all_bananas(piles, h, mid) 
      right = mid
    else
      left = mid + 1
    end
  end
  left
end

def can_eat_all_bananas(piles, time, speed)
  hours_to_eat_all = piles.sum do |pile| # al sumar todas las horas que toma comerse todas las pilas sabremos si es menor o mayor al tiempo en el que va a regresar el guardia
    (pile.to_f / speed.to_f).ceil # lo subimos porque en caso de tener un .2 queremos subirlo al siguiente
  end

  hours_to_eat_all <= time # comparamos, si es menor o igual (idealmente) al tiempo que va a regresar el cuidador
end

if $PROGRAM_NAME == __FILE__
  def assert_equal(expected, actual, msg = "")
    if expected == actual
      puts "PASS #{msg}"
    else
      puts "FAIL #{msg}: expected #{expected.inspect}, got #{actual.inspect}"
    end
  end

  assert_equal(4, min_eating_speed([3,6,7,11], 8), "example 1")
  assert_equal(30, min_eating_speed([30,11,23,4,20], 5), "example 2")
  assert_equal(23, min_eating_speed([30,11,23,4,20], 6), "example 3")
  assert_equal(11, min_eating_speed([11], 1), "single pile, one hour")
  assert_equal(1, min_eating_speed([1,1,1,1], 10), "all small piles, plenty of time")

  puts "--- Todos los tests ejecutados ---"
end

# en pocas palabras tenemos que encontrar cuantas banas por hora tiene que comer koko para que a la hora que regrese su cuidador no hayan pasado mas de 1 hora de haber comido la ultima banana 
# por cada pila de bananas
# entonces por cada pila tenemos: cantidad de banas, tiempo para que llegue el cuidador y velocidad 
# la formula quedaria como: pila/speed = horas que nos tomara comer todas las banaas ej: 8/5 = 1.6 (lo redondeamos a 2) 
# las horas que toma se las quitamos la horas restantes, repetimos el proceso con todas las pilas y al final sabremos si koko puede o no comerse todas las pilas antes de que llegue su cuidador con mas bananas
