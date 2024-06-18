
public func add<T: AdditiveArithmetic>(_ x: T, _ y: T) -> T  {
    x + y
}

public func sub<T: AdditiveArithmetic>(_ x: T, _ y: T) -> T {
    x - y
}

public func mul<T: Numeric>(_ x: T, _ y: T) -> T {
    x * y
}
