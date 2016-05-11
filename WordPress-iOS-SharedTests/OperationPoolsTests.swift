import XCTest
import WordPressShared

class OperationPoolsTests: XCTestCase {
    private typealias TestPool = OperationPool<String, String, TestError>

    let testQueue = dispatch_queue_create("test-queue", DISPATCH_QUEUE_SERIAL)

    func testRequestDoesntDuplicateRequestInProgress() {
        let (pool, control) = mockOperationPool({ .success($0.uppercaseString) })

        control.lock.lock()
        pool.request("test", completion: { _ in })
        pool.request("test", completion: { _ in })

        XCTAssertEqual(control.startCount, 1)
        control.lock.unlock()
    }

    func testRequestStartsAfterPreviousIsCompleted() {
        let (pool, control) = mockOperationPool({ .success($0.uppercaseString) })

        let first = expectationWithDescription("complete")
        pool.request("test", completion: { _ in
            first.fulfill()
        })
        waitForExpectationsWithTimeout(4, handler: nil)

        XCTAssertEqual(control.startCount, 1)

        let second = expectationWithDescription("complete")
        pool.request("test", completion: { _ in
            second.fulfill()
        })
        waitForExpectationsWithTimeout(4, handler: nil)

        XCTAssertEqual(control.startCount, 2)
    }

    func testDifferentRequestsDoentPreventEachOther() {
        let (pool, control) = mockOperationPool({ .success($0.uppercaseString) })

        control.lock.lock()
        pool.request("test", completion: { _ in })
        pool.request("another", completion: { _ in })

        XCTAssertEqual(control.startCount, 2)
        control.lock.unlock()
    }

    func testSuccessfulResultMatchesExpectedValue() {
        let (pool, _) = mockOperationPool({ .success($0.uppercaseString) })

        var result: Result<String, TestError>? = nil
        let expectation = expectationWithDescription("complete")
        pool.request("test", completion: {
            result = $0
            expectation.fulfill()
        })

        waitForExpectationsWithTimeout(4, handler: nil)

        XCTAssertEqual(result?.value, "TEST")
    }

    func testFailedResultMatchesExpectedValue() {
        let (pool, _) = mockOperationPool({ _ in .failure(TestError.someError) })

        var result: Result<String, TestError>? = nil
        let expectation = expectationWithDescription("complete")
        pool.request("test", completion: {
            result = $0
            expectation.fulfill()
        })

        waitForExpectationsWithTimeout(4, handler: nil)

        XCTAssertEqual(result?.error, TestError.someError)
    }
    

    private func mockOperationPool(transform: String -> Result<String, TestError>) -> (TestPool, PoolControl) {
        let control = PoolControl()
        let pool: TestPool = OperationPool { key, completion in
            control.startCount += 1
            let result = transform(key)
            dispatch_async(self.testQueue, {
                control.lock.lock()
                completion(result)
                control.lock.unlock()
            })
        }
        return (pool, control)
    }
}

class PoolControl {
    let lock = NSLock()
    var startCount = 0
}

private enum TestError: ErrorType {
    case someError
}
