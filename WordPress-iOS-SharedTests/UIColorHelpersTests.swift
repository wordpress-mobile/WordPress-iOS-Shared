import XCTest
import WordPressShared

class UIColorHelpersTests: XCTestCase {

    func testHexString() {
        XCTAssertEqual(UIColor.redColor().hexString().lowercaseString, "ff0000")

        // hexString only works for RGB colors
        XCTAssertEqual(UIColor.blackColor().hexString(), nil)
        XCTAssertEqual(UIColor(white: 1, alpha: 1).hexString(), nil)
    }

}
