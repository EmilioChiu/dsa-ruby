# Concepto: Fusionar dos listas ligadas ordenadas en una sola lista ordenada.

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  dummy = ListNode.new(0)
  current = dummy

  while list1 and list2 
    if list2.val > list1.val
      current.next = list1
      list1 = list1.next
    else
      current.next = list2
      list2 = list2.next
    end
    current = current.next
  end

  list1.nil? ? current.next = list2 : current.next = list1

  dummy.next
end

def find_min(list1, list2)
  list2.val > list1.val ? list1 : list2
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

# Test 1: [1, 2, 4], [1, 3, 4] -> [1, 1, 2, 3, 4, 4]
l1 = build_list([1, 2, 4])
l2 = build_list([1, 3, 4])
merged1 = merge_two_lists(l1, l2)
puts "Test 1: #{list_to_arr(merged1) == [1, 1, 2, 3, 4, 4] ? 'PASSED' : 'FAILED'}"
return

# Test 2: [], [0] -> [0]
l3 = build_list([])
l4 = build_list([0])
merged2 = merge_two_lists(l3, l4)
puts "Test 2: #{list_to_arr(merged2) == [0] ? 'PASSED' : 'FAILED'}"

# primero nos dan 2 listas (al parecer ordenadas, sin embargo tengo que preguntar si esto es el 100% de los casos) suponiendo que ya estan ordenadas, se me ocurre un algoritmo slow/fast, el cual vaya iterando con las listas y que se vaya eligiendo cual va a ir avanzando dependiendo de quien sea menor ej. ([1,2,3,4...], [1,1,2,3,4] en este caso, no va a importar cual avance primero, sin embargo cuando cualquiera de los dos avance al 2 debera de empezar a hacer merge del otro lado (donde todavia hay un 1))
# para esto voy a necesitar las siguientes variables current_arr_1, current_arr_2 y current (esta sera la minima global)
# voy a iniciar un while current e ir comparando current_arr_1 y current_arr_2 la que sea menor sera la elegida
#
# 
