/* NÚMERO DE OPERACIONES MÍNIMAS PARA HACER TODOS LOS ELEMENTOS DIVISIBLES ENTRE 3
 Dado un arreglo de enteros, en cada operación se puede sumar o restar 1 a cualquier elemento. Se debe determinar el número mínimo de operaciones necesarias para que todos los elementos queden divisibles entre tres.

 Given an integer array, each operation allows adding or subtracting 1 from any element. The task is to return the minimum number of operations required to make all elements divisible by three. */

/// Solución original
func minimumOperations(_ nums: [Int]) -> Int {
    var count = 0
    for num in nums {
        switch num % 3 {
            case 1, 2: count += 1
            default: continue
        }
    }
    return count
}


/// Pruebas
print(minimumOperations([1, 2, 3]))
print(minimumOperations([2, 4, 6, 9, 12, 15]))
print(minimumOperations([1, 3, 5, 17, 35, 91]))

