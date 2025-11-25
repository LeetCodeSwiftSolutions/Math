/* DIVIDIR DOS ENTEROS DE 32 BITS
 Dado un dividendo y un divisor, debes calcular su cociente sin usar multiplicación, división ni módulo. La división debe truncarse hacia cero, eliminando cualquier parte decimal, incluso con números negativos. El resultado siempre debe mantenerse dentro del rango de enteros con signo de 32 bits: si se pasa por arriba o por abajo, se debe ajustar al máximo o mínimo permitido. Tu objetivo es obtener el cociente correcto únicamente mediante operaciones básicas que sumen o resten valores, asegurando que divisor nunca sea cero.

 Given a dividend and a divisor, you must compute their quotient without using multiplication, division, or the modulo operator. The division must truncate toward zero, removing any fractional part, even for negative values. The result must always fit within the signed 32-bit integer range, clamping it to the allowed limits if necessary. Your task is to derive the correct quotient using only basic operations that add or subtract values, ensuring the divisor is never zero. */

/// Solución original
func divide(_ dividend: Int, _ divisor: Int) -> Int {
    // Calculamos el signo del cociente resultante
    let sign = dividend*divisor >= 0 ? true : false
    // Creamos una variable con el valor del divisor, y una constante con el divisor (ambos sin signo)
    var a = abs(dividend)
    let b = abs(divisor)
    // El resultado lo almacenamos en un contador
    var quotient = 0

    // Repetimos la resta hasta que la variable a llegue a cero o sea negativa
    while a >= 0 {
        if a > 100_000_000*b {
            a -= 100_000_000*b
            quotient += 100_000_000
        }
        if a > 100_000*b {
            a -= 100_000*b
            quotient += 100_000
        }
        if a > 100*b {
            a -= 100*b
            quotient += 100
        } else {
            a -= b
            quotient += 1
        }
    }
    // Si la variable es negativa, entonces se pasó un número el cociente.
    if a < 0 { quotient -= 1 }

    // Aplicamos el signo que calculamos al inicio
    quotient = sign ? quotient : -1 * quotient
    
    // Verificamos si se superó el límite de los enteros de 32 bits
    guard quotient < Int32.max else { return Int(Int32.max) }
    guard quotient > Int32.min else { return Int(Int32.min) }
    
    // Regregamos el resultado con signo
    return quotient
}


/// Pruebas
divide(90, 3)
divide(-100, 5)
divide(87, 15)
divide(-510, 18)
divide(100*Int(Int32.max), 2)
divide(100*Int(Int32.max), -3)
