import XCTest
import WordPressShared

class UIColorHelpersTests: XCTestCase {

    func testHexString() {
        XCTAssertEqual(UIColor.redColor().hexString().lowercaseString, "ff0000")

        // hexString works for RGB and grayscale colors
        XCTAssertEqual(UIColor.blackColor().hexString().lowercaseString, "000000")
        XCTAssertEqual(UIColor(white: 1, alpha: 1).hexString().lowercaseString, "ffffff")
    }

}
