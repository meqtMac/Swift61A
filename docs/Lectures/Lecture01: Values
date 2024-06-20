Certainly! Here are the two documents you requested. The first document is a markdown document for students to read and learn from. The second document is a guide for recording a tutorial video, illustrating what to say and do during the recording.

### Student Document

# Swift Tutorial: Values

## Introduction
In Swift, values can be declared using `let` and `var` keywords. This document explains how to declare constants and variables, and how to use basic types in Swift.

### Constants and Variables

#### Constant Declaration
A constant value is declared using the `let` keyword. Once assigned, the value of a constant cannot be changed.

```swift
let intConstant = 10
let doubleConstant = 10.0
let str = "Swift61A"
```

#### Variable Declaration
A variable value is declared using the `var` keyword. The value of a variable can be changed after it is initially assigned.

```swift
var mutableInt = 5
mutableInt = 10
```

on the other side, if you ture to change the value of a constant declared with `let`, swift compiler would throw and compile error

```swift
let constantValue = 10
constantValue = 14 // ❌
```

there are other ways of change variables' value other than assign it to a newValue
```swift
mutableInt += 2
var prelude = "Hello, "
// functions can change prelude's value
prelude.append("World")
let welcome = "Hello, "
welcome.append("World") //  ❌
```

you may wounder that constant are pretty useless as they can't change. But let give you an example same as before

```swift
let template = "Hello, "
let grate = template.appending("World") 
print(grate)
let congurate = "Hello, " 
let language = "swift"
let result = congurate + language
print(result)
```

notice that appending and append are different, `append` mutate the variable being called on, `appending` on the other side returns a new value let the constant on changed.

### Types
Every value in Swift has a Type. Every value in Swift programming in bytes from computer's view, Types are context for bytes.

```swift
let intConstant = 10
// intConstant: Int = 10
let doubleConstant = 10.0
// doubleConstant: Double = 10
```

here `Int` and `Double` are both types.


#### Basic Types
Swift supports several basic types, including integers, floating-point numbers, strings, and characters.

- **Int**: Represents an integer value.
- **Double**: Represents a double-precision floating-point value.
- **String**: Represents a sequence of characters.

```swift
let str = "Hello, World"
// str: String = "Hello, World!"
```

- **Character**: Represents a single character.

```swift
let char: Character = "你"
// char: Character = "你"
```

you may wonder that the same double quote syntax first evaluate to the `String` Type then `Character` Type. Because the for the second declaration, I use Type annotation.


### Type Annotation
Type annotation specifies the type of a variable or constant explicitly.

<!-- ### Automatic Type Inference -->
Swift can automatically infer the type of a variable or constant based on the assigned value.



```swift
let implicitIntValue = 10
let implicitDoubleValue = 10.0
let floatValue: Float = 10.0
let explicitDoubleValue: Double = 10
let explicitString: String = "Hello, Swift!"
let explictChar: Character = "S"
// and swift is even smarter
let anotherPi = 3 + 0.14159
// anotherPi is also inferred to be of type Double

// and swift is a type safe language
let bool = false
if bool {
    print("True value")
} else {
    print("False Value")
}
// ❌: the code below won't compile, because anotherPi is of type Double, and it's can't be evaluate to Bool 
if anotherPi {
    print("True value")
} else {
    print("False Value")
}
// ❌: the code below won't compile, because Int and Double are two different type
let sum = implicitIntValue + floatValue
let sumFloat1 = floatValue + 1
let sumFloat1 = floatValue + 1.0
let sumDouble = implictDoubleValue + 1
let sumInt = implictIntValue + 1
let sumInt = implictIntValue + 1.0 // ❌ 1 can be evaluate to Int and Float, Double, but 1.0 can't be evaluate to Int
```

```swift
let inferredInt = 42 // inferred as Int
let inferredDouble = 3.14159 // inferred as Double
```

### Summary
In Swift, use `let` to declare constants and `var` to declare variables. Swift supports several basic types and can automatically infer types based on the assigned values.
