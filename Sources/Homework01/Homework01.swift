// The Swift Programming Language
// https://docs.swift.org/swift-book

//from operator import add, sub
//

//@testable
//func aPlusAbsB(a: Int, b: Int) -> Int {
//    
//}


/// Return a+abs(b), but without calling abs
///
///     plusAbs(a: 2, b: 3)
///     // 5
///     plusAbs(a: 2, b: -3)
///     // 5
///
/// - Returns: a + abs(b)
func plusAbs(a: Int, b: Int) -> Int {
    // TODO: implement
    let h : (Int, Int) -> Int = { a, b in
        fatalError("Unimplemented")
    }
    return h(a, b)
}

/// - Parameters:
///   - x: first postive input
///   - y: second poistive int input
///   - z: third poistive int input
/// - Returns: `a*a + b*b`, where `a` and `b` are the two smallest members of the positive numbers `x`, `y`, and `z`
func twoOfThree(x: Int, y: Int, z: Int) -> Int {
    // TODO: implementation, your code should consists of nothing but an expression
    fatalError("Unimplemented")
}

/// - Returns: largest factor of `x` that is smaller than `x`
func largestFactor(_ x: Int) -> Int {
    // TODO: implementation
    fatalError("Unimplemented")
}

/// - Returns: `trueResult` if condition is a true value, and `falseResult` otherwise.
func ifFunction<T>(condition: Bool, trueResult: T, falseResult: T) -> T {
    // TODO: implementation
    fatalError("Unimplemented")
}
//def largest_factor(x):
//    """Return the largest factor of x that is smaller than x.
//
//    >>> largest_factor(15) # factors are 1, 3, 5
//    5
//    >>> largest_factor(80) # factors are 1, 2, 4, 5, 8, 10, 16, 20, 40
//    40
//    >>> largest_factor(13) # factor is 1 since 13 is prime
//    1
//    """
//    "*** YOUR CODE HERE ***"
//    if x == 1:
//        return x
//    y = x-1
//    while y > 0:
//        if x % y == 0:
//            return y
//        y -= 1
//
//
//def if_function(condition, true_result, false_result):
//    """Return true_result if condition is a true value, and
//    false_result otherwise.
//
//    >>> if_function(True, 2, 3)
//    2
//    >>> if_function(False, 2, 3)
//    3
//    >>> if_function(3==2, 3+2, 3-2)
//    1
//    >>> if_function(3>2, 3+2, 3-2)
//    5
//    """
//    if condition:
//        return true_result
//    else:
//        return false_result
//
//
//def with_if_statement():
//    """
//    >>> result = with_if_statement()
//    47
//    >>> print(result)
//    None
//    """
//    if cond():
//        return true_func()
//    else:
//        return false_func()
//
//def with_if_function():
//    """
//    >>> result = with_if_function()
//    42
//    47
//    >>> print(result)
//    None
//    """
//    return if_function(cond(), true_func(), false_func())
//
//def cond():
//    "*** YOUR CODE HERE ***"
//    return False
//
//def true_func():
//    "*** YOUR CODE HERE ***"
//    print(42)
//
//def false_func():
//    "*** YOUR CODE HERE ***"
//    print(47)
//
//
//def hailstone(x):
//    """Print the hailstone sequence starting at x and return its
//    length.
//
//    >>> a = hailstone(10)
//    10
//    5
//    16
//    8
//    4
//    2
//    1
//    >>> a
//    7
//    """
//    "*** YOUR CODE HERE ***"
//    a = 0
//    while True:
//        print(int(x))
//        a += 1
//        if x == 1:
//            return a
//        if x % 2 == 0:
//            x /= 2
//        else:
//            x = x * 3 + 1
//
//
//
