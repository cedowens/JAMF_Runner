import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(JAMF_RunnerTests.allTests),
    ]
}
#endif
