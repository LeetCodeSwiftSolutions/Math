/* VERIFICAR SI LOS ELEMENTOS DE UN ARREGLO PUEDEN FORMAR UNA PROGRESIÓN ARITMÉTICA.
 Determina si un arreglo de números puede reordenarse de manera que forme una progresión aritmética, es decir, una secuencia donde la diferencia entre cada par de elementos consecutivos sea siempre la misma. Si existe algún reordenamiento posible que cumpla esta condición, se debe devolver true; en caso contrario, false.

 Determine whether an array of numbers can be rearranged to form an arithmetic progression, meaning a sequence in which the difference between every pair of consecutive elements is always the same. If there exists any reordering that meets this condition, return true; otherwise, return false. */


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
