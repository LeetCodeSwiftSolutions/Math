/* EL JUEGO DEL DIVISOR.
Dos jugadores se turnan restando de un número n un divisor positivo menor que n, reemplazando n por n - x. El jugador que no pueda hacer un movimiento pierde. Determina si Alice (que empieza) gana con juego óptimo, para n entre 1 y 1000.

Two players take turns subtracting from a number n a positive divisor less than n, replacing n with n - x. The player who cannot make a move loses. Determine if Alice (who starts) wins with optimal play, for n between 1 and 1000. */

/// Solución original 100 -> O(n^2) Runtime & O(1) memory.
func divisorGame(_ n: Int) -> Bool {
    var num = n
    var isAliceTurn = true

    while num > 1 {
        if num % 2 == 0 {
            // I will win
            num -= 1
        } else {
            // There's no point on delay the inevitable...
            num -= greatestDivisor(num)
        }
        isAliceTurn.toggle()
    }

    return !isAliceTurn
}

func greatestDivisor(_ n: Int) -> Int {
    for i in stride(from: n-1, to: 1, by: -1) {
        if n%i == 0 { return i }
    }
    return 1
}

/// Pruebas
divisorGame(101) // Expected: false
divisorGame(330) // Expected: true
