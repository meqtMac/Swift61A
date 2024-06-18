//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/6/10.
//

import Foundation
// # Higher-Order Functions

// MARK: Functions as Return Values
func makeAdder(n: Int) -> (Int) -> Int {
    func adder(_ k: Int) -> Int {
        k + n
    }
    return adder
}

func makeSecondAdder(n: Int) -> (Int) -> Int {
    let adder = { [n] (k: Int) -> Int in
        k + n
    }
    return adder
}

func makeThirdAdder(n: Int) -> (Int) -> Int {
    let adder = { (k: Int) -> Int in
        k + n
    }
    return adder
}

func makeFourthAdder(n: Int) -> (Int) -> Int {
    let adder = { k in
        k + n
    }
    return adder
}

func makeFifthAdder(n: Int) -> (Int) -> Int {
    return { $0 + n }
}

// Functions defined within other function bodies are bound to names in a local frame
/**
 Functions are first-class: Functions can be can be manipulated as values in our programming language.
 Higher-order function: A function that takes a function as an argument value or returns a function as a return value
 - express general methods of computation
 - reduce repetition from programming
 - seperate concerns from functions
 */


