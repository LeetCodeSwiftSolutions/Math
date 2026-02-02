/* 9. Palindrome number [easy] - Math.
Given an integer x, return true if x is a palindrome, and false otherwise.
 
Constraints:
 -2^31 <= x <= 2^31 - 1
 
Follow up:
 Could you solve it without converting the integer to a string. */

///
/// Original Solution.
/// Time Complexity: O(log n) where n = x, Space Complexity: O(1).
/// Beats 63% in Runtime & 45% in Memory.
///
func isPalindrome(_ x: Int) -> Bool {
    guard x >= 0 else { return false }
    var reversedNum = 0
    var num = x

    while num > 0 {
        if (reversedNum*10) + (num%10) < Int.max {
            reversedNum = (reversedNum*10) + (num%10)
            num /= 10
        } else {
            return false
        }
    }

    return reversedNum == x
}


///
/// Original test cases
///
isPalindrome(123454321) // Expected: true
isPalindrome(-1331) // Expected: false
isPalindrome(0) // Expected: true
