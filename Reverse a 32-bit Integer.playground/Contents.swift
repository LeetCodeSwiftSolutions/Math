/* REVERTIR UN ENTERO DE 32 BITS.
 Dado un entero con signo de 32 bits x, devuelve x con sus dígitos invertidos, conservando el signo. Si al invertirlo el valor sale del rango con signo de 32 bits, devuelve 0. Asume que no se pueden usar enteros de 64 bits.
 Ejemplos: 123→321, −123→−321, 120→21.

 Given a signed 32-bit integer x, return x with its digits reversed, preserving the sign. If reversing pushes the value outside the 32-bit signed range return 0. Assume that 64-bit integers are not allowed.
 Examples: 123→321, −123→−321, 120→21. */


/// Solución original
func reverse(_ x: Int) -> Int {
    // Analizamos signo, obtenemos el valor absoluto y creamos arreglo vacío
    let isSigned = x < 0
    var number = abs(x)
    var digits = [Int]()
    
    // Añadimos el primer dígito al arreglo (unidades)
    digits.append(number%10)
    
    // Agregamos los dígitos restantes dividiendo entre 10
    while number >= 10 {
        number /= 10
        digits.append(number%10)
    }
    
    // Convertimos el arreglo a una cadena y después a un Int
    var reversedNumber = Int(digits.map{"\($0)"}.joined(separator: "")) ?? 0
    // Le agregamos el signo, si es que tenía
    reversedNumber = isSigned ? -1*reversedNumber : reversedNumber
    
    // Analizamos si está dentro de los límites
    guard reversedNumber <= Int32.max && reversedNumber >= Int32.min else {
        return 0
    }
    
    return reversedNumber
}

/// Pruebas
print(reverse(5475917341))
print(reverse(-131458239))
print(reverse(2147483647))
print(reverse(-2147483648))

