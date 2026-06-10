# Problema: Min Stack (Pila Mínima)
#
# Descripción:
# Diseña una pila (stack) que soporte empujar (push), extraer (pop), ver el elemento superior (top) y recuperar el elemento mínimo en tiempo constante O(1).
#
# Implementa la clase `MinStack`:
# - `MinStack.new()` inicializa el objeto pila.
# - `push(val)` empuja el elemento `val` a la pila.
# - `pop()` elimina el elemento en el tope de la pila.
# - `top()` obtiene el elemento del tope de la pila.
# - `get_min()` recupera el elemento mínimo de la pila.
#
# Restricciones:
# - -2^31 <= val <= 2^31 - 1
# - Los métodos `pop`, `top` y `get_min` siempre serán llamados sobre pilas no vacías.
# - A lo sumo 3 * 10^4 llamadas se harán a push, pop, top y get_min.

class MinStack
  def initialize()
    @stack = []
    @mins = []
  end

  # @param {Integer} val
  # @return {Void}
  def push(val)
    @stack << val
    @mins << val if @mins.empty? || val <= @mins.last
    nil
  end

  # @return {Void}
  def pop()
    val = @stack.pop
    @mins.pop if @mins.last == val
  end

  # @return {Integer}
  def top()
    @stack.last
  end

  # @return {Integer}
  def get_min()
    @mins.last
  end
end

# --- Casos de Prueba ---
begin
  min_stack = MinStack.new()
  min_stack.push(-2)
  min_stack.push(0)
  min_stack.push(-3)
  
  t1 = min_stack.get_min() == -3
  min_stack.pop()
  t2 = min_stack.top() == 0
  t3 = min_stack.get_min() == -2

  puts "Test 1 (get_min): #{t1 ? 'PASSED' : 'FAILED'}"
  puts "Test 2 (top): #{t2 ? 'PASSED' : 'FAILED'}"
  puts "Test 3 (get_min después de pop): #{t3 ? 'PASSED' : 'FAILED'}"
rescue => e
  puts "Error durante la ejecución: #{e.message}"
end
