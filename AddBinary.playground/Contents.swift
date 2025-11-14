/* SUMA DE DOS BINARIOS EN FORMATO STRING
Dadas dos cadenas binarias a y b (solo con caracteres 0 y 1, sin ceros a la izquierda salvo el cero mismo), devuelve la suma de ambas como cadena binaria. Suma bit a bit de derecha a izquierda manejando el acarreo; si al final queda un acarreo, antepónlo. Restricciones: 1 <= a.length, b.length <= 10^4.

Given two binary strings a and b (only 0/1, no leading zeros except for zero itself), return their sum as a binary string. Add bits right to left while handling the carry; if a carry remains at the end, prepend it. Constraints: 1 <= a.length, b.length <= 10^4. */


/// Solución original
func addBinary(_ a: String, _ b: String) -> String {
    var cad1 = String(a.reversed())
    var cad2 = String(b.reversed())
    // Igualamos el número de elementos en caso de que las cadenas no sean del mismo tamaño
    if a.count > b.count {
        for _ in 1...a.count-b.count {
            cad2.append("0")
        }
    } else if a.count < b.count {
        for _ in 1...b.count-a.count {
            cad1.append("0")
        }
    }
    var res = "0" // Residuo de la suma de los dos digitos
    var sol = "" // Cadena para guardar la solución
    for index in cad1.indices {
        if cad1[index] == "0" && cad2[index] == "0" {
            if res == "0" {
                sol.append("0")
            } else {
                sol.append("1")
                res = "0"
            }
        }
        if (cad1[index] == "1" && cad2[index] == "0") || (cad1[index] == "0" && cad2[index] == "1") {
            if res == "0" {
                sol.append("1")
            } else {
                sol.append("0")
                res = "1"
            }
        }
        if cad1[index] == "1" && cad2[index] == "1" {
            if res == "0" {
                sol.append("0")
            } else {
                sol.append("1")
            }
            res = "1"
        }
    }
    if res == "1" {
        sol.append("1")
    }
    return String(sol.reversed())
}

/// Pruebas
addBinary("1111", "1")
addBinary( "1010", "1011")
addBinary( "11010101010101010101010101010101", "1000000010000000010000000100000001010001011")
