/* CONTEO DE NÚMEROS IMPARES EN UN INTERVALO
Dados dos enteros no negativos low y high, cuenta la cantidad de números impares entre ellos, de manera inclusiva. Los valores van de 0 a 10⁹ con low <= high.

Given two non-negative integers low and high, return the count of odd numbers between them, inclusive. Values range from 0 to 10⁹ with low <= high. */

/// Solución original
func countOdds(_ low: Int, _ high: Int) -> Int {
    let totalOddNumbers = (high%2 != 0) ? high/2 + 1 : high/2
    let passedOddNumbers = low/2
    return totalOddNumbers - passedOddNumbers
}

/// Pruebas
print(countOdds(1, 100))
print(countOdds(27, 84))
print(countOdds(55, 114))

