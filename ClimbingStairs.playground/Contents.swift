/* SUBIENDO UNA ESCALERA.
Se te da un número n, que representa la cantidad de escalones hasta la cima. En cada movimiento puedes subir 1 o 2 escalones. Debes determinar cuántas formas distintas existen de llegar a la cima combinando estos pasos. Restricciones: 1≤n≤45.

You are given an integer n representing the number of steps to the top. Each move allows you to climb 1 or 2 steps. You must determine how many distinct ways there are to reach the top using these step combinations. Constraints: 1≤n≤45. */


/// Solución original (correcta con recursividad, pero no es funcional por la complejidad del tiempo)
func climbStairs(_ n: Int) -> Int {
    // Analizando los valores para n=4, n=5, n=6, obtuvimos:
    // n = 1  ->  sol: 1
    // n = 2  ->  sol: 2
    // n = 3  ->  sol: 3
    // n = 4  ->  sol: 5
    // n = 5  ->  sol: 8
    // n = 6  ->  sol: 13
    // Notamos que la secuencia sigue los valores de Fibonacci...
    var sol = 1
    if n <= 2 { return n }
    return climbStairs(n-1) + climbStairs(n-2)
}


/// Solución optimizada
func F(_ n: Int) -> Int {
    if n == 0 || n == 1 { return 1 }
    var step1 = 1
    var step2 = 1
    var step3 = 0
    
    for _ in 2...n {
        step3 = step1 + step2
        step1 = step2
        step2 = step3
        print(step3)
    }
    
    return step2
}

/// Pruebas
F(45)


