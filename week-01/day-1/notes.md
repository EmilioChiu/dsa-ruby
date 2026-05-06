# Día 1: Big-O Notation

## Fecha: 5 de mayo de 2026
## Tiempo de sesión: 9:00 - 12:00

### Conceptos aprendidos
**Big O Notation:** sirve para poder entender mejor un algoritmo: calcular cuanto tiempo se tardaria en hacer una operacion y que tan escalable es dependiendo de su complejidad

#### O(1): siempre es el mismo tiempo, no importa si tiene que revisar una lista de 1 o de 10000 elementos

```ruby
def is_first_element_red?(array)
  array[0] == "red"
end
```

#### O(log n): algoritmo que permite reducir las iteraciones usando diferentes metodos (en pocas palabras si cada iteracion disminuyen los elementos de entrada se dice que es Logarítmico)

```ruby
def binary_search(array, value, from=0, to=nil)
    to = array.count - 1 unless to
    mid = (from + to) / 2

    if value < array[mid]
        return binary_search(array, value, from, mid - 1)
    elsif value > array[mid]
        return binary_search(array, value, mid + 1, to)
    else
        return mid
    end
end

binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], 15)
```

> [!NOTE]
> este algoritmo aunque dificil de entender es bastante interesante, ya que reduce de manera considerable la complejidad del algoritmo 
> [!NOTE]
> como otra nota explicare que es un Logaritmo: de manera sencilla y facil, se puede entender por el numero de veces que se puede dividir entre 2. ej: el log de 64 es 6 ya que hace falta dividir 64 6 veces hasta que nos de 1, en estos algoritmos se podria decir que si en un array de 64 elementos usando: O(n) pasarian 64 procesos, sin embargo si usaramos O(log n) en lugar de 64 serian 6 (por lo anteriormente mencionado)


#### **O(N):** este algoritmo suele subir dependiendo del array analizado de manera constante (ej: si una funcion tarda 1 sec en analizar un array de 10 se tardara 10 sec en analizar uno de 100) 

```ruby
def print_word_n_times(word, n)
  n.times do
    puts word
  end
end
```

```ruby
def word_exist?(word, array)
  array.each do |element|
    return true if element == word
  end
  false
end
```
> [!NOTE] big o notation siempre calcula el peor escenario posible por lo que en el segundo ejemplo aunque en el mejor de los casos se detenga en el primer elemento en el peor estara al final por lo que depende del tamaño de la lista

#### **O(n²):** este algoritmo sube de manera cuadratica dependiendo del array analizado (  las iteraciones irian incrementando de la siguiente forma: [1, 4, 9, 16, 25, 36, 49, 64, 81, 100...] osea el numero de elementos multiplicado por si mismo)

```ruby
def duplicates?(array1)
  array1.each_with_index do |item1, index1|
    array1.each_with_index do |item2, index2|
      next if index1 == index2 
      return true if item1 == item2
    end
  end
  false
end
```



#### **O(2ⁿ):** este algoritmo sube de manera Exponencial dependiendo del array analizado(tardara el doble de lo que tardo cada que se le añada un elemento extra, suponiendo que el tiempo inicial con un elemento es de 1 sec, los tiempos irian incrementando de la siguiente forma: [1, 2, 4, 8, 16, 32, 64, 128, 246, 492...]

```ruby
#codigo de fibonacci

def fibonacci(n)
  return [0] if n == 0
  return [0, 1] if n == 1
  
  new_arr = [0, 1]
  (n - 2).times do
    new_arr << (new_arr[-1] + new_arr[-2])
  end
  return new_arr
end

OR (using re-cursion)

def fibonacci(n)
  return [0] if n == 0
  return [0, 1] if n == 1
  
  sequence = fibonacci(n - 1)
  sequence << sequence[-1] + (sequence[-2] || 0)
  sequence
end
```

#### **O(N Log N):** este algoritmo es una combinacion de O(log n) + O(N) lo que nos da O(N Log N), este algoritmo esta mayormente presente en los algoritmos de ordenamiento (ej [0, 5, 3] -> [0, 3, 5])

```ruby
def merge_sort(array)
  return array if array.length <= 1

  # DIVIDE: Encontrar el punto medio (Log n)
  mid = array.length / 2
  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid..-1])

  # COMBINA: Mezclar las partes recorriendo los elementos (n)
  merge(left, right)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    result << (left.first <= right.first ? left.shift : right.shift)
  end
  result + left + right
end
```
> [!NOTE]
> en este ejemplo se puede ver como se usa primero un binary tree y luego por cada division revisa cada uno, por lo que podemos decir que este algoritmo estaria entre O(N) y O(N²)


#### **O(n!):** este algoritmo es el peor de todos, revisa TODAS las convinaciones posibles, se llama algoritmo factorial y lo maximo que se puede analizar es un array de 12-15 elementos por tan pesado que es (ej: un array de 3 = 6 (3x2x1) pero un array de 5 = 120 (5*4*3*2*1) y el de 10 llega a 3,628,800 (10*9*8*7*6*5*4*3*2*1)
se puede encontrar en un algoritmo para verificar todas las convinaciones posibles
```ruby
# Generar todas las formas posibles de ordenar un arreglo
def permutaciones(array)
  return [array] if array.length <= 1

  res = []
  array.each_with_index do |elemento, i|
    resto = array[0...i] + array[i+1..-1]
    # Se llama a sí mismo N veces, y cada vez procesa N-1...
    permutaciones(resto).each do |p|
      res << [elemento] + p
    end
  end
  res
end

ciudades = ["CDMX", "Toluca", "Puebla", "Cuernavaca"]
puts permutaciones(ciudades).count # 24 rutas posibles (4!)
```

