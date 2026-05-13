# PROBLEMA: Contains Duplicate
#
# DESCRIPCIÓN:
# Dado un arreglo de números, debemos determinar si hay algún número repetido.
# - Si un número aparece 2 o más veces, devolvemos TRUE.
# - Si todos los números son diferentes entre sí, devolvemos FALSE.
#
# EXPECTATIVAS:
# - Input: Array de enteros (ej: [1, 2, 3, 1])
# - Output: Booleano (true/false)
#
# RESTRICCIONES TÉCNICAS:
# - Tiempo deseado: O(n) -> Queremos que sea rápido, recorriendo el array una sola vez.
# - Espacio deseado: O(n) -> Está bien usar una estructura extra (como un Hash o Set) para recordar los números.
#


def contains_duplicate?(nums)
  seen = {}
  nums.each do |item|
    return true if seen[item]
    seen[item] = true
  end
  false
end

# --- PRUEBAS ---
puts "Test 1 (Duplicado al final): #{contains_duplicate?([1, 2, 3, 1]) == true ? 'PASSED' : 'FAILED'}"
puts "Test 2 (Sin duplicados): #{contains_duplicate?([1, 2, 3, 4]) == false ? 'PASSED' : 'FAILED'}"
puts "Test 3 (Múltiples duplicados): #{contains_duplicate?([1, 1, 1, 3, 3, 4, 3, 2, 4, 2]) == true ? 'PASSED' : 'FAILED'}"
