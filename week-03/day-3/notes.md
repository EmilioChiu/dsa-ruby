# Sliding Window Variable

## El Patrón Universal

```ruby
left = 0
result = 0

(0...arr.length).each do |right|
  # 1. Expandir: Agregar arr[right] a la estructura de datos (Hash/Set/Sum)
  
  while # CONDICIÓN DE VIOLACIÓN (ej: hay un duplicado, la suma es muy grande)
    # 2. Contraer: Remover arr[left] de la estructura
    left += 1
  end
  
  # 3. Actualizar resultado (ej: max_length = [max_length, right - left + 1].max)
end
```

## Tips para Ruby
- Usa un `Hash` para guardar la última posición vista de un caracter o su frecuencia.
- Recuerda que el tamaño de la ventana es `right - left + 1`.
