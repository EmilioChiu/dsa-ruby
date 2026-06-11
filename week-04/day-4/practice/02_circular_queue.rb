class MyCircularQueue
  # @param {Integer} k
  def initialize(k)
    @queue = Array.new(k)
    @head = 0
    @tail = 0
    @counter = 0
    @limit = k
  end

  # Inserta un elemento en la cola. Retorna true si tiene éxito.
  # @param {Integer} value
  # @return {Boolean}
  def en_queue(value)
    return false if @counter >= @limit

    @queue[@head] = value
    @head += 1
    @counter += 1
    @head = 0 if @head >= @limit

    true
  end

  # Elimina un elemento de la cola. Retorna true si tiene éxito.
  # @return {Boolean}
  def de_queue
    return false if @counter == 0

    @queue[@tail] = nil
    @tail += 1
    @counter -= 1
    @tail = 0 if @tail >= @limit

    true
  end

  # Obtiene el elemento al frente. Retorna -1 si está vacía.
  # @return {Integer}
  def front
    return -1 if is_empty
    @queue[@tail]
  end

  # Obtiene el último elemento. Retorna -1 si está vacía.
  # @return {Integer}
  def rear
    return -1 if is_empty
    @queue[@head-1]
  end

  # @return {Boolean}
  def is_empty
    @counter.zero?
  end

  # @return {Boolean}
  def is_full
    @counter == @limit
  end
end

# Tests (No los modifiques)
obj = MyCircularQueue.new(3)
puts "Enq 1: #{obj.en_queue(1)} (esperado: true)"
puts "Enq 2: #{obj.en_queue(2)} (esperado: true)"
puts "Enq 3: #{obj.en_queue(3)} (esperado: true)"
puts "Enq 4: #{obj.en_queue(4)} (esperado: false)"
puts "Rear: #{obj.rear} (esperado: 3)"
puts "IsFull: #{obj.is_full} (esperado: true)"
puts "Deq: #{obj.de_queue} (esperado: true)"
puts "Enq 4: #{obj.en_queue(4)} (esperado: true)"
puts "Rear: #{obj.rear} (esperado: 4)"

# pensamientos:
# primero debo ver si entendi bien el problema:
# necesito crear un array fijo el cual debe estar en constante cambie, es decir:
# no puede tener mas de k elementos (si el usuario trata de usar en_queue y la cola esta llena retorna false)
# a la hora de eliminar en teoria deberia de ser un .pop simple, es decir no deberia de haber tema si quitamos el ultimo insertado
# al parecer los valores por defecto son "-1" necesito preguntar si la queue solo aceptara elementos positivos, porque si es el caso, puedo inicializar todos en -1
# voy a preguntar si entendi bien el problema

# necesito quitar siempre el primer elemento (no es pop)
# es mejor revisar si esta full o no el array en lugar de regresar -1 como default
#
# necesito pensar como hacer que el array se vaya llenando de forma circular
# pienso en que si esta bien tener el tail y head, donde head sea el primer elemento y tail el ultimo
# ir llenando de forma normal el array (ascendente) sin embargo una vez llega a ser == que k regresar a 0
# cuando se vuelva a tratar de insertar algo se tiene que preguntar si tail y head son iguales (aqui me di cuenta porque es buena idea el counter, puedo hacer un && donde revise que counter => k) en caso que sea positivo significa que la cola esta llena y regresara falso
# con esto tengo la logica mas compleja, ya que para front solo tengo que regresar "head" y para rear "tail"
# lo mismo para is_empty y is_full, solo regreso counter == 0 y counter => k   respectivamente
# listo, voy a empezar a crear el codigo y revisare que funcione
