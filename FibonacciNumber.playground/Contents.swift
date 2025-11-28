/* FIBONACCI NUMBER
Calcula el n-ésimo número de Fibonacci donde F(0) = 0, F(1) = 1, y para n > 1, F(n) = F(n-1) + F(n-2). El valor de n está en el rango de 0 a 30.

Calculate the nth Fibonacci number where F(0) = 0, F(1) = 1, and for n > 1, F(n) = F(n-1) + F(n-2). The value of n ranges from 0 to 30. */

/// Solución original
func fib(_ n: Int) -> Int {
    // Validamos los casos iniciales
    guard n > 1 else { return n }
    // Variables para la solución usando programación dinámica
    var previousFibonacci = 0
    var currentFibonacci = 1
    var auxFibonacci = 0
    // Iteramos desde i=2 hasta el valor n que ingresó el usuario
    for i in 2...n {
        auxFibonacci = currentFibonacci
        currentFibonacci += previousFibonacci
        previousFibonacci = auxFibonacci
    }
    return currentFibonacci
}

/// Pruebas
for i in 0...30 { print("\(fib(i)),  ", terminator: "") }
