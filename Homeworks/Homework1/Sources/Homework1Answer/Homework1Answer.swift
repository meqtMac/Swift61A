/// Compute the falling factorial of n to depth k.
///
/// Examples:
/// ```
/// falling(n: 6, k: 3) -> 120  // 6 * 5 * 4 == 120
/// falling(n: 4, k: 3) -> 24  // 4 * 3 * 2 == 24
/// falling(n: 4, k: 1) -> 4  // 4 == 4
/// falling(n: 4, k: 0) -> 1  // 1
/// ```
///
/// - Parameters:
///   - n: The starting integer
///   - k: The depth of the factorial
/// - Returns: The falling factorial of n to depth k
func falling(n: Int, k: Int) -> Int {
    guard k > 0 else { return 1 }
    var result = 1
    for i in 0..<k {
        result *= (n - i)
    }
    return result
}

/// Sum all the digits of y.
///
/// Examples:
/// ```
/// sumDigits(y: 10) -> 1 // 1 + 0 = 1
/// sumDigits(y: 4224) -> 12 // 4 + 2 + 2 + 4 = 12
/// sumDigits(y: 1234567890) -> 45
/// let a = sumDigits(y: 123)
/// a == 6
/// ```
///
/// - Parameter y: The nonnegative integer
/// - Returns: The sum of all digits of y
func sumDigits(y: Int) -> Int {
    var sum = 0
    var number = y
    while number > 0 {
        sum += number % 10
        number /= 10
    }
    return sum
}

/// Return true if n has two eights in a row.
///
/// Examples:
/// ```
/// doubleEights(n: 8) -> false
/// doubleEights(n: 88) -> true
/// doubleEights(n: 2882) -> true
/// doubleEights(n: 880088) -> true
/// doubleEights(n: 12345) -> false
/// doubleEights(n: 80808080) -> false
/// ```
///
/// - Parameter n: The number to check
/// - Returns: True if n has two eights in a row, false otherwise
func doubleEights(n: Int) -> Bool {
    var number = n
    var prevDigit = -1
    while number > 0 {
        let digit = number % 10
        if digit == 8 && prevDigit == 8 {
            return true
        }
        prevDigit = digit
        number /= 10
    }
    return false
}
