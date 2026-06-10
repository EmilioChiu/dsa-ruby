# Problema: Valid Parentheses (Paréntesis Válidos)
#
# Descripción:
# Dado un string `s` que contiene solo los caracteres '(', ')', '{', '}', '[' y ']', determina si el string de entrada es válido.
# Un string de entrada es válido si:
# 1. Los paréntesis abiertos deben cerrarse por el mismo tipo de paréntesis.
# 2. Los paréntesis abiertos deben cerrarse en el orden correcto.
# 3. Cada paréntesis cerrado tiene un paréntesis abierto correspondiente del mismo tipo.
#
# Restricciones:
# - 1 <= s.length <= 10^4
# - `s` consiste solo de caracteres de paréntesis `()[]{}`.

# @param {String} s
# @return {Boolean}
def is_valid(s)
  open_parentheses = []
  types_of_parentheses = { ')' => '(', '}' => '{', ']' => '[' }

  (0...s.length).each do |index|
    char = s[index]
    expected_open = types_of_parentheses[char]

    if !expected_open
      open_parentheses.push(char)
    elsif expected_open == open_parentheses.last
      open_parentheses.pop
    else
      return false
    end
  end

  open_parentheses.empty?
end

# --- Casos de Prueba ---
puts "Test 1: #{is_valid('()') == true ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{is_valid('()[]{}') == true ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{is_valid('(]') == false ? 'PASSED' : 'FAILED'}"
puts "Test 4: #{is_valid('([)]') == false ? 'PASSED' : 'FAILED'}"
puts "Test 5: #{is_valid('{[]}') == true ? 'PASSED' : 'FAILED'}"

# pensamientos:
# no me dice en que tiempo debe hacerce pero lo mas seguro es que sea O(n) de tiempo
# acabo de entender el concepto "lifo", por lo que supongo que tiene que ver con eso
# de primera impresion se me ocurre un slow/fast algoritmo donde slow sea el primer "parentesis" y vaya recorriendo el string hasta toparse con el mismo que existe en slow
# en caso de toparse con el parentesis de cierre hacer que slow avance posiciones e ir revisando que los parentesis que continuen despues del primero se vayan cerrando
# para esto fast va a tener que ir regresando lugares hasta estar en la posicion slow + 1
# repetir el ciclo hasta que el string se acabe
#
# en este caso fast se iniciara como slow + 1 y cada que encuentre el par se volvera a iniciar de esta forma (ya no se tendria que ir regresando poco a poco), sin embargo si uso este metodo probablemente se rompa con strings donde no esten bien cerrados los parentesis (ej. "([)]", donde [ se cierra despues del parentesis normal)
# por lo que creo que lo correcto sera ir de adelante hacia atras cuando se necesite una busqueda dentro de parentesis, lo siguiente es analisar que complejidad seria
# por lo que llego a pensar probablemente sea cuadratica ya que necesitaria revisar de adelante hacia atras y atras de hacia adelante n-1 veces
