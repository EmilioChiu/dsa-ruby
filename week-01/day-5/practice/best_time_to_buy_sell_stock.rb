# PROBLEMA: Best Time to Buy and Sell Stock
#
# DESCRIPCIÓN:
# Se te da un arreglo 'prices' donde prices[i] es el precio de una acción 
# dada en el día i.
# 
# Quieres maximizar tu ganancia eligiendo un solo día para comprar una acción 
# y eligiendo un día diferente en el futuro para vender esa acción.
#
# Devuelve la ganancia máxima que puedes obtener de esta transacción. 
# Si no puedes obtener ninguna ganancia, devuelve 0.
#
# Ejemplo:
#   Input: prices = [7, 1, 5, 3, 6, 4]
#   Output: 5 (Compra el día 2 a precio 1, vende el día 5 a precio 6, ganancia = 6-1 = 5)
#
# RESTRICCIONES:
# - Tiempo: O(n)
# - Espacio: O(1)

def max_profit(prices)
  best_time_to_buy = prices[0]
  max_profit = 0
  local_profit = 0

  prices.each_with_index do |item, index|
    next if index == 0
    local_profit = item - best_time_to_buy
    max_profit = [max_profit, local_profit].max
    best_time_to_buy = [best_time_to_buy, item].min
  end
  max_profit
end

# --- PRUEBAS ---
puts "Test 1: #{max_profit([7, 1, 5, 3, 6, 4]) == 5 ? 'PASSED' : 'FAILED'}"
puts "Test 2: #{max_profit([7, 6, 4, 3, 1]) == 0 ? 'PASSED' : 'FAILED'}"
puts "Test 3: #{max_profit([1, 2]) == 1 ? 'PASSED' : 'FAILED'}"
puts "Test 4: #{max_profit([2, 4, 1, 1]) == 2 ? 'PASSED' : 'FAILED'}"

# pasos
# tendremos un max_pro que setearemos a 0 el cual sera el que devolvamos al final
# vamos a tener un best_time_to_buy y lo setearemos en n[0]
# por cada paso vamos a restar best_time_to_buy con el valor actual (n[i]) y revisaremos si es mayor (>) al valor actual de max_pro de ser cierto setearemos ese como valor nuevo a max_pro
# cada paso iremos comparando best_time_to_buy con el valor actual y si el nuevo valor es menor al que esta guardado este sera el nuevo best_time_to_buy
