import Foundation

/// WPStyleGuide Extension to use serif fonts.
///
extension WPStyleGuide {
    /// Returns the system serif font (New York) for iOS 13+ but defaults to noto for older os's
    @objc public class func serifFontForTextStyle(_ style: UIFont.TextStyle,
                                             fontWeight weight: UIFont.Weight = .regular) -> UIFont {
        guard #available(iOS 13, *),
            let fontDescriptor = WPStyleGuide.fontForTextStyle(style, fontWeight: weight).fontDescriptor.withDesign(.serif)
        else {
            return WPStyleGuide.notoFontForTextStyle(style, fontWeight: weight)
        }

        return UIFontMetrics.default.scaledFont(for: UIFont(descriptor: fontDescriptor, size: 0.0))
    }

    
    private class func notoFontForTextStyle(_ style: UIFont.TextStyle,
                                            fontWeight weight: UIFont.Weight = .regular) -> UIFont {
        var font: UIFont

        switch weight {
        // Map all the bold weights to the bold font
        case .bold, .heavy, .black:
            font = WPStyleGuide.notoBoldFontForTextStyle(style)
        default:
            font = WPStyleGuide.notoFontForTextStyle(style)
        }

        return font
    }
}
