//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/6/18.
//

//func fib(n: Int) -> Int {
//    
//}
public typealias FibCounter = (Int) -> Int
public func makeFibCounter() -> FibCounter {
    var cache = [Int](repeating: -1, count: 93)
    cache[0] = 0
    cache[1] = 1
    cache[2] = 1
    
    func fib(n: Int) -> Int {
        precondition(n > 0 && n <= 92, "n: \(n) can't be negative")
        if cache[n] != -1 {
            return cache[n]
        }
        print("count fib(n: \(n))")
        let res = fib(n: n - 1) + fib(n: n - 2)
        cache[n] = res
        return res
    }
    
    return fib
}

// TODO: fib cache
public func slowFib(n: Int) -> Int {
    if n <= 1 {
        return n
    }
    return slowFib(n: n - 1) + slowFib(n: n - 2)
}

public func dpFib(n: Int) -> Int {
    if n <= 1 {
        return n
    }
    var memory = [Int](repeating: 0, count: n + 1)
    memory[1] = 1
    for i in 2...n {
        memory[i] = memory[i - 1] + memory[i - 2]
    }
    return memory[n]
}
