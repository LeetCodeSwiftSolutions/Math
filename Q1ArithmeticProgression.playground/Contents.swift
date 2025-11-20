/*
 
 */

/// Solución original
func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
    // Primero nos aseguramos de que haya más de 2 elementos en el arreglo
    guard arr.count > 2 else {
        return true
    }
    
    // Ordenamos el arreglo
    var sortedArray = arr.sorted()
    var isArithmeticProg = true
    
    // Analizamos si la diferencia entre dos elementos siempre es la misma.
    for i in 1...sortedArray.count - 2 {
        if sortedArray[i] - sortedArray[i-1] != sortedArray[i+1] - sortedArray[i] {
            isArithmeticProg = false // Si alguna falla, no es una progresión aritmética
        }
    }
    
    return isArithmeticProg
}


/// Pruebas
canMakeArithmeticProgression([1, 100])
canMakeArithmeticProgression([3, 5, 1])
canMakeArithmeticProgression([1, 2, 4])
