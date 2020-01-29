import Foundation

extension String {
    
    func replacingMatches(_ regex: NSRegularExpression) -> String {
        let range = NSRange(location: 0, length: self.utf16.count)
        
        return regex.stringByReplacingMatches(in: self, options: .reportCompletion, range: range, withTemplate: "")
    }
}
