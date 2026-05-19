# PROBLEMA: Factorial Recursivo
#
# DESCRIPCIÓN:
# Escribe una función que devuelva el factorial de un número 'n'.
# n! = n * (n-1) * (n-2) * ... * 1
#
# Ejemplo:
#   factorial(5) -> 120 (5 * 4 * 3 * 2 * 1)
#
# RESTRICCIONES:
# - Debe ser una solución recursiva.
# - Tiempo: O(n)
# - Espacio: O(n) debido al call stack.

def factorial(n)
  return 1 if n <= 1
  n *= factorial(n-1)
end

# --- PRUEBAS ---
puts "Test 1: #{factorial(5) == 120 ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{factorial(1) == 1 ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{factorial(0) == 1 ? 'PASSED' : 'FAILED'}"
