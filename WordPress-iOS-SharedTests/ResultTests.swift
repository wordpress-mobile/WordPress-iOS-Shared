import XCTest
import WordPressShared

private struct TestError: ErrorType {
    let message: String
    init(_ message: String) {
        self.message = message
    }
}

class ResultTests: XCTestCase {
    private typealias TestResult = Result<String, TestError>
    private let success: TestResult = .success("Success")
    private let failure: TestResult = .failure(TestError("Failure"))
    private let secondFailure: TestResult = .failure(TestError("Second"))

    func testMapTransformsSuccess() {
        XCTAssertEqual(success.map({ $0.uppercaseString }).value, "SUCCESS")
    }

    func testMapWrapsFailures() {
        XCTAssertEqual(failure.map({ $0.characters.count }).error?.message, "Failure")
    }

    func testFlatMapTransformSuccess() {
        XCTAssertEqual(success.flatMap({ .success($0.uppercaseString) }).value, "SUCCESS")
        XCTAssertEqual(success.flatMap({ _ in secondFailure }).error?.message, "Second")
    }

    func testFlatMapPropagatesOriginalFailure() {
        XCTAssertEqual(failure.flatMap({ _ in secondFailure }).error?.message, "Failure")
    }

    func testValueIsNilForFailure() {
        XCTAssertNil(failure.value)
    }

    func testValueIsPresentForSuccess() {
        XCTAssertNotNil(success.value)
    }

    func testErrorIsNilForSuccess() {
        XCTAssertNil(success.error)
    }

    func testErrorIsPresentForFailure() {
        XCTAssertNotNil(failure.error)
    }
}
