# Desafío: Implementar una SimpleHashMap
#
# Objetivo: Entender cómo funciona un Hash Map por debajo:
# 1. Hashing: Convertir una llave en un índice de array.
# 2. Manejo de colisiones: ¿Qué pasa si dos llaves dan el mismo índice?
#
# Instrucciones:
# - Implementa los métodos `put`, `get` y `remove`.
# - No uses el objeto Hash `{}` de Ruby para la implementación interna.
# - Usa un array de tamaño fijo (@size).
# - Cada posición del array (@buckets[index]) debe manejar colisiones (Chaining).

class SimpleHashMap
  def initialize(size = 10)
    @size = size
    @buckets = Array.new(@size) { [] } # Cada bucket es un array para manejar colisiones (Chaining)
  end

  # Convierte una llave (string o símbolo) en un índice de 0 a @size - 1
  def hash_function(key)
    key.to_s.hash % @size
  end

  def put(key, value)
    index = hash_function(key)
    bucket = @buckets[index]

    bucket.each_with_index do |item, _index|
      if item[0] == key
        item[1] = value
        return "#{key} updated: #{value}"
      end
    end

    bucket << [key, value]
  end

  def get(key)
    index = hash_function(key)
    bucket = @buckets[index]

    bucket.each_with_index do |item, _index|
      return item[1] if item[0] == key
    end
    nil
  end

  def remove(key)
    index = hash_function(key)
    bucket = @buckets[index]

    bucket.each_with_index do |item, index|
      bucket.delete_at(index) if item[0] == key
    end
    nil
  end
end

# --- Casos de Prueba ---
hash = SimpleHashMap.new(5)
hash.put('name', 'Alice')
hash.put('age', 30)
hash.put('city', 'Madrid')

puts "Test 1 - Get: #{hash.get('name') == 'Alice' ? 'PASSED' : 'FAILED'}"
puts "Test 2 - Update: #{hash.put('name', 'Bob')
                         hash.get('name') == 'Bob' ? 'PASSED' : 'FAILED'}"

# Forzar colisión (al ser tamaño 5, es probable que haya alguna)
# Pero probaremos con varias llaves
hash.put('role', 'Engineer')
hash.put('dept', 'IT')

puts "Test 3 - Collision handling: #{hash.get('role') == 'Engineer' && hash.get('age') == 30 ? 'PASSED' : 'FAILED'}"

hash.remove('age')
puts "Test 4 - Remove: #{hash.get('age').nil? ? 'PASSED' : 'FAILED'}"
