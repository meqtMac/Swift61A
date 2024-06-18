//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/6/17.
//

// MARK: Strings
let _ = "I am String"
let _ = "I'm String"
let _ = "你好"

let str = "Rust是这样的，Rust程序员只需要考虑引用计数，而我们Javascript程序员要考虑就更多了"
// string subscription
let char = str[str.index(str.startIndex, offsetBy: 5)]

// strings for sequences
for char in str {
    print(char)
}

// MARK: Dictionaries
let numerals = ["I": 1, "V": 5, "X": 10]
let x = numerals["V"]

//let dictionary: [Character: Int] = ["C": 1, "C": 2]
//dictionary.count


// implement func index
