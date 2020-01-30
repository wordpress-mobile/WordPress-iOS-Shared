import Foundation

extension String {
    
    /// Creates a new string by removing all matches of the specified regex.
    ///
    func removingMatches(pattern: String) -> String {
        let range = NSRange(location: 0, length: self.utf16.count)
        let regex: NSRegularExpression
        
        do {
            regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        } catch {
            DDLogError(("Error parsing regex: \(error)"))
            return self
        }
        
        return regex.stringByReplacingMatches(in: self, options: .reportCompletion, range: range, withTemplate: "")
    }
}
