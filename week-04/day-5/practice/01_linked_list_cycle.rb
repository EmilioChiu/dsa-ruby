# Problema 1: Linked List Cycle
# Objetivo: Determinar si una lista enlazada tiene un ciclo.
# Restricción: Espacio O(1) (No puedes usar un Hash/Set para guardar nodos visitados).
# Pista: Algoritmo de Floyd (Tortuga y Liebre).

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def has_cycle(head)
  slow = head
  current = head

  while current && current.next
    slow = slow.next
    current = current.next.next

    return true if slow == current
  end

  false
end

# --- Casos de Prueba ---
def test_cycle
  # Caso 1: Ciclo en la posición 1 (valor 2)
  # 3 -> 2 -> 0 -> -4
  #      ^          |
  #      +----------+
  n1 = ListNode.new(3)
  n2 = ListNode.new(2)
  n3 = ListNode.new(0)
  n4 = ListNode.new(-4)
  n1.next = n2
  n2.next = n3
  n3.next = n4
  n4.next = n2
  
  puts "Prueba 1 (Con ciclo): #{has_cycle(n1) == true ? "PASSED" : "FAILED"}"

  # Caso 2: Sin ciclo
  # 1 -> 2
  m1 = ListNode.new(1)
  m2 = ListNode.new(2)
  m1.next = m2
  
  puts "Prueba 2 (Sin ciclo): #{has_cycle(m1) == false ? "PASSED" : "FAILED"}"
  
  # Caso 3: Un solo nodo
  l1 = ListNode.new(1)
  puts "Prueba 3 (Un nodo): #{has_cycle(l1) == false ? "PASSED" : "FAILED"}"
end

test_cycle
