# Concepto: Invertir una lista ligada de forma iterativa.

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  current = head
  last_node = nil

  while current
    next_node = current.next
    current.next = last_node 
    last_node = current
    current = next_node
  end
  last_node
end

# --- Casos de Prueba ---
def build_list(arr)
  return nil if arr.empty?

  head = ListNode.new(arr[0])
  current = head
  arr[1..-1].each do |val|
    current.next = ListNode.new(val)
    current = current.next
  end
  head
end

def list_to_arr(node)
  res = []
  while node
    res << node.val
    node = node.next
  end
  res
end

# Test 1: [1, 2, 3, 4, 5] -> [5, 4, 3, 2, 1]
head1 = build_list([1, 2, 3, 4, 5])
reversed1 = reverse_list(head1)
puts "Test 1: #{list_to_arr(reversed1) == [5, 4, 3, 2, 1] ? 'PASSED' : 'FAILED'}"

# Test 2: [1, 2] -> [2, 1]
head2 = build_list([1, 2])
reversed2 = reverse_list(head2)
puts "Test 2: #{list_to_arr(reversed2) == [2, 1] ? 'PASSED' : 'FAILED'}"

# se me hace un poco complicado pensar como lo puedo hacer sin hacer una lista extra, sin embargo despues de un rato se me ocurrio hacer uso del @head, sin embargo me acabo de dar cuenta que no esta esa variable, supongo que puedo hacer un seudo head, aunque no este ahi puedo iniciar la variable head e irla modificando, mi idea es hacer un pseudo prepend donde se revise head y cada uno ir haciendo prepend del node actual (cada iteracion se va a volver el head el anterior se pondra como su next)
