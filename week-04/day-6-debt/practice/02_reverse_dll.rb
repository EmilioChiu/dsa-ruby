## [Warm-up 2] Reverse Doubly Linked List

### Problema
# Dado el nodo `head` de una doubly linked list (SIN centinelas), invierte la lista
# completa in-place y retorna el nuevo `head`.

# Cada nodo tiene punteros `prev` y `next`.
# Despues de la inversion, el nodo que era `tail` debe convertirse en `head`,
# y `head` debe convertirse en `tail`.

# ### Constraint
# - No crear nuevos nodos — solo reasignar punteros existentes.
# - Retornar el nuevo head de la lista invertida.

### Examples
# ```
# Input:  1 <-> 2 <-> 3 <-> 4
# Output: 4 <-> 3 <-> 2 <-> 1

# Input:  1
# Output: 1

# Input:  nil
# Output: nil
# ```

### Signature
# ```ruby
class Node
  attr_accessor :val, :prev, :next

  def initialize(val)
    @val = val
    @prev = nil
    @next = nil
  end
end

def reverse_dll(head)
  current = head
  prev = nil

  while current
    nxt = current.next
    current.prev = nxt
    current.next = prev
    prev = current

    current = nxt
  end

  prev
end
# ```

### Tests
# ```ruby
def build_list(vals)
  return nil if vals.empty?
  nodes = vals.map { |v| Node.new(v) }
  nodes.each_cons(2) do |a, b|
    a.next = b
    b.prev = a
  end
  nodes.first
end

def list_to_array(head)
  result = []
  while head
    result << head.val
    head = head.next
  end
  result
end

def test_reverse_dll
  # Caso 1: Lista normal
  head = build_list([1, 2, 3, 4])
  reversed = reverse_dll(head)
  raise "reverse [1,2,3,4]" unless list_to_array(reversed) == [4, 3, 2, 1]

  # Caso 2: Un solo elemento
  head = build_list([42])
  reversed = reverse_dll(head)
  raise "reverse [42]" unless list_to_array(reversed) == [42]

  # Caso 3: Lista vacia
  reversed = reverse_dll(nil)
  raise "reverse nil" unless reversed.nil?

  # Caso 4: Verificar punteros prev quedaron correctos
  head = build_list([10, 20, 30])
  reversed = reverse_dll(head)
  # Despues de reverse: 30 <-> 20 <-> 10
  raise "prev of new head" unless reversed.prev.nil?
  raise "next of new head" unless reversed.next.val == 20
  raise "prev of tail" unless reversed.next.next.prev.val == 20

  # Caso 5: Dos elementos
  head = build_list([5, 10])
  reversed = reverse_dll(head)
  raise "reverse [5,10]" unless list_to_array(reversed) == [10, 5]
  raise "prev of head [10,5]" unless reversed.prev.nil?
  raise "next of head [10,5]" unless reversed.next.val == 5

  puts "test_reverse_dll: PASSED"
end

test_reverse_dll
# 
# pensamientos
# para que esto funcione necesito tomar current y hacer que el .prev sea el next y el .next sea el prev
# despues current sera igual a .next inicial (antes de aplicar los cambios)
