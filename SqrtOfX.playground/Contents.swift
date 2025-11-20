/* RAÍZ CUADRADA ENTERA
Dado un entero no negativo x, devuelve la raíz cuadrada entera de x, es decir, (redondeada hacia abajo). El resultado también debe ser un entero no negativo. No se pueden usar funciones u operadores integrados de potencia/raíz.

Given a non-negative integer x, return the integer square root of x, (rounded down). The result must also be a non-negative integer. You must not use any built-in exponent function or operator. */


/// Solución original
func mySqrt(_ x: Int) -> Int {
    // Vamos a iterar sobre todos los números multiplicados por sí mismos
    var pot = 1
    // Nos detenemos cuando el cuadrado de un número sea mayor a x
    while pot*pot < x {
        pot += 1
    }
    // Analizamos si el número era la raíz exacta o se pasó.
    return pot*pot > x ? pot - 1 : pot
}

/// Pruebas
mySqrt(1414213562)
