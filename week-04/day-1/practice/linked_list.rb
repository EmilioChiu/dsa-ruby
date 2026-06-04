# Implementación de Singly Linked List en Ruby

class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  # Agrega un elemento al final de la lista
  # Complejidad Temporal esperada: O(n)
  def append(value)
    return @head = Node.new(value) if @head.nil?

    current = @head
    while not current.next_node.nil?
      current = current.next_node
    end
    current.next_node = Node.new(value)
  end

  # Agrega un elemento al inicio de la lista
  # Complejidad Temporal esperada: O(1)
  def prepend(value)
    second_element = @head
    @head = Node.new(value)

    @head.next_node = second_element
  end

  # Elimina el primer nodo que contenga el valor dado
  # Complejidad Temporal esperada: O(n)
  def delete(value)
    return @head = @head.next_node if @head.value == value
    current = @head
    while !current.next_node.nil? && current.next_node.value != value 
      current = current.next_node
    end

    if current.next_node.nil?
      false
    else 
      current.next_node = current.next_node.next_node
    end
  end

  # Devuelve una representación visual de la lista
  # Ejemplo: "1 -> 2 -> 3 -> nil"
  def display
    current = @head
    visual_list = ""

    while current
      visual_list << "#{current.value.to_s} -> "
      current = current.next_node
    end
    visual_list << "nil"
  end
end

# --- Pruebas Manuales ---
list = LinkedList.new
list.append(10)
list.append(20)
list.prepend(5)
puts list.display # Debería mostrar: 5 -> 10 -> 20 -> nil

list.delete(10)
puts list.display # Debería mostrar: 5 -> 20 -> nil

list.delete(5)
puts list.display # Debería mostrar: 20 -> nil
