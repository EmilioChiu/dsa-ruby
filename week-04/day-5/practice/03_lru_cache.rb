# Problema 3: LRU Cache
# Objetivo: Implementar una estructura Least Recently Used (LRU) Cache.
# Requerimiento: get y put deben ser O(1).

class Node
  attr_accessor :key, :val, :prev, :next

  def initialize(key, val)
    @key = key
    @val = val
    @prev = nil
    @next = nil
  end
end

class LRUCache
  attr_accessor :map, :capacity, :tail, :head

  def initialize(capacity)
    @capacity = capacity
    @map = {} # key -> Node

    # Dummies para evitar checar nulos en la lista
    @head = Node.new(0, 0)
    @tail = Node.new(0, 0)
    @head.next = @tail
    @tail.prev = @head
  end

  # @param {Integer} key
  # @return {Integer}
  def get(key)
    if @map[key]
      remove(@map[key])
      insert(@map[key])

      @map[key].val
    else
      -1
    end
  end

  # @param {Integer} key
  # @param {Integer} value
  # @return {Void}
  def put(key, value)
    remove(@map[key]) if @map[key]

    new_node = Node.new(key, value)
    insert(new_node)
    @map[key] = new_node

    return unless @map.size > @capacity

    lru = @tail.prev
    remove(lru)
    @map.delete(lru.key)
  end

  private

  # Auxiliar: Remueve un nodo de la lista
  def remove(node) 
    prev_node = node.prev
    nxt_node = node.next

    prev_node.next, nxt_node.prev = nxt_node, prev_node
  end

  # Auxiliar: Inserta un nodo justo después de @head (lo hace el más reciente)
  def insert(node)
    prev, nxt = @head, @head.next
    prev.next = node
    nxt.prev = node
    node.next, node.prev = nxt, prev
  end
end

# --- Casos de Prueba ---
def test_lru
  cache = LRUCache.new(2)

  cache.put(1, 1)
  cache.put(2, 2)
  res1 = cache.get(1)       # retorna 1
  cache.put(3, 3)           # desaloja llave 2
  res2 = cache.get(2)       # retorna -1 (no encontrado)
  cache.put(4, 4)           # desaloja llave 1
  res3 = cache.get(1)       # retorna -1 (no encontrado)
  res4 = cache.get(3)       # retorna 3
  res5 = cache.get(4)       # retorna 4

  results = [res1 == 1, res2 == -1, res3 == -1, res4 == 3, res5 == 4]

  puts "Prueba LRU: #{results.all? ? 'PASSED' : 'FAILED'}"
  puts "Detalle: #{results}"
end

test_lru

# pensar:
# problema:
# el problema me indica que necesito crear un sistema de cache donde se ponga un limite de capacidad y que despues de exceder ese limite vaya removiendo el ultimo elemento usado
# para poder poner uno nuevo en su lugar
#
# necesito definir que debe pasar en cada caso:
# 1: en caso de que la capacidad sea menor a la capacidad maxima seguir metiendo nodes al map de manera normal
# voy a hacer eso primero
