# Lab 1: Variables & Functions, Control

## Q1: Falling Factorial
Let's write a function `falling`, which is a "falling" factorial that takes two arguments, n and k, and returns the product of k consecutive numbers, starting from n and working downwards.
```swift
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
    // TODO: Your CODE HERE
}
```

## Q2: Sum Digits
Write a function that takes in a nonnegative integer and sums its digits.
```swift
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
    // TODO: Your CODE HERE
}
```

## Q3: Double Eights
Write a function that takes in a number and determines if the digits contain two adjacent 8s.
```swift
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
    // TODO: Your CODE HERE
}
```

## Answer
You can look for AnswerCode  under `Homework01Answer` target