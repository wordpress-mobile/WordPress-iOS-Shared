import XCTest
import WordPressShared

class NSURLExtensionTests: XCTestCase {
    func testEnforcingHTTPSChangesHttpUrl() {
        let url = NSURL(string: "http://example.com/test")!
        XCTAssertEqual(url.enforcingHTTPS.absoluteString, "https://example.com/test")
    }

    func testEnforcingHTTPSDoesntChangeHttps() {
        let url = NSURL(string: "https://example.com/test")!
        XCTAssertEqual(url.enforcingHTTPS.absoluteString, "https://example.com/test")
    }

    func testEnforcingHTTPSDoesntChangeFtp() {
        let url = NSURL(string: "ftp://example.com/test")!
        XCTAssertEqual(url.enforcingHTTPS.absoluteString, "ftp://example.com/test")
    }

    func testEnforcingHTTPSForDomainChangesMatchingDomain() {
        let url = NSURL(string: "http://example.com/test")!
        XCTAssertEqual(url.enforcingHTTPSForDomain("example.com").absoluteString, "https://example.com/test")
    }

    func testEnforcingHTTPSForDomainChangesMatchingSubdomain() {
        let url = NSURL(string: "http://test.example.com/test")!
        XCTAssertEqual(url.enforcingHTTPSForDomain("example.com").absoluteString, "https://test.example.com/test")
    }

    func testEnforcingHTTPSForDomainDoesntChangeNonMatchingDomain() {
        let url = NSURL(string: "http://example.com/test")!
        XCTAssertEqual(url.enforcingHTTPSForDomain("wordpress.com").absoluteString, "http://example.com/test")
    }

}
