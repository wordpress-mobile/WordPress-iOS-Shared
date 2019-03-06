import Foundation
import XCTest
@testable import WordPressShared

class NSDateHelperTest: XCTestCase {
    struct Data {
        let year: Int
        let month: Int
        let day: Int
        
        var dateString: String {
            return "\(year)-\(month)-\(day)"
        }
    }
    
    let data = Data(year: 2019, month: 02, day: 17)
    var date: Date?
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    override func setUp() {
        date = dateFormatter.date(from: data.dateString)
    }
    
    func testDateAndTimeComponents() {
        XCTAssertNotNil(date)

        let components = date!.dateAndTimeComponents()
        XCTAssertEqual(components.year, data.year)
        XCTAssertEqual(components.month, data.month)
        XCTAssertEqual(components.day, data.day)
    }
}
