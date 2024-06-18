//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/6/10.
//


func searchFirstAnswer(of function: (Int) -> Bool ) -> Int {
    var x = 0
    var isAnswer = function(x)
    while !isAnswer {
        x += 1
        isAnswer = function(x)
    }
    return x
}

func isThree(x: Int) -> Bool {
    x == 3
}

func postive(x: Int) -> Bool {
    let res = max(0, x * x - 100)
    return res > 0
}

typealias Translation = (Int) -> Int

// introduction escaping function

/// return `g(y)` for function f such that `g(f(x)) = x`
/// - Parameter function: the function to be inversed
func inverse(of function: @escaping Translation ) -> Translation {
    func g(y: Int) -> Int {
        return searchFirstAnswer { x in
            function(x) == y
        }
    }
    return g
}


typealias Func = (Int) -> Int
typealias FuncCarries = (@escaping Func) -> Func
func pirate(_ arg: Int) -> FuncCarries {
    print("matey")
    func plunder(_ arg: @escaping Func) -> Func {
        return arg
    }
    return plunder
}

func square(_ value: Int) -> Int {
    return value * value
}

let res = pirate(3)(square)(4) + 1
//pirate(pirate(pirate<Int>(_:)))
print(res)


typealias IntTranslation = (Int) -> Int
typealias IntTranslationCarrier = (IntTranslation) -> Int

func horse(_ mask: IntTranslationCarrier) -> Int {
    let horse = mask
    let mask: IntTranslation = {
        $0
    }
    return horse(mask)
}

let mask: IntTranslationCarrier = { translation in
    translation(2)
}

let displayValue = horse(mask)
print(displayValue)
