import XCTest
@testable import Homework2

final class Homework2Tests: XCTestCase {
    func testLambdaCurry() {
        let curriedAdd = lambdaCurry2(Homework2.add)
        let addThree = curriedAdd(3)
        XCTAssertEqual(addThree(5), 8)

        let curriedMul = lambdaCurry2(mul)
        let mul5 = curriedMul(5)
        XCTAssertEqual(mul5(42), 210)

        let curriedMod = lambdaCurry2(mod)
        XCTAssertEqual(curriedMod(123)(10), 3)
    }

    func testCount() {
        // Define the `countFactors` function using `countCond`.
        let countFactors = count { n, i in n % i == 0 }

        // Define the `isPrime` predicate.
        let isPrime: (Int, Int) -> Bool = { _, i in countFactors(i) == 2 }

        // Define the `countPrimes` function using `countCond` and `isPrime`.
        let countPrimes = count(condition: isPrime)

        // count Factor Tests
        XCTAssertEqual(countFactors(2), 2)   // 1, 2
        XCTAssertEqual(countFactors(4), 3)   // 1, 2, 4
        XCTAssertEqual(countFactors(12), 6)  // 1, 2, 3, 4, 6, 12

        // count Prime Tests
        XCTAssertEqual(countPrimes(2), 1)    // 2
        XCTAssertEqual(countPrimes(3), 2)    // 2, 3
        XCTAssertEqual(countPrimes(4), 2)    // 2, 3
        XCTAssertEqual(countPrimes(5), 3)    // 2, 3, 5
        XCTAssertEqual(countPrimes(20), 8)   // 2, 3, 5, 7, 11, 13, 17, 19
    }

    func testComposeIdentity() {
        let addOne: (Int) -> Int = { $0 + 1 }
        let square: (Int) -> Int = { $0 * $0 }
        let b1 = compositeIdentity(square, addOne)
        XCTAssertTrue(b1(0))  // (0 + 1)^2 == 0^2 + 1
        XCTAssertFalse(b1(4)) // (4 + 1)^2 != 4^2 + 1
    }

    func testCycle() {
        let add1: (Int) -> Int = { $0 + 1 }
        let times2: (Int) -> Int = { $0 * 2 }
        let add3: (Int) -> Int = { $0 + 3 }
        let myCycle = cycle(add1, times2, add3)

        let identity = myCycle(0)
        let addOneThenDouble = myCycle(2)
        let doAllFunctions = myCycle(3)
        let doMoreThanACycle = myCycle(4)
        let doTwoCycles = myCycle(6)

        XCTAssertEqual(identity(5), 5)
        XCTAssertEqual(addOneThenDouble(1), 4)
        XCTAssertEqual(doAllFunctions(2), 9)
        XCTAssertEqual(doMoreThanACycle(2), 10)
        XCTAssertEqual(doTwoCycles(1), 19)
    }
}
