/* CONTEO DE TRIPLETAS CUADRADAS EN UN RANGO DEFINIDO
Dado un entero n, cuenta cuántas tripletas cuadradas (a,b,c) existen donde a, b y c son enteros entre 1 y n que cumplen a² + b² = c². El valor de n está entre 1 y 250.

Given an integer n, count how many square triples (a,b,c) exist where a, b, and c are integers between 1 and n satisfying a² + b² = c². The value of n ranges from 1 to 250. */

import Foundation

/// Solución original
func countTriples(_ n: Int) -> Int {
    // El valor mínimo de c para que haya tercias es de 5
    guard n > 4 else { return 0 }
    // Variable para contar las tercias
    var count = 0
    // Iteramos sobre todos los valores posibles de a y b
    for a in 1...n-1 {
        for b in 1...n-1 {
            // Calculamos el valor de c (en Double)
            let c = (pow(Double(a), 2) + pow(Double(b), 2)).squareRoot()
            if c > Double(n) { break }
            // Si el valor es entero, entonces encontramos una tercia
            if c.truncatingRemainder(dividingBy: 1) == 0 { count += 1 }
        }
    }
    return count
}


/// Pruebas
print(countTriples(51))
print(countTriples(1))
print(countTriples(250))
