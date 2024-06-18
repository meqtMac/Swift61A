//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/6/17.
//

let array = [1, 2, 3, 4]

struct Account {
    var balance: Double
    var holder: String
    
    init(balance: Double = 0, holder: String) {
        self.balance = balance
        self.holder = holder
    }
    
    mutating func deposit(amount: Double) -> Double {
        balance += amount
        return balance
    }
    
    mutating func withdraw(amount: Double) -> Double {
        if amount > balance {
            fatalError("Insufficent balance")
        }
        balance -= amount
        return balance
    }
}

// MARK: Creating Instance
// constructor
var a = Account(holder: "Alan")
let _  = a.balance
a.balance = 12
var b = Account(holder: "Ada")
let _ = b.balance
b.balance = 20

// MARK: Methods


