# PROBLEMA: Container With Most Water
#
# Dado un arreglo de enteros 'height' donde height[i] representa la altura
# de una linea vertical en la posicion i, encuentra dos lineas que junto con
# el eje X formen un contenedor que almacene la mayor cantidad de agua.
#
# RESTRICCIONES:
# - Resolver con 2 pointers (uno al inicio, otro al final, convergiendo)
# - No brute-force (O(n^2) no es aceptable)
# - Debe ser O(n) tiempo, O(1) espacio extra
# - El volumen = min(height[left], height[right]) * (right - left)
#
# @param {Integer[]} height
# @return {Integer} area maxima
def max_area(height)
  left = 0
  right = height.length() - 1
  max = 0

  while left < right
    broad = right - left
    altura = [height[left], height[right]].min
    local_max = broad * altura
    if local_max > max
      max = local_max
    end
    height[left] > height[right] ? right -= 1 : left += 1
  end
  max
end

# --- PRUEBAS ---
puts "Test 1: #{max_area([1, 8, 6, 2, 5, 4, 8, 3, 7]) == 49 ? 'PASS' : 'FAIL'}"
puts "Test 2: #{max_area([1, 1]) == 1 ? 'PASS' : 'FAIL'}"
puts "Test 3: #{max_area([4, 3, 2, 1, 4]) == 16 ? 'PASS' : 'FAIL'}"
puts "Test 4: #{max_area([1, 2, 1]) == 2 ? 'PASS' : 'FAIL'}"
