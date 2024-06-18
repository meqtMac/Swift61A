//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/6/17.
//


// MARK: Iterators
let dict = ["A": 1, "B": 2]

var iter = dict.makeIterator()
let _ =  iter.next()
let _ = iter.next()

// MARK: Dictionary Iteration

// MARK: For Statement

// MARK: Built-in Iterator
// map, filter, zip, reversed

// MARK: time to lift protocol and method before itertor
// lazy apply

// MARK: Zip
func isPalindrome(s: [Int]) -> Bool {
    return s == s.reversed()
}

// MARK: Using Iterators
