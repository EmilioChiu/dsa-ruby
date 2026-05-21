# PROBLEMA: Climbing Stairs
#
# DESCRIPCION:
# Estas subiendo una escalera de 'n' escalones. Puedes saltar 1 o 2 escalones
# en cada movimiento. Encuentra el numero de formas distintas de llegar al
# escalon 'n'.
#
# Ejemplo:
#   climb_stairs(2) -> 2  (1+1, 2)
#   climb_stairs(3) -> 3  (1+1+1, 1+2, 2+1)
#
# RESTRICCIONES:
# - Debe ser una solucion recursiva simple (sin memoization a proposito)
# - n es un entero >= 0
# - Tiempo: O(2^n) con recursion simple
# - Espacio: O(n) por el call stack

def climb_stairs(n)
  return 1 if n <= 1
  climb_stairs(n - 1) + climb_stairs(n - 2) 
end

# --- PRUEBAS ---
puts "Test 1: #{climb_stairs(0) == 1 ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{climb_stairs(1) == 1 ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{climb_stairs(2) == 2 ? 'PASSED' : 'FAILED'}"
puts "Test 4: #{climb_stairs(3) == 3 ? 'PASSED' : 'FAILED'}"
puts "Test 5: #{climb_stairs(4) == 5 ? 'PASSED' : 'FAILED'}"
puts "Test 6: #{climb_stairs(5) == 8 ? 'PASSED' : 'FAILED'}"
