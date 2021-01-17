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

    /// Verifies that `mediumString` produces relative format strings when less than 7 days have elapsed.
    func testToMediumStringRelativeString() {
        let date = Date()
        XCTAssertEqual(date.toMediumString(), "now")
        XCTAssertEqual(date.addingTimeInterval(-60*5).toMediumString(), "5 minutes ago")
        XCTAssertEqual(date.addingTimeInterval(-60*60*2).toMediumString(), "2 hours ago")
        XCTAssertEqual(date.addingTimeInterval(-60*60*24).toMediumString(), "yesterday")
        XCTAssertEqual(date.addingTimeInterval(-60*60*24*6).toMediumString(), "6 days ago")
    }

    /// Verifies that  `mediumStringWithTime` takes into account the time zone adjustment
    func testMediumStringTimeZoneAdjust() {
        let date = Date()
        let timeZone = TimeZone(secondsFromGMT: Calendar.current.timeZone.secondsFromGMT() - (60 * 60))
        XCTAssertEqual(date.toMediumString(inTimeZone: timeZone), "now")
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short
        let withoutTimeZoneAdjust = timeFormatter.string(from: date)
        
        XCTAssertEqual(date.mediumStringWithTime(), "Today at \(withoutTimeZoneAdjust)")
                
        timeFormatter.timeZone = timeZone
        let withTimeZoneAdjust = timeFormatter.string(from: date)
        
        XCTAssertEqual(date.mediumStringWithTime(timeZone: timeZone), "Today at \(withTimeZoneAdjust)")
    }
}
