/* NÚMERO DE TRIBONACCI.¡
Calcula el n-ésimo número de Tribonacci definido como T₀=0, T₁=1, T₂=1, y Tₙ₊₃=Tₙ+Tₙ₊₁+Tₙ₊₂ para n≥0. El valor de n está entre 0 y 37, y la respuesta está garantizada para caber en un entero de 32 bits.

Calculate the nth Tribonacci number defined as T₀=0, T₁=1, T₂=1, and Tₙ₊₃=Tₙ+Tₙ₊₁+Tₙ₊₂ for n≥0. The value of n ranges from 0 to 37, and the answer is guaranteed to fit within a 32-bit integer. */

/// Solución original
func tribonacci(_ n: Int) -> Int {
    // Validamos los casos iniciales
    guard n > 1 else { return n }
    if n == 2 { return 1 }
    // Creamos variables para los 3 valores previos y uno auxiliar
    var triboA = 1
    var triboB = 1
    var triboC = 0
    var aux = 0
    // Calculamos el nuevo valor y recorremos los valores
    for i in 3...n {
        aux = triboA
        triboA += triboB + triboC
        triboC = triboB
        triboB = aux
    }
    return triboA
}

/// Pruebas
tribonacci(25)
