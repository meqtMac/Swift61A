// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Returns a Curried version of a two-argument function FUNC.
/// 
/// Examples:
/// ```
/// let curriedAdd = lambdaCurry2(add)
/// let addThree = curriedAdd(3)
/// addThree(5) // -> 8
///
/// let curriedMul = lambdaCurry2(mul)
/// let mul5 = curriedMul(5)
/// mul5(42) // -> 210
///
/// lambdaCurry2(mod)(123)(10) // -> 3
/// ```
///
/// - Parameter func: A function that takes two arguments
/// - Returns: A curried version of the input function
func lambdaCurry2(_ function: @escaping (Int, Int) -> Int) -> (Int) -> ( (Int) -> Int ) {
    // TODO: Your Code HERE
    return { _ in { _ in 0 } }
}

// MARK: Example functions for testing
func add(x: Int, y: Int) -> Int {
    return x + y
}

func mul(x: Int, y: Int) -> Int {
    return x * y
}

func mod(x: Int, y: Int) -> Int {
    return x % y
}

// Returns a function with one parameter N that counts all the numbers from
/// 1 to N that satisfy the two-argument predicate function `condition`, where
/// the first argument for `condition` is N and the second argument is the
/// number from 1 to N.
///
/// - Parameter condition: A two-argument predicate function.
/// - Returns: A function that takes an integer N and returns the count of numbers from 1 to N that satisfy `condition`.
///
/// Examples:
/// ```
/// let countFactors = count { n, i in n % i == 0 }
/// print(countFactors(2))   // 2
/// print(countFactors(4))   // 3
/// print(countFactors(12))  // 6
///
/// let isPrime: (Int, Int) -> Bool = { _, i in countFactors(i) == 2 }
/// let countPrimes = count(condition: isPrime)
/// print(countPrimes(2))    // 1
/// print(countPrimes(3))    // 2
/// print(countPrimes(4))    // 2
/// print(countPrimes(5))    // 3
/// print(countPrimes(20))   // 8
/// ```
func count(condition: @escaping (Int, Int) -> Bool) -> (Int) -> Int {
    // TODO: Your CODE HERE
    return { _ in 0 }
}