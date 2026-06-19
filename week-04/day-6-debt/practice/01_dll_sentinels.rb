## [Warm-up 1] Doubly Linked List con Centinelas

### Problema
# Implementa una Doubly Linked List (lista doblemente enlazada) usando nodos centinela
# (dummy `head` y `tail`). Los centinelas son nodos fijos que nunca contienen datos reales
# — existen solo para simplificar las operaciones al eliminar la necesidad de checkear nil.

# Los nodos centinela tienen las siguientes propiedades invariables:
#   - `head.prev` SIEMPRE es nil
#   - `tail.next` SIEMPRE es nil
#   - head y tail NUNCA se eliminan

### Operaciones a implementar

# | Metodo | Descripcion |
# |--------|------------|
# | `insert_after(node, val)` | Crea un nodo con `val` y lo inserta inmediatamente despues de `node`. Retorna el nuevo nodo. |
# | `remove(node)` | Remueve `node` de la lista (node nunca es centinela). |
# | `push_front(val)` | Inserta al inicio (justo despues de head). |
# | `push_back(val)` | Inserta al final (justo antes de tail). |
# | `pop_front` | Remueve y retorna el valor del primer nodo real. `nil` si no hay. |
# | `pop_back` | Remueve y retorna el valor del ultimo nodo real. `nil` si no hay. |
# | `to_a` | Retorna un array con los valores en orden. |
# | `empty?` | Retorna true si no hay nodos reales. |

### Signature
class Node
  attr_accessor :val, :prev, :next

  def initialize(val, nxt = nil, prev = nil)
    @val = val
    @next = nxt
    @prev = prev
  end
end

class DoublyLinkedList
  attr_accessor :head, :tail

  def initialize
    @head = Node.new(0)
    @tail = Node.new(0)

    @head.next = @tail
    @tail.prev = @head
  end

  def insert_after(node, val)
    middle_node = Node.new(val)
    nxt = node.next
    node.next = middle_node
    nxt.prev = middle_node
    middle_node.next = nxt
    middle_node.prev = node

    middle_node
  end

  def remove(node)
    return if node.equal?(@head) or node.equal?(@tail)

    prev = node.prev
    nxt = node.next
    prev.next = nxt
    nxt.prev = prev
    node.val
  end

  def push_front(val)
    insert_after(@head, val)
  end

  def push_back(val)
    insert_after(@tail.prev, val)
  end

  def pop_front
    return if @head.next.equal?(@tail)
    remove(@head.next)
  end

  def pop_back
    return if @tail.prev.equal?(@head)
    remove(@tail.prev)
  end

  def to_a
    answer = []
    current = @head
    while current
      answer << current.val unless current === @head or current === @tail
      current = current.next
    end
    answer
  end

  def empty?
    @head.next == @tail
  end
end

### Tests
def test_dll
  dll = DoublyLinkedList.new

  dll.push_front(1)
  dll.push_front(2)
  dll.push_back(3)

  # Lista: head <-> 2 <-> 1 <-> 3 <-> tail
  raise "push/push order" unless dll.to_a == [2, 1, 3]

  front = dll.pop_front
  raise "pop_front value" unless front == 2
  raise "pop_front remainder" unless dll.to_a == [1, 3]

  back = dll.pop_back
  raise "pop_back value" unless back == 3
  raise "pop_back remainder" unless dll.to_a == [1]

  dll.pop_front
  raise "empty after pops" unless dll.empty?

  dll.push_back(10)
  dll.push_back(20)
  dll.push_back(30)
  raise "push_back chain" unless dll.to_a == [10, 20, 30]

  # Verificar que los invariantes de centinela se mantienen
  raise "head.prev should be nil" unless dll.instance_variable_get(:@head).prev.nil?
  raise "tail.next should be nil" unless dll.instance_variable_get(:@tail).next.nil?

  puts "test_dll: PASSED"
end

test_dll
