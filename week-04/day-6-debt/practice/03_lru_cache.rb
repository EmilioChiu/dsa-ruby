## [Re-intento] LRU Cache

### Problema
# Implementa una estructura Least Recently Used (LRU) Cache con las operaciones `get` y `put`,
# ambas en tiempo O(1).

# La cache tiene una capacidad fija. Cuando alcanza su capacidad máxima, debe desalojar
# el elemento usado menos recientemente (LRU) antes de insertar uno nuevo.

# ### Constraints
# - 1 <= capacity <= 3000
# - 0 <= key <= 10^4
# - 0 <= value <= 10^5
# - A lo sumo 2 * 10^5 llamadas a get y put

### Ejemplos
# ```
# Input
# ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
# [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]

# Output
# [null, null, null, 1, null, -1, null, -1, 3, 4]

# Explicacion:
# LRUCache lRUCache = new LRUCache(2);
# lRUCache.put(1, 1); // cache: {1=1}
# lRUCache.put(2, 2); // cache: {1=1, 2=2}
# lRUCache.get(1);    // retorna 1, mueve 1 al frente
# lRUCache.put(3, 3); // desaloja 2 (LRU), cache: {1=1, 3=3}
# lRUCache.get(2);    // retorna -1 (no encontrado)
# lRUCache.put(4, 4); // desaloja 1 (LRU), cache: {3=3, 4=4}
# lRUCache.get(1);    // retorna -1 (no encontrado)
# lRUCache.get(3);    // retorna 3
# lRUCache.get(4);    // retorna 4
# ```

class Node
  attr_accessor :prev, :val, :key, :next

  def initialize(key, val, prev = nil, nxt = nil)
    @next = nxt
    @prev = prev
    @val = val
    @key = key
  end
end
### Signature
class LRUCache
  attr_accessor :map, :capacity, :head, :tail

  def initialize(capacity)
    @head = Node.new(0, 0)
    @tail = Node.new(0, 0)
    @capacity = capacity
    @map = Hash.new

    @head.next = @tail
    @tail.prev = @head
  end

  def remove(node)
    nxt = node.next
    prev = node.prev

    prev.next = nxt
    nxt.prev = prev
  end

  def insert_after(node, middle_node)
    nxt = node.next
    node.next = middle_node
    nxt.prev = middle_node
    
    middle_node.next = nxt
    middle_node.prev = node
  end

  def get(key)
    node = @map[key]
    return -1 if node.nil?
    remove(node)
    insert_after(@head, node)
    node.val
  end

  def put(key, value)
    new_node = Node.new(key, value)

    if @map.size == @capacity && @map[key].nil?
      @map.delete(@tail.prev.key)
      remove(@tail.prev) 
    end

    remove(@map[key]) if @map[key]

    @map[key] = new_node
    insert_after(@head, new_node)
  end
end

### Tests
def test_lru
  cache = LRUCache.new(2)

  cache.put(1, 1)
  cache.put(2, 2)
  res1 = cache.get(1)
  raise "get(1) should be 1" unless res1 == 1

  cache.put(3, 3)
  res2 = cache.get(2)
  raise "get(2) should be -1 after eviction" unless res2 == -1

  cache.put(4, 4)
  res3 = cache.get(1)
  raise "get(1) should be -1 after eviction" unless res3 == -1

  res4 = cache.get(3)
  raise "get(3) should be 3" unless res4 == 3

  res5 = cache.get(4)
  raise "get(4) should be 4" unless res5 == 4

  puts "test_lru: PASSED"
end

def test_lru_edge_cases
  # Capacidad 1
  cache = LRUCache.new(1)
  cache.put(1, 10)
  res1 = cache.get(1)
  raise "get(1) should be 10" unless res1 == 10

  cache.put(2, 20)
  res2 = cache.get(1)
  raise "get(1) should be -1 after eviction" unless res2 == -1

  res3 = cache.get(2)
  raise "get(2) should be 20" unless res3 == 20

  # Update existente
  cache2 = LRUCache.new(2)
  cache2.put(1, 1)
  cache2.put(1, 100)
  res4 = cache2.get(1)
  raise "get(1) should be 100 after update" unless res4 == 100

  puts "test_lru_edge_cases: PASSED"
end

test_lru
test_lru_edge_cases

# ok, como sabemos para que el get sea o(1) necesitamos usar un hash
# y para que put sea o(1) necesitamos una double linkedlist
# que vamos a hacer:
# hacer que el hash storee el key y el node donde sujeta el value (esto nos hara facil cuando querramos el get)
# siempre revisaremos si esta cerca del limite de capacidad, una vez llegue ahi, tendremos que hacer un insert en el @tail.prev (el ultimo nodo de la lista)
# los get tambien haran que se haga un insert despues de @head (head.next) y el remove de donde estaban, de esta manera tendremos actualizada la cache con tail.prev el objeto menos usado
#
# empezare por crear la clase node y la linkedlist
