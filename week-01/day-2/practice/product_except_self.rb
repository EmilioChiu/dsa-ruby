# PROBLEMA: Product of Array Except Self
#
# DESCRIPCIÓN:
# Dado un arreglo de enteros 'nums', devuelve un arreglo 'answer' tal que 
# answer[i] sea igual al producto de todos los elementos de 'nums' excepto nums[i].
#
# RESTRICCIÓN CLAVE: 
# - NO puedes usar la operación de división.
# - Debes resolverlo en tiempo O(n).
#
# EXPECTATIVAS:
# - Input: [1, 2, 3, 4]
# - Output: [24, 12, 8, 6] 
#   (Explicación: [2*3*4, 1*3*4, 1*2*4, 1*2*3])
#
# RESTRICCIONES TÉCNICAS:
# - Tiempo: O(n)
# - Espacio: O(n) para el arreglo de salida.

def product_except_self(nums)
  righ_acc = 1
  left_acc = 1
  left = 0
  right = nums.length() - 1
  prefix = Array.new(nums.length(), 1)
  suffix = Array.new(nums.length(), 1)
  answer = []

  nums.each do |item|
    righ_acc *= nums[left] 
    prefix[left] = righ_acc

    left_acc *= nums[right] 
    suffix[right] = left_acc
    right -= 1
    left += 1
  end

  nums.each_with_index do |item, index|
    if index == 0
      answer.push suffix[index + 1]
    elsif index == nums.length() -1
      answer.push prefix[index -1]
    else
      answer.push suffix[index + 1] * prefix[index - 1]
    end
  end
  answer
end

def product_except_self(nums)
  answer = Array.new(nums.length)
  product = 1
  nums.each_with_index do |item, index| # <- prefix
    answer[index] = product
    product *= item
  end

  product = 1
  index = nums.length()-1
  nums.length.times do |t| # <- postfix
    answer[index] *= product
    product *= nums[index]
    index -= 1
  end
  answer
end

# --- PRUEBAS ---
puts "Test 1: #{product_except_self([1, 2, 3, 4]) == [24, 12, 8, 6] ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{product_except_self([-1, 1, 0, -3, 3]) == [0, 0, 9, 0, 0] ? 'PASSED' : 'FAILED'}"
