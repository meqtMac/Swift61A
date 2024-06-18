//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/6/17.
//

// MARK: Objects

// dot syntax
// attributes
// method

// MARK: Examples: String
let s = "Hello"
let lower = s.lowercased()
let _ = s.uppercased()

// ASCII encoding
print("\n\n\n")
let char: Character = "a"
let ascciValue = char.asciiValue
// Unicode
let chineseChar: Character = "牛"
let value = chineseChar.unicodeScalars
let utf8Value = chineseChar.utf8

let emoji: Character = "😅"
let _ = emoji.utf8

// MARK: Mutation Operations
let suits = ["coin", "string", "myriad"]
var originalSuit = suits
//suits.popLast()
originalSuit.popLast()
originalSuit.append("cup")
//originalSuit.remove("string")
originalSuit.removeAll { $0 == "string" }
originalSuit[2] = "spade"
// suit

// MARK: should I inject class and reference type here? I think it should be better if I postpone the reference type and reference counting.
// some objects can change
var dict = ["I": 1, "V": 5, "X": 10]
let _ =  dict["X"]
//let _ =  dict["X"]
dict["X"] = 11
dict["X"]
dict["L"] = 11

// muatation can happen within a function call

// MARK: Tuples
let _ = (3, 4, 5, 6)

// MARK: Mutation


// MARK: Mutable Functions? need to adjust in swift
// withdraw() -> 75
// withdraw() -> 50
