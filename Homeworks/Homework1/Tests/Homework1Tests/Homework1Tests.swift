import XCTest
@testable import Homework1

final class Homework1Tests: XCTestCase {
   func testFalling() throws {
        XCTAssertEqual(falling(n: 6, k: 3), 120)  // 6 * 5 * 4
        XCTAssertEqual(falling(n: 4, k: 3), 24)   // 4 * 3 * 2
        XCTAssertEqual(falling(n: 4, k: 1), 4)    // 4
        XCTAssertEqual(falling(n: 4, k: 0), 1)    // 1
    }

    func testSumDigits() {
        XCTAssertEqual(sumDigits(y: 10), 1)  // 1 + 0 = 1
        XCTAssertEqual(sumDigits(y: 4224), 12)  // 4 + 2 + 2 + 4 = 12
        XCTAssertEqual(sumDigits(y: 1234567890), 45)
        XCTAssertEqual(sumDigits(y: 123), 6)
    }

    func testDoubleEights() {
        XCTAssertFalse(doubleEights(n: 8))
        XCTAssertTrue(doubleEights(n: 88))
        XCTAssertTrue(doubleEights(n: 2882))
        XCTAssertTrue(doubleEights(n: 880088))
        XCTAssertFalse(doubleEights(n: 12345))
        XCTAssertFalse(doubleEights(n: 80808080))
    }
}