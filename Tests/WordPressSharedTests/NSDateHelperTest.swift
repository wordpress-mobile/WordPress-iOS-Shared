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
        NSTimeZone.default = TimeZone(secondsFromGMT: 0)!
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
    /// If this test is failing, check that the Test Plan is still using en-US as its language
    func testToMediumStringRelativeString() {
        let date = Date()

        XCTAssertEqual(date.toMediumString(), "now")

        XCTAssertEqual(date.addingTimeInterval(-60*5).toMediumString(), "5 minutes ago")
        XCTAssertEqual(date.addingTimeInterval(1).addingTimeInterval(60*5).toMediumString(), "in 5 minutes")

        XCTAssertEqual(date.addingTimeInterval(-60*60*2).toMediumString(), "2 hours ago")
        XCTAssertEqual(date.addingTimeInterval(1).addingTimeInterval(60*60*2).toMediumString(), "in 2 hours")

        XCTAssertEqual(date.addingTimeInterval(-60*60*24).toMediumString(), "yesterday")
        XCTAssertEqual(date.addingTimeInterval(1).addingTimeInterval(60*60*24).toMediumString(), "tomorrow")

        XCTAssertEqual(date.addingTimeInterval(-60*60*24*6).toMediumString(), "6 days ago")
        XCTAssertEqual(date.addingTimeInterval(1).addingTimeInterval(60*60*24*6).toMediumString(), "in 6 days")
    }

    /// Verifies that  `mediumStringWithTime` takes into account the time zone adjustment
    /// If this test is failing, check that the Test Plan is still using en-US as its language
    func testMediumStringTimeZoneAdjust() {
        let date = Date()
        let timeZone = TimeZone(secondsFromGMT: Calendar.current.timeZone.secondsFromGMT() - (60 * 60))
        XCTAssertEqual(date.toMediumString(inTimeZone: timeZone), "now")
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short
        let withoutTimeZoneAdjust = timeFormatter.string(from: date)
        
        XCTAssertEqual(date.mediumStringWithTime(), "Today, \(withoutTimeZoneAdjust)")

        timeFormatter.timeZone = timeZone
        let withTimeZoneAdjust = timeFormatter.string(from: date)
        
        XCTAssertEqual(date.mediumStringWithTime(timeZone: timeZone), "Today, \(withTimeZoneAdjust)")
    }
}
