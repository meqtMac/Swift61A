//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/6/17.
//


/// count the number of times that value appear in array s
public func count(s: Array<Int>, value: Int) -> Int {
    var total: Int = 0
    var index: Int = 0
    while index < s.count {
        let element = s[index]
        if element == value {
            total += 1
        }
        index += 1
    }
    return total
}

/// count the number of times that value appear in array s
public func count2(s: Array<Int>, value: Int) -> Int {
    var total: Int = 0
    for element in s {
        if element == value {
            total += 1
        }
    }
    return total
}

public func count3(s: Array<Int>, value: Int) -> Int {
    return s
        .filter { $0 == value}
        .count
}

public func divisors(of n: Int) -> [Int] {
    return [1] + (2..<n).filter { n % $0 == 0 }
}
