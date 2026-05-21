# PROBLEMA: Tower of Hanoi
#
# DESCRIPCION:
# Tienes 3 torres (A, B, C) y 'n' discos apilados en la torre A de mayor
# a menor (el mas grande abajo). Debes mover todos los discos de A a C
# usando B como auxiliar, siguiendo estas reglas:
#   - Solo puedes mover un disco a la vez
#   - Un disco grande nunca puede estar sobre uno mas chico
#
# La funcion debe imprimir cada movimiento en formato:
#   "Mover disco de X a Y"
# y devolver el numero total de movimientos.
#
# Ejemplo:
#   tower_of_hanoi(2, 'A', 'C', 'B')
#   Output:
#     Mover disco de A a B
#     Mover disco de A a C
#     Mover disco de B a C
#   Return: 3
#
# RESTRICCIONES:
# - Debe ser una solucion recursiva
# - n es un entero >= 1
# - Tiempo: O(2^n)
# - Espacio: O(n) por el call stack

def tower_of_hanoi(n, from, to, aux)
  return 0 if n == 0
  moves = tower_of_hanoi(n-1, from, aux, to)
  puts "Mover disco #{n} de #{from} a #{to}"
  moves += 1 + tower_of_hanoi(n-1, aux, to, from)
end

# --- PRUEBAS ---
puts "Test 1: #{tower_of_hanoi(1, 'A', 'C', 'B') == 1 ? 'PASSED' : 'FAILED'}"
puts "---"
puts "Test 2: #{tower_of_hanoi(2, 'A', 'C', 'B') == 3 ? 'PASSED' : 'FAILED'}"
puts "---"
puts "Test 3: #{tower_of_hanoi(3, 'A', 'C', 'B') == 7 ? 'PASSED' : 'FAILED'}"
puts "---"
puts "Test 4: #{tower_of_hanoi(4, 'A', 'C', 'B') == 15 ? 'PASSED' : 'FAILED'}"
