import Foundation

extension String {
    
    /// Creates a new string by stripping all shortcodes from this string.
    ///
    func strippingShortcodes() -> String {
        // CHECK-REGEX
        let pattern = #"\[[^\]]+\]"#
        
        return removingMatches(pattern: pattern, options: .caseInsensitive)
    }
}
