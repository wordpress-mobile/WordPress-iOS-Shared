import UIKit

@objc public class WPStyleGuide {
    // MARK: - Fonts
    struct Fonts {
        static let largePostTitle = WPFontManager.openSansLightFontOfSize(32.0)
        static let postTitle = WPFontManager.openSansRegularFontOfSize(16.0)
        static let postTitleBold = WPFontManager.openSansBoldFontOfSize(16.0)
        static let subtitle = WPFontManager.openSansRegularFontOfSize(12.0)
        static let subtitleItalic = WPFontManager.openSansItalicFontOfSize(12.0)
        static let subtitleBold = WPFontManager.openSansBoldFontOfSize(12.0)
        static let label = WPFontManager.openSansBoldFontOfSize(10.0)
        static let labelNormal = WPFontManager.openSansRegularFontOfSize(10.0)
        static let regularText = WPFontManager.openSansRegularFontOfSize(16.0)
        static let regularTextBold = WPFontManager.openSansBoldFontOfSize(16.0)
        static let tableviewText = WPFontManager.openSansRegularFontOfSize(18.0)
        static let tableviewSubtitle = WPFontManager.openSansLightFontOfSize(18.0)
        static let tableviewSectionHeader = WPFontManager.openSansBoldFontOfSize(12.0)
    }

    // MARK: Class functions for Obj-C
    public class func largePostTitleFont() -> UIFont { return Fonts.largePostTitle }
    public class func postTitleFont() -> UIFont { return Fonts.postTitle }
    public class func postTitleFontBold() -> UIFont { return Fonts.postTitleBold }
    public class func subtitleFont() -> UIFont { return Fonts.subtitle }
    public class func subtitleFontItalic() -> UIFont { return Fonts.subtitleItalic }
    public class func subtitleFontBold() -> UIFont { return Fonts.subtitleBold }
    public class func labelFont() -> UIFont { return Fonts.label }
    public class func labelFontNormal() -> UIFont { return Fonts.labelNormal }
    public class func regularTextFont() -> UIFont { return Fonts.regularText }
    public class func regularTextFontBold() -> UIFont { return Fonts.regularTextBold }
    public class func tableviewTextFont() -> UIFont { return Fonts.tableviewText }
    public class func tableviewSubtitleFont() -> UIFont { return Fonts.tableviewSubtitle }
    public class func tableviewSectionHeaderFont() -> UIFont { return Fonts.tableviewSectionHeader }

    // MARK: - Font Attributes
    struct FontAttributes {
        static let largePostTitle = WPStyleGuide.buildParagraphStyle(font: Fonts.largePostTitle, minimumHeight: 35, maximumHeight: 35)
        static let postTitle = WPStyleGuide.buildParagraphStyle(font: Fonts.postTitle, minimumHeight: 19, maximumHeight: 19)
        static let postTitleBold = WPStyleGuide.buildParagraphStyle(font: Fonts.postTitleBold, minimumHeight: 19, maximumHeight: 19)
        static let subtitle = WPStyleGuide.buildParagraphStyle(font: Fonts.subtitle, minimumHeight: 14, maximumHeight: 14)
        static let subtitleItalic = WPStyleGuide.buildParagraphStyle(font: Fonts.subtitleItalic, minimumHeight: 14, maximumHeight: 14)
        static let subtitleBold = WPStyleGuide.buildParagraphStyle(font: Fonts.subtitleBold, minimumHeight: 14, maximumHeight: 14)
        static let label = WPStyleGuide.buildParagraphStyle(font: Fonts.label, minimumHeight: 12, maximumHeight: 12)
        static let regularText = WPStyleGuide.buildParagraphStyle(font: Fonts.regularText, minimumHeight: 24, maximumHeight: 24)

        static let defaultDTCoreTextOptions = { () -> NSDictionary in
            let defaultStyles = "blockquote {background-color: #EEEEEE; width: 100%; display: block; padding: 8px 5px 10px 0;}"

            var cssStylesheet = DTCSSStylesheet(styleBlock: defaultStyles)

            let is_iPad = UIDevice.currentDevice().userInterfaceIdiom == .Pad

            return [DTDefaultFontFamily:            "Open Sans",
                DTDefaultLineHeightMultiplier:  (is_iPad ? 1.6 : 1.4),
                DTDefaultFontSize:              (is_iPad ? 18 : 16),
                DTDefaultTextColor:             Colors.littleEddieGrey,
                DTDefaultLinkColor:             Colors.baseLighterBlue,
                DTDefaultLinkHighlightColor:    Colors.midnightBlue,
                DTDefaultLinkDecoration:        false,
                DTDefaultStyleSheet:            cssStylesheet]
        }
    }

    private class func buildParagraphStyle(#font: UIFont, minimumHeight: UInt8, maximumHeight: UInt8) -> NSDictionary {
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = CGFloat(minimumHeight)
        paragraphStyle.maximumLineHeight = CGFloat(maximumHeight)

        return [NSParagraphStyleAttributeName: paragraphStyle, NSFontAttributeName: font]
    }

