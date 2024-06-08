import XCTest
@testable import Homework01

final class Homework01Tests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        
    }
    
    func testPlusAbs() throws {
        XCTAssertEqual(plusAbs(a: 2, b: 3), 5)
        XCTAssertEqual(plusAbs(a: 2, b: -3), 5)
    }
    
    func testTwoOfThree() throws {
//         XCTAssertEqual(aPlusAbsB(a: 2, b: 3), 5)
//        XCTAssertEqual(aPlusAbsB(a: 2, b: -3), 5)
        XCTAssertEqual(twoOfThree(x: 1, y: 2, z: 3), 5)
    }
    
    func testIfFunction() throws {
        
    }
    
}
