# Lab2: Higher-Order Functions, Lambda Expressions

## Q1: Lambdas and Currying
We can transform multiple-argument functions into a chain of single-argument, higher order functions by taking advantage of lambda expressions. For example, we can write a function f(x, y) as a different function g(x)(y). This is known as currying. It's useful when dealing with functions that take only single-argument functions. We will see some examples of these later on.

Write a function lambda_curry2 that will curry any two argument function using closure.

Your solution to this problem should fit entirely on the return line. You can try writing it first without this restriction, but rewrite it after in one line.

```swift
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
    return { _ in { 0 } }
}
```

## Q2: Count van Count 
Consider the following implementations of countFactors and countPrimes:
```swift
/// Return the number of positive factors that n has
func countFactors(n: Int) -> Int {
    var count = 0
    for i in 1...n {
        if n % i == 0 {
            count += 1
        }
    }
    return count
}

/// Return the number of prime numbers up to and including n.
func countPrimes(n: Int) -> Int {
    func isPrime(_ n: Int) -> Bool {
        countFactor(n) == 2 // only factors are 1 and n
    }
    var count = 0 
    for i in 1...n {
        if isPrime(n) {
            count += 1
        }
    }
    return count
}
```

The implementations look quite similar! Generalize this logic by writing a function countCond, which takes in a two-argument predicate function condition(n, i). count_cond returns a one-argument function that takes in n, which counts all the numbers from 1 to n that satisfy condition when called.


```swift
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
/// let countFactors = count{ n, i in n % i == 0 }
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
}
```

## Q3: Composite Identity Function
Write a function that takes in two single-argument functions, `f` and `g`, and returns another function that has a single parameter `x`. The returned function should return True if `f(g(x))` is equal to `g(f(x))`. You can assume the output of `g(x)` is a valid input for `f` and vice versa. Try to use the `compose1` function defined below for more HOF practice.

```swift
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
```

## Q4: I Heard You Liked Functions...
Define a function cycle that takes in three functions `f1`, `f2`, `f3`, as arguments. cycle will return another function that should take in an integer argument `n` and return another function. That final function should take in an argument `x` and `cycle` through applying `f1`, `f2`, and `f3` to `x`, depending on what `n` was. Here's what the final function should do to `x` for a few values of `n`:

- `n = 0`, return `x`
- `n = 1`, apply `f1` to `x`, or return `f1(x)`
- `n = 2`, apply `f1` to `x` and then `f2` to the result of that, or return `f2(f1(x))`
- `n = 3`, apply `f1` to `x`, `f2` to the result of applying `f1`, and then `f3` to the result of applying `f2`, or `f3(f2(f1(x)))`
- `n = 4`, start the cycle again applying `f1`, then `f2`, then `f3`, then `f1` again, or `f1(f3(f2(f1(x))))`
And so forth.
Hint: most of the work goes inside the most nested function.

```swift
// MARK: Q4: I Heard You Liked Functions...
/// Returns a function that is itself a higher-order function.
///
/// - Parameters:
///   - f1: A function that takes a single argument.
///   - f2: A function that takes a single argument.
///   - f3: A function that takes a single argument.
/// - Returns: A function that takes an integer n and returns another function that takes an argument x and applies f1, f2, and f3 cyclically depending on n.
///
/// Examples:
/// ```
/// let add1: (Int) -> Int = { $0 + 1 }
/// let times2: (Int) -> Int = { $0 * 2 }
/// let add3: (Int) -> Int = { $0 + 3 }
/// let myCycle = cycle(add1, times2, add3)
///
/// let identity = myCycle(0)
/// print(identity(5))  // 5
///
/// let addOneThenDouble = myCycle(2)
/// print(addOneThenDouble(1))  // 4
///
/// let doAllFunctions = myCycle(3)
/// print(doAllFunctions(2))  // 9
///
/// let doMoreThanACycle = myCycle(4)
/// print(doMoreThanACycle(2))  // 10
///
/// let doTwoCycles = myCycle(6)
/// print(doTwoCycles(1))  // 19
/// ```
func cycle(_ f1: @escaping (Int) -> Int, _ f2: @escaping (Int) -> Int, _ f3: @escaping (Int) -> Int) -> (Int) -> ((Int) -> Int) {
    // TODO: Your Code Here
}
```