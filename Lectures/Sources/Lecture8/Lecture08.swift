//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/6/15.
//

//import Foundation
// MARK: Order of recursion functions

func cascade(n: Int) {
    if n < 10 {
       print(n)
    } else {
        print(n)
        cascade(n: n / 10)
        print(n)
    }
}

// use lldb

func cascade2(n: Int) {
       print(n)
    if n >= 10 {
        cascade2(n: n / 10)
        print(n)
    }
}




//func grow(
//fun)
func both(n: Int, _ f: (Int) -> Void, then g: (Int) -> Void ) {
    if n <= 0 {
        return
    }
    f(n)
    g(n)
}

func display(int n: Int) {
    print(n)
}

//func grow
//let grow: (Int) -> Void = { n in
//    both(n: n, , then: <#T##(Int) -> Void#>)
//}
func grow(_ n: Int) {
    both(n: n / 10, grow(_:), then: display(int:))
}

func shrink(_ n: Int) {
     both(n: n / 10, display(int:), then: shrink(_:))
   
}

// clearity vs. simipility
// when learn to write recursive functions, put the base cases first
func inverseCascade(n: Int) {
    grow(n)
    print(n)
    shrink(n)
}

//inverseCascade(n: 123456)

// MARK: Tree Recursion
public func fib(n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1  {
        return 1
    }
    return fib(n: n - 1) + fib(n: n - 2)
}

public func fibIter(n: Int) -> Int {
    assert(n >= 0, "n must be positive")
    if n <= 1 {
        return n
    }
    var buffer = Array(repeating: 1, count: n + 1)
    for i in 3...n {
        buffer[i] = buffer[i-1] + buffer[i-2]
    }
    return buffer[n]
}

//#if os(macOS)
#if canImport(Darwin)
import Darwin
#elseif os(Linux)
import GLibc
#else
#error("Un supported platfrom")
#endif

public func fibMath(n: Int) -> Double {
    let sqrt5 = pow(5, 0.5)
    let lambda1 = (sqrt5 + 1) / 2
    let lambda2 = (sqrt5 - 1) / 2
    let n = Double(n)
    
    return (pow(lambda1, n) - pow(lambda2, n)) / sqrt5
}

//let clock = SuspendingClock()
//let n = 50
//var fibRes: Int = 0
//var fibIterRes: Int = 0
//var fibMathRes: Double = 0

//let recTime =  clock.measure {
//    fibRes = fib(n: n)
//}
//let repeatTimes = 1000_000

//let iterTime = clock.measure {
//    for _ in 0..<repeatTimes {
//        fibIterRes = fibIter(n: n)
//    }
//}

//let mathTime =  clock.measure {
//    for _ in 0..<repeatTimes {
//        fibMathRes = fibMath(n: n)
//    }
//}

////print("fib res: \(fibRes) time: \(recTime)")
//print("fibIter res: \(fibIterRes) time: \(iterTime/Double(repeatTimes))")
//print("fibMath res: \(Int(fibMathRes + 0.5)) time: \(mathTime/Double(repeatTimes))")

// TODO: trace machine
public struct StackTrace {
    var depth: Int
    var args: [String]
    let name: String
    
    mutating func push(arg: String) {
        let prefix = String(repeating: "  ", count: depth)
        depth += 1
        args.append(arg)
        print("\(prefix)\(name)(\(arg))")
    }
    
    mutating func pop() {
//        let prefix = String(repeating: "  ", count: depth)
//        print("\(prefix)}")
 
        depth -= 1
        args.removeLast()
    }
    
    public static func traceFib(n: Int) {
        var tracer = StackTrace(depth: 0, args: [], name: "fib")
        func fib(n: Int) -> Int {
            tracer.push(arg: "\(n)")
            defer {
                tracer.pop()
            }
            if n == 0 {
                return 0
            } else if n == 1  {
                return 1
            }
            return fib(n: n - 1) + fib(n: n - 2)
        }
        let _ = fib(n: n)
        return
    }
}

//StackTrace.traceFib(n: 2)
//print("---")
//StackTrace.traceFib(n: 3)
//print("---")
//StackTrace.traceFib(n: 4)
//

//public func makeFib() -> ((Int) -> Int) {
//    let maxIntFib = 92
//}

// repetition in Tree-Recursive Computation

// MARK: Example: Counting Partitions
// The number of partitions of a positive integer n, using parts up to size m, is the number of ways in which n can be expressed as the sum of positive integer parts up to m in increasing order.

public func countPartion(n: Int, m: Int) -> [[Int]] {
    if n == 0 {
        return Array<Array<Int>>(repeating: [], count: 1)
    }
    if m == 0 {
        return Array<Array<Int>>()
    }
    // left part contains at least one m
    let withMParts: [[Int]] = if n < m {
        []
    } else {
        countPartion(n: n - m, m: m)
            .map { partion in
                var partion = partion
                partion.append(m)
                return partion
            }
    }
    
    // right Part contians no m
    let noMParts = countPartion(n: n, m: m - 1)
    
    return withMParts + noMParts
}

public extension StackTrace {
    static func traceCountPartition(n: Int, m: Int) {
        var tracer = StackTrace(depth: 0, args: ["(n: \(n), m:\(m))"], name: "countPartion")
        func countPartion(n: Int, m: Int) -> [[Int]] {
            tracer.push(arg: "n: \(n), m: \(m)")
            defer {
                tracer.pop()
            }
            if n == 0 {
                return [[]]
            }
            if m == 0 {
                return []
            }
            // left part contains at least one m
            let withMParts: [[Int]] = if n < m {
                []
            } else {
                countPartion(n: n - m, m: m)
                    .map { partion in
                        var partion = partion
                        partion.append(m)
                        return partion
                    }
            }
            
            // right Part contians no m
            let noMParts = countPartion(n: n, m: m - 1)
            
            return withMParts + noMParts
        }

        let _ = countPartion(n: n, m: m)
        return
    }
}
