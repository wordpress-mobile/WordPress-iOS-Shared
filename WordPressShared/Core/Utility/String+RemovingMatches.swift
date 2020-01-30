import Foundation

extension String {
    
    /// Creates a new string by removing all matches of the specified regex.
    ///
    func removingMatches(_ regex: NSRegularExpression) -> String {
        let range = NSRange(location: 0, length: self.utf16.count)
        
        return regex.stringByReplacingMatches(in: self, options: .reportCompletion, range: range, withTemplate: "")
    }
}
