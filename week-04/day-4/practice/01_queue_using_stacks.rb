class MyQueue
  def initialize
    @stack1 = []
    @stack2 = []
  end

  # Push element x to the back of queue.
  # @param {Integer} x
  # @return {Void}
  def push(val)
    @stack1 << val
  end

  # Removes the element from in front of queue and returns that element.
  # @return {Integer}
  def pop
    reverse
    @stack2.pop
  end

  # Get the front element.
  # @return {Integer}
  def peek
    reverse
    @stack2.last
  end

  # Returns whether the queue is empty.
  # @return {Boolean}
  def empty
    @stack1.empty? && @stack2.empty?
  end

  def reverse
    if @stack2.empty?
      @stack2 << @stack1.pop until @stack1.empty?
    end
  end
end

# Tests (No los modifiques)
q = MyQueue.new
q.push(1)
q.push(2)
puts "Peek: #{q.peek} (esperado: 1)"
puts "Pop: #{q.pop} (esperado: 1)"
puts "Empty: #{q.empty} (esperado: false)"

# pensamientos:
# me dice que es un fifo (first in first out)
# y que necesita dos stacks
# uno que funcione normal (si el usuario quiere añadir elementos solo hace un push a stack1)
# otro
