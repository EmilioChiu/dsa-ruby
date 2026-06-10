# Problema: Daily Temperatures (Temperaturas Diarias)
#
# Descripción:
# Dada una lista de temperaturas diarias `temperatures` representadas por un arreglo de enteros, 
# devuelve un arreglo `answer` tal que `answer[i]` es el número de días que tienes que esperar 
# después del día `i` para obtener una temperatura más cálida. Si no hay ningún día futuro 
# para el cual esto sea posible, mantén `answer[i] == 0`.
#
# Restricciones:
# - 1 <= temperatures.length <= 10^5
# - 30 <= temperatures[i] <= 100

# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
  stack = []
  answer = Array.new(temperatures.length, 0)

  temperatures.each_with_index do |temperature, index|
    while !stack.empty? && temperature > temperatures[stack.last]
        prev_temp = stack.pop
        days_for_hotter_temp = index - prev_temp
        answer[prev_temp] = days_for_hotter_temp
    end
    stack << index
  end
  answer
end

# --- Casos de Prueba ---
puts "Test 1: #{daily_temperatures([73, 74, 75, 71, 69, 72, 76, 73]) == [1, 1, 4, 2, 1, 1, 0, 0] ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{daily_temperatures([30, 40, 50, 60]) == [1, 1, 1, 0] ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{daily_temperatures([30, 30, 30]) == [0, 0, 0] ? 'PASSED' : 'FAILED'}"

# pensamiento:
# para este algoritmo se me ocurre ir de atras hacia adelante, es decir en el dia temperatures[-1] siempre sera igual a 0, ya que no existe un dia despues a eso
# despues ir pa atras poco a poco, y mientras va llendo para atras revisa el valor actual con el valor max guardado (esto nos indicara si vale la pena buscar el mas cercano o no) en caso de que el valor mas grande siga siendo mas pequeño que el valor actual vamos a guardar 0 en el answer
# en caso de que el max si sea mayor al valor actual vamos a empezar la busqueda
# se me ocurre que una vez sepamos que SI hay valores mayores guardados, se vaya del ultimo al primero buscando cual es el mayor mas cercano
# sin embargo esta solucion segun yo al final es cuadratica por lo que no me termina de ocnvencer y estoy tratando de pensar otra solucion
#
# se me ocurre un sistema de buckets, sin embargo no se exactamente como eso puede ayudar
# se me ocurre una solucion con slow/fast pointers, donde se cree answer y se inicialicen a todos en 0 con el tamaño de temperatures.length, luego hacer un bucle donde fast empiece desde el indice 1, para que slow sea el 0, e ir comparando. si slow es menor a fast hacer el calculo de cuanto lo separan (fast.index - slow.index) y esa separacion guardarla en answer ej: answer[slow.index] = (fast.index - slow.index), ya que se encontro el valor de ese slow va a ser slow += 1 y fast sera igual a slow + 1
#
# siento que ambas tienen el mismo problema, no tengo una forma mas rapida de saber la respuesta, voy a pedir ayuda
#
# me genero la lectura: 0002-monotonic-stack-daily-temperatures.html, y ya la termine de leer, p
