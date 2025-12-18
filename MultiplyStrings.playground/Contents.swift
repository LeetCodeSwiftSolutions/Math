/* MULTIPLICACIÓN DE CADENAS
Multiplica dos números enteros no negativos representados como cadenas num1 y num2, y devuelve el producto también como una cadena, sin usar librerías de big integers ni convertir directamente a enteros. Las longitudes están entre 1 y 200, solo contienen dígitos y no tienen ceros a la izquierda excepto el número "0" mismo.

Multiply two non-negative integers represented as strings num1 and num2, returning the product as a string, without using built-in big integer libraries or direct integer conversion. Lengths range from 1 to 200, they consist only of digits, and have no leading zeros except for the number "0" itself. */

/// Solución convertida desde Python (LeetCode) a Swift.
/// Función para multiplicar dos números enteros siguiendo el algoritmo de multiplicación normal
func multiply(_ num1: String, _ num2: String) -> String {
    // Nos aseguramos de que no haya multiplicaciones por cero
    guard num1 != "0" && num2 != "0" else { return "0" }
    // Invertimos los números para facilitar el algoritmo
    let firstNumber = String(num1.reversed())
    let secondNumber = String(num2.reversed())
    // Creamos una matriz de tipo Int para almacenar los resultados de la multiplicación.
    var results: [[Int]] = []
    // Multiplicamos cada dígito del segundo número, por todo el primer número
    for (index, digitChar) in secondNumber.enumerated() {
        let digit = String(digitChar)
        let oneDigitMultiplication = multiplyOneDigit(digit, numZeros: index, firstNumber: firstNumber)
        // Almacenamos el resultado (invertido) en la matriz de resultados de tipo Int
        results.append(oneDigitMultiplication)
    }
    // Sumamos todos los resultados de la matriz de resultados, con un parámetro modificable inout
    let answer = sumResults(&results)
    // Ahora invertimos el orden del array, answer está en orden inverso: [unidades, decenas, centenas...]
    let correctOrderAnswer = answer.reversed()
    // Convertimos cada dígito Int a String
    let stringDigits = correctOrderAnswer.map { String($0) }
    // Unimos todos los dígitos en una sola cadena
    let finalResult = stringDigits.joined()
    return finalResult
}

/// Función para multiplicar un solo dígito del segundo número, por todos los dígitos del primer número
func multiplyOneDigit(_ digit2: String, numZeros: Int, firstNumber: String) -> [Int] {
    // Agregamos ceros al inicio del arreglo de acuerdo al index de enumerated()
    var currentResult = Array(repeating: 0, count: numZeros)
    var carry = 0
    // Multiplicamos cada dígito de "firstNumber" con el dígito actual de "secondNumber"
    for digitChar in firstNumber {
        // Aquí hacemos las conversiones por fin, a enteros.
        let digit1 = Int(String(digitChar))!
        let digit2Int = Int(digit2)!
        let multiplication = digit1 * digit2Int + carry
        // Calculamos el "carry" con el resultado directo de dividir entre 10 la multiplicación obtenida.
        carry = multiplication / 10
        // Agregamos el último dígito de la multiplicación al resultado de esta iteración
        currentResult.append(multiplication % 10)
    }
    // Si carry quedó distinto de cero, lo agregamos al final del arreglo del resultado actual
    if carry != 0 { currentResult.append(carry) }
    return currentResult
}

/// Función para sumar los resultados de cada multiplicación, que fueron almacenados en una matriz de enteros.
func sumResults(_ results: inout [[Int]]) -> [Int] {
    // Guardamos el último resultado de "results" en el arreglo que vamos a retornar como respuesta
    var answer = results.removeLast()
    // Sumamos cada uno de los resultados restantes
    for result in results {
        var newAnswer: [Int] = []
        var carry = 0
        // Determinamos la longitud máxima que hay entre los dos arreglos a sumar, para considerar todos los casos
        let maxLength = max(result.count, answer.count)
        // Hacemos el algoritmo de suma, dígito por dígito
        for i in 0..<maxLength {
            // "digit1" contiene los dígitos del arreglo "results", si este se acaba, agregamos un cero
            let digit1 = i < result.count ? result[i] : 0
            // De manera equivalente, "digit2" contiene los dígitos de "answer"
            let digit2 = i < answer.count ? answer[i] : 0
            // Sumamos los dígitos obtenidos, junto con el acarreo
            let currentSum = digit1 + digit2 + carry
            // Calculamos el "carry" con el resultado directo de dividir entre 10 la suma obtenida.
            carry = currentSum / 10
            // Agregamos el dígito de las "unidades" a la respuesta.
            newAnswer.append(currentSum % 10)
        }
        // Si "carry" quedó distinto de cero, lo agregamos al final del arreglo del resultado actual
        if carry != 0 { newAnswer.append(carry) }
        // Actualizamos la suma acumulativa con el resultado anterior "answer + result"
        answer = newAnswer
    }
    return answer
}


/// Pruebas
multiply("123", "456")      // Expected: "56088"
multiply("392", "291")      // Expected: "114072"
multiply("13652","35881")   // Expected: "489847412"
