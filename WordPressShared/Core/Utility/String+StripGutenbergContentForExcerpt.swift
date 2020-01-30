import Foundation

/// This extension provides logic for stripping some Gutenberg content that should not be
/// shown when generating post excerpts.
///
extension String {
    
    /// This method is the main entry point to generate excerpts for Gutenberg content.
    ///
    public func strippingGutenbergContentForExcerpt() -> String {
        return strippingGutenbergGalleries()
    }
    
    /// Strips Gutenberg galleries from strings.
    ///
    private func strippingGutenbergGalleries() -> String {
        let pattern = "(?s)<!--\\swp:gallery?(.*?)wp:gallery\\s-->"
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
