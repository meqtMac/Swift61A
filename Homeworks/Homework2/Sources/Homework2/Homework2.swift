// The Swift Programming Language
// https://docs.swift.org/swift-book


// MARK: Q1: Lambdas and Currying
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

func add(x: Int, y: Int) -> Int {
    return x + y
}

func mul(x: Int, y: Int) -> Int {
    return x * y
}

func mod(x: Int, y: Int) -> Int {
    return x % y
}


// MARK: Q2: Count van Count 
/// Returns a function with one parameter N that counts all the numbers from
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

// MARK: Q3: Composite Identity Function
/// Returns the composition function which given x, computes f(g(x)).
///
/// - Parameters:
///   - f: A function that takes a single argument.
///   - g: A function that takes a single argument.
/// - Returns: A function that computes f(g(x)) when given x.
///
/// Examples:
/// ```
/// let addOne: (Int) -> Int = { $0 + 1 }
/// let square: (Int) -> Int = { $0 * $0 }
/// let a1 = compose1(square, addOne)
/// print(a1(4))  // 25
///
/// let mulThree: (Int) -> Int = { $0 * 3 }
/// let a2 = compose1(mulThree, a1)
/// print(a2(4))  // 75
/// print(a2(5))  // 108
/// ```
func compose1(_ f: @escaping (Int) -> Int, _ g: @escaping (Int) -> Int) -> ((Int) -> Int) {
    return { x in f(g(x)) }
}

/// Returns a function with one parameter x that returns true if f(g(x)) is
/// equal to g(f(x)). You can assume the result of g(x) is a valid input for f
/// and vice versa.
///
/// - Parameters:
///   - f: A function that takes a single argument.
///   - g: A function that takes a single argument.
/// - Returns: A function that takes a single parameter x and returns true if f(g(x)) equals g(f(x)).
///
/// Examples:
/// ```
/// let addOne: (Int) -> Int = { $0 + 1 }
/// let square: (Int) -> Int = { $0 * $0 }
/// let b1 = compositeIdentity(square, addOne)
/// print(b1(0))  // true
/// print(b1(4))  // false
/// ```
func compositeIdentity(_ f: @escaping (Int) -> Int, _ g: @escaping (Int) -> Int) -> ((Int) -> Bool) {
    // TODO: Your CODE HERE
    return { _ in false }
}
