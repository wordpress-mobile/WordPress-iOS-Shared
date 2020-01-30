import Foundation

extension String {
    
    /// Creates a new string by stripping all shortcodes from this string.
    ///
    func strippingShortcodes() -> String {
        let pattern = "\\[[^\\]]+\\]"
        let regex: NSRegularExpression
        
        do {
            regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        } catch {
            DDLogError(("Error parsing regex: \(error)"))
            return self
        }
        
        return removingMatches(regex)
    }
}
