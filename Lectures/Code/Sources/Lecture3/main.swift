//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/6/9.
//

//import Foundation
// 2
// print(2)
 print(print(2))
#if os(Linux)
import Glibc
#elseif os(macOS)
import Darwin
#else
#error("Un supported platform")
#endif

//*
// # Pure function
// 
// ## file.swift
// 
// ## comment
// 
// ## swift package manager
// 
// ## statements
// 
// ##
 




/// Divide integer n by divider,
/// - Parameters:
///   - n: number to be divide
///   - divider: dividor
/// - Returns: quotient and remainder of n divided by divider
func divideExactly(_ n: Int, by divider: Int) -> (Int, Int) {
    return (n / divider, n % divider)
}

func absolute(of n: Int) -> Int {
    if n > 0 {
        n
    } else if n == 0 {
        0
    } else {
        -n
    }
}

func iteration() {
    var i = 0
    var total = 0
    while i < 3 {
        i += 1
        total += i
    }
}

/// compute the nth Fibonacci number for `n >= 1`
func fibonacci(_ n: Int) -> Int {
    var pred = 0
    var current = 1
    var k = 1
    while k < n {
        (pred, current) = (current, pred + current)
        k += 1
    }
    return current
}

// MARK: higher order functions
func area(_ r: Double, shapeConstant: Double) -> Double {
    return r * r * shapeConstant
}

func areaSquare(_ r: Double) -> Double {
    area(1, shapeConstant: 1)
}

func areaCircle(_ r: Double) -> Double {
    area(r, shapeConstant: .pi)
}

func areaHexagon(_ r: Double) -> Double {
    area(r, shapeConstant: 2 * 3.0.squareRoot()  / 2)
}

func identity(_ n: Double) -> Double {
    return n
}

func cube(_ n: Double) -> Double {
    return pow(n, 3)
}

func sum(_ n: Int, term: (Double) -> Double) -> Double {
    var total: Double = 0
    var k = 1
    while k <= n {
        let temp = term(Double(k))
        total += temp
        k += 1
    }
    return total
}

func sumNaturals(_ n: Int) -> Double {
    sum(n, term: identity)
}

func sumCubic(_ n: Int) -> Double {
    sum(n, term: cube)
}


func makeAdder(n: Int) -> ((Int) -> Int) {
    func adder(k: Int) -> Int {
        return k + n
    }
    return adder
}