    // MARK: - Colors
    struct Colors {
        static let wordPressBlue = UIColor(red: 0/255.0, green: 135/255.0, blue: 190/255.0, alpha: 1.0)
        static let baseLighterBlue = UIColor(red: 0/255.0, green: 135/255.0, blue: 190/255.0, alpha: 1.0)
        static let baseDarkerBlue = UIColor(red: 0/255.0, green: 135/255.0, blue: 190/255.0, alpha: 1.0)
        static let lightBlue = UIColor(red: 120/255.0, green: 220/255.0, blue: 250/255.0, alpha: 1.0)
        static let newKidOnTheBlockBlue = UIColor(red: 0/255.0, green: 170/255.0, blue: 220/255.0, alpha: 1.0)
        static let midnightBlue = UIColor(red: 0/255.0, green: 80/255.0, blue: 130/255.0, alpha: 1.0)
        static let jazzyOrange = UIColor(red: 240/255.0, green: 130/255.0, blue: 30/255.0, alpha: 1.0)
        static let fireOrange = UIColor(red: 213/255.0, green: 78/255.0, blue: 33/255.0, alpha: 1.0)
        static let bigEddieGrey = UIColor(red: 34/255.0, green: 34/255.0, blue: 34/255.0, alpha: 1.0)
        static let littleEddieGrey = UIColor(red: 50/255.0, green: 65/255.0, blue: 85/255.0, alpha: 1.0)
        static let whisperGrey = UIColor(red: 82/255.0, green: 122/255.0, blue: 148/255.0, alpha: 1.0)
        static let allTAllShadeGrey = UIColor(red: 144/255.0, green: 174/255.0, blue: 194/255.0, alpha: 1.0)
        static let readGrey = UIColor(red: 210/255.0, green: 222/255.0, blue: 230/255.0, alpha: 1.0)
        static let itsEverywhereGrey = UIColor(red: 232/255.0, green: 240/255.0, blue: 247/255.0, alpha: 1.0)
        static let darkAsNightGrey = UIColor(red: 0/255.0, green: 80/255.0, blue: 130/255.0, alpha: 1.0)
        static let textFieldPlaceholderGrey = UIColor(red: 144/255.0, green: 174/255.0, blue: 194/255.0, alpha: 1.0)
        static let validationErrorRed = UIColor(red: 0.7, green: 0.0, blue: 0.0, alpha: 1.0)
        static let tableViewActionColor = baseLighterBlue
        static let buttonActionColor = baseLighterBlue
        static let nuxFormText = UIColor(red: 50/255.0, green: 65/255.0, blue: 85/255.0, alpha: 1.0)
        static let nuxFormPlaceholderText = UIColor(red: 144/255.0, green: 174/255.0, blue: 194/255.0, alpha: 1.0)
        static let notificationsLightGrey = UIColor(red: 244/255.0, green: 248/255.0, blue: 250/255.0, alpha: 1.0)
        static let notificationsDarkGrey = UIColor(red: 210/255.0, green: 222/255.0, blue: 230/255.0, alpha: 1.0)

        static let keyboardColor = { () -> UIColor in
            let versionString = UIDevice.currentDevice().systemVersion
            let hasLighterKeyboard = versionString.compare("7.1", options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedAscending
            let is_iPad = UIDevice.currentDevice().userInterfaceIdiom == .Pad

            if hasLighterKeyboard {
                if is_iPad {
                    return UIColor(red: 207/255, green: 210/255, blue: 213/255, alpha: 1.0)
                } else {
                    return UIColor(red: 220/255, green: 223/255, blue: 226/255, alpha: 1.0)
                }
            }

            if is_iPad {
                return UIColor(red: 217/255, green: 220/255, blue: 220/255, alpha: 223/255)
            } else {
                return UIColor(red: 204/255, green: 208/255, blue: 214/255, alpha: 1.0)
            }
        }

    }

