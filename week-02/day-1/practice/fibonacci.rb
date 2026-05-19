# PROBLEMA: Fibonacci Recursivo
#
# DESCRIPCIÓN:
# Escribe una función que devuelva el n-ésimo número de la secuencia de Fibonacci.
# La secuencia empieza: 0, 1, 1, 2, 3, 5, 8, 13, 21...
# donde cada número es la suma de los dos anteriores.
#
# Ejemplo:
#   fib(6) -> 8
#
# RESTRICCIONES:
# - Debe ser una solución recursiva simple.
# - Nota: Esta solución será O(2^n). ¡No te asustes! Analizaremos por qué después.

def fib(n)
  return n if n <= 1
  fib(n-1) + fib(n-2)
end

# --- PRUEBAS ---
puts "Test 1: #{fib(0) == 0 ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{fib(1) == 1 ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{fib(2) == 1 ? 'PASSED' : 'FAILED'}"
puts "Test 4: #{fib(6) == 8 ? 'PASSED' : 'FAILED'}"
