/* Enunciado en español: Dado un entero `num`, cuenta cuántos pasos se necesitan para reducirlo a cero aplicando estas reglas: si es par, divídelo entre 2; si es impar, réstale 1. Devuelve el número total de pasos. Ejemplo: `num = 14 → 6` pasos. Restricción: `0 ≤ num ≤ 10^6`.
 
 Statement in English: Given an integer `num`, count how many steps are needed to reduce it to zero using these rules: if it is even, divide it by 2; if it is odd, subtract 1. Return the total number of steps. Example: `num = 14 → 6` steps. Constraint: `0 ≤ num ≤ 10^6`. */

/// Solución inicial (original)
func numberOfSteps(_ num: Int) -> Int {
    var num = num
    var count = 0
    
    while num != 0 {
        num % 2 == 0 ? (num /= 2) : (num -= 1)
        count += 1
    }
    
    return count
}


