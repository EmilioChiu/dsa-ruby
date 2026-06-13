# Problema 2: Valid Parentheses
# Objetivo: Dada una cadena que contiene solo '(', ')', '{', '}', '[' y ']', 
# determinar si es válida.
# Una cadena es válida si:
# 1. Los brackets abiertos se cierran con el mismo tipo.
# 2. Se cierran en el orden correcto.

def is_valid(s)
  open_parentheses = []
  parentheses_matches = {"("=> ")", "{" => "}", "[" => "]"}

  (0...s.length).each do |index| # yo use rangos pero se puede usar .each_char (no necesito inicializar char de esta forma)
    char = s[index]

    if parentheses_matches[char] 
      open_parentheses << char
    else
      last_open_parenthesis = open_parentheses.pop
      return false if parentheses_matches[last_open_parenthesis] != char
    end
  end

  open_parentheses.empty?
end

# --- Casos de Prueba ---
def test_valid_parentheses
  puts "Prueba 1 '()': #{is_valid("()") == true ? "PASSED" : "FAILED"}"
  puts "Prueba 2 '()[]{}': #{is_valid("()[]{}") == true ? "PASSED" : "FAILED"}"
  puts "Prueba 3 '(]': #{is_valid("(]") == false ? "PASSED" : "FAILED"}"
  puts "Prueba 4 '([)]': #{is_valid("([)]") == false ? "PASSED" : "FAILED"}"
  puts "Prueba 5 '{[]}': #{is_valid("{[]}") == true ? "PASSED" : "FAILED"}"
end

test_valid_parentheses
