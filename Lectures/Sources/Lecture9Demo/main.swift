//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/6/17.
//

// MARK: Array
let digits = [1, 8, 2, 8]
// funtion
let _ = digits.count
// subscript
let _ = digits[0]

// concatenation
let _ = [2, 3] + digits

// iter
let doubles = digits.map { $0 * 2 }

// nested array
let pairs = [[10, 20], [30, 40]]
let _ = pairs[0][1]


// MARK: Containers
let _ = digits.contains(1)

// MARK: for statement
// types array
//let array = [[2, 3, 5], [6, 7 9]]
//let array = [[2, 3, 5], [6]]
//let array = [[2, 3, 5], 6]



// sequence iteration
// for statement
//: run in lldb with `swift run -c release --repl`

// sequence unpacking in for statement
let doublePairs = [(1, 2), (2, 2), (3, 2), (4, 4)]
var sameCount = 0
for (x, y) in doublePairs {
    if x == 7 {
        sameCount += 1
    }
}

// MARK: ranges

let range = 0..<10
//range.
let array = Array(range)

let doubleRange = 0..<10.0

for _ in 0..<3 {
    print("Swift61A")
}

// MARK: List Comprehensions or map
let odds = [1, 3, 5, 7, 9]
let even = odds.map { $0 + 1 }

let filted = odds.filter { 25 % $0 == 0 }

