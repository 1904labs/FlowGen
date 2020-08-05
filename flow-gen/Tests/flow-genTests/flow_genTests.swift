import XCTest
@testable import flow_gen

final class flow_genTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(flow_gen().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
