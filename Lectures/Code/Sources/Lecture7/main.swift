//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/6/12.
//

//import Foundation
//func printAll<T>(_ x: T) -> (T) -> Void
// MARK: Recursive Functions
// Definition: A function is called recursive if the body of that function calls itself, either directly or indirectly
// Implication: Executing the body of a recursive function may require applying that function again.

func split(_ n: Int) -> (Int, Int) {
    return (n / 10, n % 10)
}

func sum_digits(_ n: Int) -> Int {
    if n < 10 {
        return n
    } else {
        let (allButLast, last) = split(n)
        return sum_digits(allButLast) + last
    }
}

func fact(_ n: Int) -> Int {
    if n == 0 {
        return 1
    } else {
        return n * fact(n-1)
    }
}

// fact(3)
// using lldb to explain environment variable

func factIter(_ n: Int) -> Int {
    var total = 1
    var k = 1
    while k <= n {
        (total, k) = (total * k, k + 1)
    }
    return total
}

// convertion recursion to iteration

func sumDigitIter(_ n: Int) -> Int {
    var digitSum = 0
    var n = n
    while n > 0 {
        let (next, last) = split(n)
        n = next
        digitSum += last
    }
    return digitSum
}

func sumDigitRec(_ n: Int, sum: Int) -> Int {
    if n == 0 {
        return sum
    } else {
        let (n, last) = split(n)
        return sumDigitRec(n, sum: sum + last)
    }
}

