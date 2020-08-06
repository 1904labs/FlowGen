import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(iOS_Flow_Gen_PackageTests.allTests),
    ]
}
#endif
