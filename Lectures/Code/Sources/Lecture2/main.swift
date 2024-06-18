import Lecture

/**
 ## expresion, mutability and type annotation
 */

let x = 2000
let y = 24
let sum = add(x, y)

let left = sub(2048, 24)

let res = mul(253, 8)

let someCostant = mul(add(1, mul(2, 3)), sub(4, 5))


var radius: Double = 10

let π = Double.pi
let area = π * radius * radius
let circle = 2 * π  * radius
radius = 20
// area
//area = 200

//let closure: (Int, Int) -> Int = max(_:_:)
let maxClosure: (Int, Int) -> Int = max



func square(x: Int) -> Int {
    return mul(x, x)
}

func square(x: Double) -> Double {
    return mul(x, x)
}

func square(_ x: Int) -> Int {
    print("square_")
    return x * x
}

//let squareClousre = square(_:)
//squareClousre(5)
//
//let square2Closure = square(x:)
//squareClousre(5)
//
//
//let closure = square
let s1closure: (Double) -> Double = square
//s1closure(10)

//let s2closure: (Int) -> Int = square
let s2clousre = square(_:)
//s2closure(10)

let s3closure: (Int) -> Int = square(x:)
//s3closure(10.0)
//s3closure(10)

func sumSquare(_ x: Int, _ y: Int) -> Int {
    return add(square(x), square(y))
}

//func area() -> Double {
//    return π * r * r
//}
// area()
// r = 20
// area()


// Primitive Expression
// number, name, String
// call expression
//
var f: (Int, Int) -> Int = min
let g: (Int, Int) -> Int = max
let h = f
f = max

//f(1, g(2, h(3, 4)))
// answer: Int: 3

// MARK: Defining Functions
// <#function name#>(<#argument value 1#>, <#argument value 2#>)
// Statement
// declaration func <#function name#>(<#parameters#>) -> <#return type#> {
//<#statements#>
//}
func defineFunction() -> Int {
    let x = 20
    let y = 24
    let product = mul(y, x)
    return product
}

let temp = defineFunction()

func odd(_ number: Int) -> Int {
    let next = 3 * number + 1
    if next % 2 == 0 {
        return even(next)
    } else {
        return odd(next)
    }
}

func even(_ number: Int) -> Int {
    let next = number / 2
    if next == 1 {
        return 1
    }
    if next % 2 == 0 {
        return even(next)
    } else {
        return odd(next)
    }
}

//func step(_ number: Int) -> Int {
//    if number == 1 {
//        return 1
//    }
//    if number % 2 == 0 {
//        return even(number)
//    } else {
//        return odd(number)
//    }
//}

func trace(number: Int) {
    let one = odd(2 * number + 1)
    assert(one == 1)
}

trace(number: 30)
/**
 # debug
 ```sh
 lldb $BIN/Lecture02 launch
 breakpoint set --file main.swift --line 115
 run
 bt
 frame variable
 frame select 3
 frame variable 
 ```
 
 */
