# Glosario de Estructuras de Datos y Algoritmos (DSA)

Este glosario define los términos técnicos clave comprendidos y validados a lo largo de este curso de autoestudio en Ruby.

## Complejidad Algorítmica (Big-O)

**Complejidad Temporal (Time Complexity)**:
Medida del tiempo que tarda un algoritmo en ejecutarse en función del tamaño de la entrada.
*Ejemplo*: O(1) tiempo constante, O(n) tiempo lineal.

**Complejidad Espacial (Space Complexity)**:
Medida de la memoria auxiliar utilizada por un algoritmo en función del tamaño de la entrada (excluyendo la memoria para la entrada misma).
*Ejemplo*: O(1) espacio constante, O(n) espacio lineal.

**Tail Recursion (Recursión de Cola)**:
Caso especial de recursión en el que la llamada recursiva es la última operación ejecutada por la función. Permite optimizar el call stack si el compilador/intérprete lo soporta.

## Estructuras de Datos

**Node (Nodo)**:
Unidad fundamental de almacenamiento en estructuras enlazadas, que contiene un valor y referencias o punteros a otros nodos (por ejemplo, `next` o `prev`).

**Linked List (Lista Enlazada)**:
Colección lineal de elementos (nodos) donde el orden no está dado por su posición física en memoria, sino por referencias explícitas contenidas en cada nodo.
*Tipos*: Singly Linked List (enlace simple), Doubly Linked List (enlace doble).

## Técnicas y Patrones

**Two Pointers (Dos Punteros)**:
Técnica que utiliza dos variables de índice para recorrer una estructura lineal (generalmente un array o lista) desde diferentes posiciones (ej. extremos opuestos o velocidades distintas).

**Sliding Window (Ventana Deslizante)**:
Subcategoría de los dos punteros utilizada para analizar subarreglos o subcadenas contiguas, donde los punteros delimitan el "ancho" de la ventana actual.

**Fast and Slow Pointers (Punteros Rápido y Lento)**:
También conocido como algoritmo de la liebre y la tortuga (Floyd's Cycle Detection), consiste en avanzar dos punteros por una lista enlazada a distintas velocidades (normalmente el rápido a 2x y el lento a 1x) para detectar ciclos.

**Bitwise XOR (XOR a Nivel de Bits)**:
Operación lógica bit a bit que devuelve 1 si y solo si los bits de entrada son diferentes. Es útil por sus propiedades de paridad e inversión (`x ^ x = 0` y `x ^ 0 = x`).

## Stacks

**Stack (Pila)**:
Estructura de datos abstracta de tipo LIFO (Last-In, First-Out) donde las inserciones y eliminaciones ocurren solo en un extremo llamado tope (top).
_Evitar_: Pila genérica, montón

**LIFO (Last-In, First-Out)**:
Principio de ordenamiento donde el último elemento insertado es el primero en ser removido. Es la propiedad fundamental de un stack.
_Evitar_: FIFO (es para colas), UEPS

**Push**:
Operación de insertar un elemento en el tope del stack. En Ruby: `array << valor` o `array.push(valor)`.
_Evitar_: Meter, insertar al inicio

**Pop**:
Operación de remover y devolver el elemento del tope del stack. En Ruby: `array.pop`.
_Evitar_: Sacar, extraer del inicio

**Peek (o Top)**:
Operación que devuelve el elemento del tope sin removerlo. En Ruby: `array.last` o `array[-1]`.
_Evitar_: Mirar, ver tope

**Monotonic Stack (Pila Monotónica)**:
Stack que mantiene sus elementos en orden estricto (creciente o decreciente). Es la herramienta clave para resolver problemas de "próximo elemento mayor" o "próximo elemento menor" en tiempo O(n). La clave es que los elementos "esperan" en el stack hasta que llega uno que rompe la monotonía y los "libera".
_Evitar_: Stack ordenado, pila monótona
