/* SUMAR DIGITOS DE UN NÚMERO ENTERO
Dado un entero no negativo num, suma repetidamente todos sus dígitos hasta que el resultado tenga un solo dígito, y retorna ese valor. El número inicial puede ser desde 0 hasta 2³¹ - 1.

Given a non-negative integer num, repeatedly add all its digits until the result has only one digit, then return that value. The initial number can range from 0 to 2³¹ - 1. */

/// Solución original
func addDigits(_ num: Int) -> Int {
    // Validamos casos iniciales
    guard num > 9 else { return num }
    // Convertimos a cadena para poder iterar dígito por dígito
    var stringNum = String(num)
    // Mientras la cadena tenga más de dos dígitos...
    while stringNum.count > 1 {
        var aux = 0
        for index in stringNum.indices {
            aux += Int(String(stringNum[index]))!
        }
        stringNum = String(aux)
    }
    return Int(stringNum)!
}

/// Pruebas
addDigits(38)
addDigits(123456789)
addDigits(Int(Int32.max))



/// A este resultado se le conoce como "raíz digital" y hay una manera directa de calcularlo sin ciclos, que es:
/// digitalRoot(n) = 1 + (n-1)%9
