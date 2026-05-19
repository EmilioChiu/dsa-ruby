# PROBLEMA: Power of N (x^n)
#
# DESCRIPCIÓN:
# Escribe una función recursiva que calcule el valor de 'base' elevado 
# a la potencia 'n'.
#
# Ejemplo:
#   power(2, 3) -> 8 (2 * 2 * 2)
#   power(5, 0) -> 1
#
# RESTRICCIONES:
# - Debe ser una solución recursiva.
# - Asume que 'n' siempre es un entero no negativo (>= 0).
# - Tiempo: O(n)
# - Espacio: O(n) debido al call stack.

def power(base, n)
  return 1 if n == 0
  return base if n == 1
  base * power(base, n-1)
end

# --- PRUEBAS ---
puts "Test 1: #{power(2, 3) == 8 ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{power(5, 0) == 1 ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{power(10, 2) == 100 ? 'PASSED' : 'FAILED'}"
puts "Test 4: #{power(3, 4) == 81 ? 'PASSED' : 'FAILED'}"
