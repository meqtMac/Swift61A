//
//  File.swift
//
//
//  Created by 蒋艺 on 2024/6/17.
//


protocol AccountStorage {
    var balance: Double { get set }
    var holder: String { get set }
    mutating func deposit(n: Double) -> Double
    mutating func withdraw(n: Double) -> Double
}

extension AccountStorage {
    mutating func deposit(n: Double) -> Double {
        balance += n
        return balance
    }
    
    mutating func withdraw(n: Double) -> Double {
        if n > balance {
            fatalError("no enough balance")
        }
        balance -= n
        return balance
    }
}

struct Account: AccountStorage {
    var holder: String
    var balance: Double
}

struct CheckingAccount: AccountStorage {
    var holder: String
    var balance: Double
    
    mutating func withdraw(n: Double) -> Double {
        if (n + 1) > balance {
            fatalError("no enough balance")
        }
        balance -= (n + 1)
        return balance
    }
}


// MARK: Object-Oriented Design
struct Bank {
    enum BankAccount {
        case normal(Account)
        case check(CheckingAccount)
        enum AccountType {
            case normal
            case check
        }
        
    }
    var accounts: [BankAccount]
    
    mutating func open(holder: String, type: BankAccount.AccountType, amount: Double) {
        var account = BankAccount.init(holder: holder, type: type)
        account.deposit(n: amount)
        accounts.append(account)
    }
    
    mutating func payInterest() {
//        for account in accounts {
//            <#body#>
//        }
        for index in accounts.indices {
            let account = accounts[index]
            // TODO: interest
            accounts[index].deposit(n: account.balance * 0.01)
        }
    }
}


extension Bank.BankAccount: AccountStorage {
    
    init(holder: String, type: AccountType) {
        switch type {
        case .normal:
            self = .normal(Account(holder: holder, balance: 0))
        case .check:
            self = .check(CheckingAccount(holder: holder, balance: 0))
        }
    }
    
    
    var type: AccountType {
        switch self {
        case .normal(let account):
                .normal
        case .check(let checkingAccount):
                .check
        }
    }
    
    var holder: String {
        get {
            switch self {
            case .normal(let account):
                account.holder
            case .check(let checkingAccount):
                checkingAccount.holder
            }
        }
        mutating set {
            switch self {
            case .normal(let account):
                var newAccount = account
                newAccount.holder = newValue
                self = .normal(newAccount)
            case .check(let checkingAccount):
                var newCheckingAccount = checkingAccount
                newCheckingAccount.holder = newValue
                self = .check(newCheckingAccount)
            }
        }
    }
    
    var balance: Double {
        get {
            switch self {
            case .normal(let account):
                account.balance
            case .check(let checkingAccount):
                checkingAccount.balance
            }
        }
        mutating set {
            switch self {
            case .normal(let account):
                var newAccount = account
                newAccount.balance = newValue
                self = .normal(newAccount)
            case .check(let checkingAccount):
                var newCheckingAccount = checkingAccount
                newCheckingAccount.balance = newValue
                self = .check(newCheckingAccount)
            }
        }
    }
    
    @discardableResult
    mutating func deposit(n: Double) -> Double {
        switch self {
        case .normal(var account):
            let res = account.deposit(n: n)
            self = .normal(account)
            return res
        case .check(var checkingAccount):
            let res = checkingAccount.deposit(n: n)
            self = .check(checkingAccount)
            return res
        }
    }
    
    mutating func withdraw(n: Double) -> Double {
        switch self {
        case .normal(var account):
            let res = account.withdraw(n: n)
            self = .normal(account)
            return res
        case .check(var checkingAccount):
            let res = checkingAccount.withdraw(n: n)
            self = .check(checkingAccount)
            return res
        }
    }
}

//protocol MyProtocol {
//    func foo()
//    func bar()
//}
//
//struct MyStruct1: MyProtocol {
//    func foo() { }
//    func bar() { }
//}
//struct MyStruct2: MyProtocol {
//    func foo() { }
//    
//    func bar() { }
//}
//
//enum StructHolder: MyProtocol {
//    case first(MyStruct1)
//    case second(MyStruct2)
//}


// MARK: Attribute Lookup Practice
