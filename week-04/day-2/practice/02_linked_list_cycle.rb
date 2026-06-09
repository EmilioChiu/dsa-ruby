require 'set'
# Concepto: Determinar si una lista ligada tiene un ciclo.

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} head
# @return {Boolean}
def has_cycle_first_v(head)
  memory = Set.new
  current = head

  while current
    return true if memory.include?(current)

    memory << current
    current = current.next
  end
  false
end

def has_cycle(head)
  current = head
  slow = head

  while current && current.next
    current = current.next.next
    slow = slow.next
    return true if current == slow 
  end

  false
end

# --- Casos de Prueba ---

# Test 1: Ciclo presente
node1 = ListNode.new(3)
node2 = ListNode.new(2)
node3 = ListNode.new(0)
node4 = ListNode.new(-4)
node1.next = node2 # fast
node2.next = node3 # slow
node3.next = node4 # slow fast
node4.next = node2 # Ciclo aquí
puts "Test 1: #{has_cycle(node1) == true ? 'PASSED' : 'FAILED'}"

# Test 2: Sin ciclo
nodeA = ListNode.new(1)
nodeB = ListNode.new(2)
nodeA.next = nodeB
puts "Test 2: #{has_cycle(nodeA) == false ? 'PASSED' : 'FAILED'}"

# Test 3: Un solo nodo, sin ciclo
nodeSingle = ListNode.new(1)
puts "Test 3: #{has_cycle(nodeSingle) == false ? 'PASSED' : 'FAILED'}"

# se me ocurre una solucion, haciendo uso de un Set.include? (si lo hago bien deberia de ser O(n) tiempo y espacio) 
# inicializar un set, el cual vaya guardando los sets
# hacer un while current (iniciarlo con current = head e ir avanzando con current = current.next) esto nos indicara que en caso de llegar current == nil no habra ningun ciclo y podremos regresar false
# por cada iteracion se va a revisar con memory.include? (el set) en caso que de true romperemmos el loop y regresaremos true