### Space Complexity (Complejidad Espacial)
Es la cantidad de memoria extra que el algoritmo necesita, sin contar el input original.

| Complejidad | Tipo | Ejemplo |
|-------------|------|---------|
| O(1) | Constante | `sum_array` (solo usa una variable `total`) |
| O(n) | Lineal | `double_elements` (crea un nuevo array del mismo tamaño) |
| O(log n) | Logarítmica | Búsqueda binaria recursiva (espacio en el call stack) |
| O(n²) | Cuadrática | `create_multiplication_table` (matriz de n x n) |

#### Ejemplos de Space Complexity:
1. **In-place manipulation:** `reverse_in_place!` es O(1) porque modifica el array original sin crear copias.
2. **Recursión:** `factorial(n)` es O(n) en espacio porque cada llamada se guarda en el call stack hasta llegar al caso base.
3. **Hash Maps:** `char_frequency` es O(n) porque el hash puede crecer tanto como el string de entrada.

### Complejidades comunes
| Complejidad | Nombre | Ejemplo |
|-------------|--------|---------|
| O(1) | Constante | `is_first_element_red?` |
| O(log n) | Logarítmica | `binary_search` |
| O(n) | Lineal | `word_exist?`, `print_word_n_times` |
| O(n log n) | Linearítmica | `merge_sort` |
| O(n²) | Cuadrática | `duplicates?`, `bubble_sort` |
| O(n³) | Cúbica | `find_triplet_sum` |
| O(2ⁿ) | Exponencial | `fibonacci` recursivo |
| O(n!) | Factorial | `permutaciones` |

### Ejemplos analizados
1. `is_first_element_red?` → O(1) - Constante
2. `binary_search` → O(log n) - Logarítmica
3. `print_word_n_times` → O(n) - Lineal
4. `word_exist?` → O(n) - Lineal (peor caso)
5. `duplicates?` → O(n²) - Cuadrática
6. `fibonacci` (iterativo) → O(n) - Lineal | (recursivo) → O(2ⁿ) - Exponencial
7. `merge_sort` → O(n log n) - Linealítmica
8. `permutaciones` → O(n!) - Factorial
9. `bubble_sort` → O(n²) - Cuadrática (2 bucles anidados)
10. `has_pair_with_sum?` → O(n) - Lineal (hash O(1))
11. `find_triplet_sum` → O(n³) - Cúbica (3 bucles anidados)
12. `reverse_string` → O(n) - Lineal (while recorre n/2 letras) 

### Ejercicios de Práctica Analizados

#### 1. Suma de dos arreglos (`sum_two_arrays`)
- **Time:** O(N + M) - Lineal (recorre ambos arreglos una vez).
- **Space:** O(1) - Constante (solo usa una variable `total`).

#### 2. Tabla de multiplicar (`create_multiplication_table`)
- **Time:** O(N²) - Cuadrática (bucles anidados).
- **Space:** O(N²) - Cuadrática (almacena una matriz de N x N).

#### 3. Factorial Recursivo (`factorial`)
- **Time:** O(N) - Lineal (se llama N veces).
- **Space:** O(N) - Lineal (cada llamada ocupa espacio en el call stack).

#### 4. Frecuencia de caracteres (`char_frequency`)
- **Time:** O(N) - Lineal.
- **Space:** O(N) - Lineal (en el peor caso de caracteres únicos).

#### 5. Reversa In-Place (`reverse_in_place!`)
- **Time:** O(N) - Lineal.
- **Space:** O(1) - Constante (modifica el array original usando punteros).

#### 6. División anidada (`nested_division`)
- **Time:** O(N log N) - El bucle exterior es logarítmico (i *= 2) y el interior lineal.
- **Space:** O(1) - Constante.

#### 7. Búsqueda Binaria Recursiva (`recursive_search`)
- **Time:** O(log N) - Logarítmica (divide el problema a la mitad en cada paso).
- **Space:** O(log N) - Logarítmica (espacio en stack por cada división).

#### 8. Tripletes únicos (`unique_triplets`)
- **Time:** O(N³) - Cúbica (3 bucles anidados dominan sobre el O(N log N) del sort).
- **Space:** O(N³) - Cúbica (almacena todas las combinaciones posibles).

#### 9. Mapa de palabras (`build_word_map`)
- **Time:** O(N²) - Cuadrática (asumiendo N oraciones con N palabras cada una).
- **Space:** O(N²) - Cuadrática (almacena las relaciones en un Hash de listas).

### Notas de Estudio Permanentes
> [!IMPORTANT]
> **REPASO DIARIO:** Al iniciar cada sesión durante la primera semana, el tutor presentará 5 ejercicios de Big-O (Time & Space) para análisis rápido y refuerzo.

### Dudas pendientes
- ~~no encontre de O(n!)~~ ✅ (ya agregado con `permutaciones`)
- ~~**SPACE COMPLEXITY PENDIENTE**~~ ✅ (Completado y analizado con ejercicios prácticos)


### Pattern del día
Big O siempre considera el peor caso. Los bucles anidados elevan la complejidad temporal. La complejidad espacial se mide por la memoria extra total acumulada (estructuras nuevas + call stack recursivo). El término dominante es el que define la complejidad final (ej: O(n³ + n log n) => O(n³)).
