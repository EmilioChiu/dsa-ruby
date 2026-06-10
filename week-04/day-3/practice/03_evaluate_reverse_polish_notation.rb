# Problema: Evaluate Reverse Polish Notation (Evaluar Notación Polaca Inversa)
#
# Descripción:
# Evalúa el valor de una expresión aritmética en Notación Polaca Inversa (RPN).
# Los operadores válidos son `+`, `-`, `*` y `/`. Cada operando puede ser un entero u otra expresión.
# La división entre dos enteros siempre debe truncar hacia cero (ej. 6 / -132 debe truncarse a 0).
# Se garantiza que la expresión dada es siempre válida y no habrá división por cero.
#
# Restricciones:
# - 1 <= tokens.length <= 10^4
# - `tokens[i]` es un operador válido (`+`, `-`, `*`, `/`), o un entero en el rango `[-200, 200]`.

# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  digits = []
  valid_operators = {'+' => :+, '-' => :-, '*' => :*, '/' => :/}


  tokens.each do |token|
    if valid_operators[token]
      b = digits.pop
      a = digits.pop
      token == '/' ? c = (a.to_f / b.to_f).to_i : c = a.send(valid_operators[token], b)
      digits << c
    else
      digits << token.to_i
    end
  end
  digits[0]
end


# --- Casos de Prueba ---
puts "Test 1: #{eval_rpn(["2", "1", "+", "3", "*"]) == 9 ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{eval_rpn(["4", "13", "5", "/", "+"]) == 6 ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{eval_rpn(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]) == 22 ? 'PASSED' : 'FAILED'}"

# pensamiento:
# creo que sabiendo como funciona la notacion polaca puede ser sencillo:
# tengo que ir pasando por cada elemento en el array, e ir acumulando los elementos que NO sean operadores ('+`, `-`, `*`, `/`)
# una vez que encuentre el primer operador se puede hacer un .map para se haga la operacion con todos los elementos (mientras los va eliminando) guardados hasta ese momento
# una vez que terminen las operaciones seguira el mimo patron hasta terminar con los elementos
#
# la complejidad va a ser O(N) ya se va a recorrer un maximo de 2 veces el array (el loop de inicio a fin y el interno cuando se tenga que hacer las operaciones) sin embargo solo se cuenta N
#
# dificultades:
# pensando en este enfoque creo que lo mas importante es el orden en el que se hagan las operaciones, ya que una resta o division mal hecha puede dar resultados que no queremos
# para esto estoy pensando que la solucion viene en como van a ir irse acumulando antes de hacer las operaciones
# sin embargo al hacer un .map va a ir en orden, por lo que no deberia de haber ningun problema 
#
# procedere a implementar el codigo
#
# al parecer no habia terminado de entender como funcionaba la notacion polaca: NO sirve como un acumulador de todos los digitos anteriores, si no que solo es de dos ej: 5, 6, + = 11 este funciona porque son solo dos digitos sin embargo si hubieran 3: 1, 2, 3 + = [5, 1] por lo que esta mal, ya que no termina las operaciones deberia de ser asi: 1,2,3,+,+ para que al final sea un 5+1= 6
# sabiendo esto tengo que modificar lo que pense que ya tenia: 
#
# modificaciones:
# esta bien el acumulador de digitos, sin embargo a la hora de toparse con los operadores se tiene que hacer pop de los ultimos 2 elementos, y hacer la operacion necesario, ej: a + b = c donde a y b se van a hacer pop y c se hara un push
