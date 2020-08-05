import XCTest

import flow_genTests

var tests = [XCTestCaseEntry]()
tests += flow_genTests.allTests()
XCTMain(tests)
