/*
 
 */

/// Original solution. Time complexity: O(n^2), Space complexity: O(1). Beats 100% & 58%
func rotate(_ matrix: inout [[Int]]) {
    // Dimension of the square matrix
    let n = matrix.count
    // Compute the transpose in-place by iterating only over the upper half of the square matrix
    for i in 0 ..< n {
        for j in i+1 ..< n {
            // We use tuples to swap without a temporary variable
            (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
        }
    }
    // Reverse each row
    for i in 0 ..< n {
        matrix[i] = matrix[i].reversed()
    }
}

/// Test case
var matrix: [[Int]] = [[1,2,3],[4,5,6],[7,8,9]]
rotate(&matrix) // Expected: [[7, 4, 1], [8, 5, 2], [9, 6, 3]]
