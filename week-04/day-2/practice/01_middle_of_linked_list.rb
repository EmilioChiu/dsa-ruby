# Concepto: Encontrar el nodo medio de una lista ligada.
# Si hay dos nodos medios, devolver el segundo.

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} head
# @return {ListNode}
def middle_node_first_v(head)
  middle = head
  current = head
  counter_step = 0

  while current
    current = current.next
    counter_step += 1
    middle, counter_step = middle.next, 0 if counter_step == 2
  end
  middle
end

# @param {ListNode} head
# @return {ListNode}
def middle_node(head)
  middle = head
  current = head

  while current
    if current.next.nil?
      current = current.next
    else
      current = current.next.next
      middle = middle.next
    end
  end
  middle
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

# Test 1: [1, 2, 3, 4, 5] -> Resultado esperado: [3, 4, 5] (Nodo con valor 3)
head1 = build_list([1, 2, 3, 4, 5])
result1 = middle_node(head1)
puts "Test 1: #{list_to_arr(result1) == [3, 4, 5] ? 'PASSED' : 'FAILED'} (Got: #{list_to_arr(result1)})"

# Test 2: [1, 2, 3, 4, 5, 6] -> Resultado esperado: [4, 5, 6] (Nodo con valor 4)
head2 = build_list([1, 2, 3, 4, 5, 6])
result2 = middle_node(head2)
puts "Test 2: #{list_to_arr(result2) == [4, 5, 6] ? 'PASSED' : 'FAILED'} (Got: #{list_to_arr(result2)})"

# para este algoritmo tengo que pensar solucionarlo con el slow/fast algoritmo, para esto, tengo que dejar en claro 2 cosas: fast va a avanzar siempre, slow va a avanzar cada vez que fast avance 2 pasos, ej: fast, slow: 0
# fast:1 slow:0, fast:2, slow:1...
# de esta manera hare que cumplan con los tests, ahora tengo que entender que viene en middle_node: es una linked list que va a empezar desde head (el primer nodo), tengo que avanzar haciendo uso de .next 
# por lo que tengo que crear un loop que vaya de next en next y por cada 2 next guarde ese nodo en una variable llamada: middle 
# voy a empezr a hacer el codigo
