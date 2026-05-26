# Warm-up: Two Pointers - Decision de movimiento
# Debt-007: Saber CUAL puntero mover y POR QUE
#
# Para cada snippet, responde:
#   1. Que puntero(s) se mueven en cada iteracion?
#   2. Por que se mueve ese y no el otro?
#   3. Cual es el瓶颈 (bottleneck) que determina la decision?
#
# Ejecuta: ruby week-02/day-4/practice/warmup_two_pointers.rb

# --- snippet 1: Container With Most Water ---
def max_area(height)
  left = 0
  right = height.length - 1
  max_water = 0

  while left < right
    min_height = [height[left], height[right]].min
    width = right - left
    max_water = [max_water, min_height * width].max

    if height[left] < height[right]
      left += 1
    else
      right -= 1
    end
  end

  max_water
end

# --- snippet 2: ??? ---
def snippet2(arr)
  left = 0
  right = arr.length - 1

  while left < right
    if arr[left] + arr[right] == target
      return [left, right]
    elsif arr[left] + arr[right] < target
      left += 1
    else
      right -= 1
    end
  end

  nil
end

# --- snippet 3: ??? ---
def snippet3(s)
  left = 0
  right = s.length - 1

  while left < right
    unless s[left].match?(/[a-zA-Z0-9]/)
      left += 1
      next
    end
    unless s[right].match?(/[a-zA-Z0-9]/)
      right -= 1
      next
    end

    if s[left].downcase != s[right].downcase
      return false
    end

    left += 1
    right -= 1
  end

  true
end

# --- Tests ---
puts "== Warm-up: Identifica el patron =="
puts "snippet 1: max_area"
puts "snippet 2: adivina el problema (sin mirar arriba)"
puts "snippet 3: adivina el problema"
puts ""
puts "Preguntas para cada uno:"
puts "1. Cual es el criterio para mover left vs right?"
puts "2. Que pasaria si movieras el puntero equivocado?"
puts "3. Cual es el bottleneck que determina el movimiento?"
