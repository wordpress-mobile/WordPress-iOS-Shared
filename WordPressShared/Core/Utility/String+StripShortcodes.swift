import Foundation

extension String {
    
    func strippingShortcodes() -> String {
        let pattern = "\\[[^\\]]+\\]"
        let regex: NSRegularExpression
        
        do {
            regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        } catch {
            DDLogError(("Error parsing regex: \(error)"))
            return self
        }
        
        return replacingMatches(regex)
    }
}