    // MARK: Class functions for Obj-C
    public class func wordPressBlue() -> UIColor { return Colors.wordPressBlue }
    public class func baseLighterBlue() -> UIColor { return Colors.baseLighterBlue }
    public class func baseDarkerBlue() -> UIColor { return Colors.baseDarkerBlue }
    public class func lightBlue() -> UIColor { return Colors.lightBlue }
    public class func newKidOnTheBlockBlue() -> UIColor { return Colors.newKidOnTheBlockBlue }
    public class func midnightBlue() -> UIColor { return Colors.midnightBlue }
    public class func jazzyOrange() -> UIColor { return Colors.jazzyOrange }
    public class func fireOrange() -> UIColor { return Colors.fireOrange }
    public class func bigEddieGrey() -> UIColor { return Colors.bigEddieGrey }
    public class func littleEddieGrey() -> UIColor { return Colors.littleEddieGrey }
    public class func whisperGrey() -> UIColor { return Colors.whisperGrey }
    public class func allTAllShadeGrey() -> UIColor { return Colors.allTAllShadeGrey }
    public class func readGrey() -> UIColor { return Colors.readGrey }
    public class func itsEverywhereGrey() -> UIColor { return Colors.itsEverywhereGrey }
    public class func darkAsNightGrey() -> UIColor { return Colors.darkAsNightGrey }
    public class func textFieldPlaceholderGrey() -> UIColor { return Colors.textFieldPlaceholderGrey }
    public class func validationErrorRed() -> UIColor { return Colors.validationErrorRed }
    public class func tableViewActionColor() -> UIColor { return Colors.tableViewActionColor }
    public class func buttonActionColor() -> UIColor { return Colors.buttonActionColor }
    public class func nuxFormText() -> UIColor { return Colors.nuxFormText }
    public class func nuxFormPlaceholderText() -> UIColor { return Colors.nuxFormPlaceholderText }
    public class func notificationsLightGrey() -> UIColor { return Colors.notificationsLightGrey }
    public class func notificationsDarkGrey() -> UIColor { return Colors.notificationsDarkGrey }
    public class func keyboardColor() -> UIColor { return Colors.keyboardColor() }

    class func barButtonStyleForDone() -> UIBarButtonItemStyle {
        return .Plain
    }

    class func barButtonStyleForBordered() -> UIBarButtonItemStyle {
        return .Plain
    }

    class func spacerForNavigationBarButtonItems() -> UIBarButtonItem {
        var spacerButton = UIBarButtonItem(barButtonSystemItem: .FixedSpace,
                                                        target: nil,
                                                        action: nil)
        spacerButton.width = -16.0

        return spacerButton
    }

    class func setLeftBarButtonItemWithCorrectSpacing(barButtonItem: UIBarButtonItem,
                                                      navigationItem: UINavigationItem)
    {
        navigationItem.leftBarButtonItems = [self.spacerForNavigationBarButtonItems(), barButtonItem]
    }

    class func setRightBarButtonItemWithCorrectSpacing(barButtonItem: UIBarButtonItem,
                                                       navigationItem: UINavigationItem)
    {
        navigationItem.rightBarButtonItems = [self.spacerForNavigationBarButtonItems(), barButtonItem]
    }

    class func configureTableViewActionCell(cell: UITableViewCell) {
        cell.textLabel.font = Fonts.tableviewText
        cell.textLabel.textColor = Colors.tableViewActionColor
    }

    class func configureTableViewCell(cell: UITableViewCell) {
        cell.textLabel.font = Fonts.tableviewText
        cell.textLabel.textColor = Colors.whisperGrey
        cell.textLabel.sizeToFit()

        cell.detailTextLabel.font = Fonts.tableviewSubtitle
        cell.detailTextLabel.textColor = Colors.whisperGrey
        cell.detailTextLabel.sizeToFit()

        if cell.isKindOfClass(UITableViewTextFieldCell) {
            var tfcell = cell as UITableViewTextFieldCell
            tfcell.textField.textColor = Colors.whisperGrey
        }
    }

    class func configureTableViewTextCell(cell: UITableViewTextFieldCell) {
        self.configureTableViewCell(cell)
        cell.textField.font = Fonts.tableviewSubtitle

        if cell.textField.enabled {
            cell.textField.textColor = Colors.darkAsNightGrey
            cell.textField.textAlignment = .Left
        } else {
            cell.textField.textColor = Colors.textFieldPlaceholderGrey
            cell.textField.textAlignment = .Right
        }
    }

    class func configureTableViewSmallSubtitleCell(cell: UITableViewCell) {
        self.configureTableViewCell(cell)
        cell.detailTextLabel.font = Fonts.subtitle
    }

    class func configureColorsForView(view: UIView, tableView: UITableView) {
        tableView.backgroundView = nil
        tableView.backgroundColor = Colors.itsEverywhereGrey
        tableView.separatorColor = Colors.readGrey
        view.backgroundColor = Colors.itsEverywhereGrey
    }

    class func configureColorsForView(view: UIView, collectionView: UICollectionView) {
        collectionView.backgroundView = nil
        collectionView.backgroundColor = Colors.itsEverywhereGrey
        view.backgroundColor = Colors.itsEverywhereGrey
    }

    class func configureFollowButton(followButton: UIButton) {
        followButton.contentHorizontalAlignment = .Left
        followButton.backgroundColor = UIColor.clearColor()
        followButton.titleLabel.font = Fonts.subtitle

        let followString = NSLocalizedString("Follow", comment: "Prompt to follow a blog.")
        followButton.setTitle(followString, forState: .Normal)
        followButton.setImage(UIImage(named: "reader-postaction-follow"), forState: .Normal)
        followButton.setTitleColor(Colors.allTAllShadeGrey, forState: .Normal)

        let followedString = NSLocalizedString("Following", comment: "User is following the blog.")
        followButton.setTitle(followedString, forState: .Selected)
        followButton.setImage(UIImage(named: "reader-postaction-following"), forState: .Selected)
    }
}
