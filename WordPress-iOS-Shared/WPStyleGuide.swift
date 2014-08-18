import UIKit

@objc class WPStyleGuide {
    // MARK: - Fonts
    class func largePostTitleFont() -> UIFont {
        return WPFontManager.openSansLightFontOfSize(32.0)
    }

    class func largePostTitleAttributes() -> NSDictionary {
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 35.0
        paragraphStyle.maximumLineHeight = 35.0

        return [NSParagraphStyleAttributeName: paragraphStyle,
                NSFontAttributeName:           self.largePostTitleFont()]
    }

    class func postTitleFont() -> UIFont {
        return WPFontManager.openSansRegularFontOfSize(16.0)
    }

    class func postTitleFontBold() -> UIFont {
        return WPFontManager.openSansBoldFontOfSize(16.0)
    }

    class func postTitleAttributes() -> NSDictionary {
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 19.0
        paragraphStyle.maximumLineHeight = 19.0

        return [NSParagraphStyleAttributeName: paragraphStyle,
                NSFontAttributeName:           self.postTitleFont()]
    }

    class func postTitleAttributesBold() -> NSDictionary {
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 19.0
        paragraphStyle.maximumLineHeight = 19.0

        return [NSParagraphStyleAttributeName: paragraphStyle,
                NSFontAttributeName:           self.postTitleFontBold()]
    }

    class func subtitleFont() -> UIFont {
        return WPFontManager.openSansRegularFontOfSize(12.0)
    }

    class func subtitleAttributes() -> NSDictionary {
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 14.0
        paragraphStyle.maximumLineHeight = 14.0

        return [NSParagraphStyleAttributeName: paragraphStyle,
                NSFontAttributeName:           self.subtitleFont()]
    }

    class func subtitleFontItalic() -> UIFont {
        return WPFontManager.openSansItalicFontOfSize(12.0)
    }

    class func subtitleItalicAttributes() -> NSDictionary {
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 14.0
        paragraphStyle.maximumLineHeight = 14.0

        return [NSParagraphStyleAttributeName: paragraphStyle,
                NSFontAttributeName:           self.subtitleFontItalic()]
    }

    class func subtitleFontBold() -> UIFont {
        return WPFontManager.openSansBoldFontOfSize(12.0)
    }

    class func subtitleAttributesBold() -> NSDictionary {
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 14.0
        paragraphStyle.maximumLineHeight = 14.0

        return [NSParagraphStyleAttributeName: paragraphStyle,
                NSFontAttributeName:           self.subtitleFontBold()]
    }

    class func labelFont() -> UIFont {
        return WPFontManager.openSansBoldFontOfSize(10.0)
    }

    class func labelFontNormal() -> UIFont {
        return WPFontManager.openSansRegularFontOfSize(10.0)
    }

    class func labelAttributes() -> NSDictionary {
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 12.0
        paragraphStyle.maximumLineHeight = 12.0

        return [NSParagraphStyleAttributeName: paragraphStyle,
                NSFontAttributeName:           self.labelFont()]
    }

    class func regularTextFont() -> UIFont {
        return WPFontManager.openSansRegularFontOfSize(16.0)
    }

    class func regularTextFontBold() -> UIFont {
        return WPFontManager.openSansBoldFontOfSize(16.0)
    }

    class func regularTextAttributes() -> NSDictionary {
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 24.0
        paragraphStyle.maximumLineHeight = 24.0

        return [NSParagraphStyleAttributeName: paragraphStyle,
                NSFontAttributeName:           self.regularTextFont()]
    }

    class func tableviewTextFont() -> UIFont {
        return WPFontManager.openSansRegularFontOfSize(18.0)
    }

    class func tableviewSubtitleFont() -> UIFont {
        return WPFontManager.openSansLightFontOfSize(18.0)
    }

    class func tableviewSectionHeaderFont() -> UIFont {
        return WPFontManager.openSansBoldFontOfSize(12.0)
    }

    class func defaultDTCoreTextOptions() -> NSDictionary {
        let defaultStyles = "blockquote {background-color: #EEEEEE; width: 100%; display: block; padding: 8px 5px 10px 0;}"

        var cssStylesheet = DTCSSStylesheet(styleBlock: defaultStyles)

        let is_iPad = UIDevice.currentDevice().userInterfaceIdiom == .Pad

        return [DTDefaultFontFamily:            "Open Sans",
                DTDefaultLineHeightMultiplier:  (is_iPad ? 1.6 : 1.4),
                DTDefaultFontSize:              (is_iPad ? 18 : 16),
                DTDefaultTextColor:             self.littleEddieGrey(),
                DTDefaultLinkColor:             self.baseLighterBlue(),
                DTDefaultLinkHighlightColor:    self.midnightBlue(),
                DTDefaultLinkDecoration:        false,
                DTDefaultStyleSheet:            cssStylesheet]
    }

    // MARK: - Colors
    class func wordPressBlue() -> UIColor {
        return UIColor(red: 0/255.0, green: 135/255.0, blue: 190/255.0, alpha: 1.0)
    }

    class func baseLighterBlue() -> UIColor {
        return UIColor(red: 0/255.0, green: 135/255.0, blue: 190/255.0, alpha: 1.0)
    }

    class func baseDarkerBlue() -> UIColor {
        return UIColor(red: 0/255.0, green: 135/255.0, blue: 190/255.0, alpha: 1.0)
    }

    class func lightBlue() -> UIColor {
        return UIColor(red: 120/255.0, green: 220/255.0, blue: 250/255.0, alpha: 1.0)
    }

    class func newKidOnTheBlockBlue() -> UIColor {
        return UIColor(red: 0/255.0, green: 170/255.0, blue: 220/255.0, alpha: 1.0)
    }

    class func midnightBlue() -> UIColor {
        return UIColor(red: 0/255.0, green: 80/255.0, blue: 130/255.0, alpha: 1.0)
    }

    class func jazzyOrange() -> UIColor {
        return UIColor(red: 240/255.0, green: 130/255.0, blue: 30/255.0, alpha: 1.0)
    }

    class func fireOrange() -> UIColor {
        return UIColor(red: 213/255.0, green: 78/255.0, blue: 33/255.0, alpha: 1.0)
    }

    class func bigEddieGrey() -> UIColor {
        return UIColor(red: 34/255.0, green: 34/255.0, blue: 34/255.0, alpha: 1.0)
    }

    class func littleEddieGrey() -> UIColor {
        return UIColor(red: 50/255.0, green: 65/255.0, blue: 85/255.0, alpha: 1.0)
    }

    class func whisperGrey() -> UIColor {
        return UIColor(red: 82/255.0, green: 122/255.0, blue: 148/255.0, alpha: 1.0)
    }

    class func allTAllShadeGrey() -> UIColor {
        return UIColor(red: 144/255.0, green: 174/255.0, blue: 194/255.0, alpha: 1.0)
    }

    class func readGrey() -> UIColor {
        return UIColor(red: 210/255.0, green: 222/255.0, blue: 230/255.0, alpha: 1.0)
    }

    class func itsEverywhereGrey() -> UIColor {
        return UIColor(red: 232/255.0, green: 240/255.0, blue: 247/255.0, alpha: 1.0)
    }

    class func darkAsNightGrey() -> UIColor {
        return UIColor(red: 0/255.0, green: 80/255.0, blue: 130/255.0, alpha: 1.0)
    }

    class func textFieldPlaceholderGrey() -> UIColor {
        return UIColor(red: 144/255.0, green: 174/255.0, blue: 194/255.0, alpha: 1.0)
    }

    class func validationErrorRed() -> UIColor {
        return UIColor(red: 0.7, green: 0.0, blue: 0.0, alpha: 1.0)
    }

    class func tableViewActionColor() -> UIColor {
        return self.baseLighterBlue()
    }

    class func buttonActionColor() -> UIColor {
        return self.baseLighterBlue()
    }

    class func nuxFormText() -> UIColor {
        return UIColor(red: 50/255.0, green: 65/255.0, blue: 85/255.0, alpha: 1.0)
    }

    class func nuxFormPlaceholderText() -> UIColor {
        return UIColor(red: 144/255.0, green: 174/255.0, blue: 194/255.0, alpha: 1.0)
    }

    class func notificationsLightGrey() -> UIColor {
        return UIColor(red: 244/255.0, green: 248/255.0, blue: 250/255.0, alpha: 1.0)
    }

    class func notificationsDarkGrey() -> UIColor {
        return UIColor(red: 210/255.0, green: 222/255.0, blue: 230/255.0, alpha: 1.0)
    }

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
        cell.textLabel.font = self.tableviewTextFont()
        cell.textLabel.textColor = self.tableViewActionColor()
    }

    class func configureTableViewCell(cell: UITableViewCell) {
        cell.textLabel.font = self.tableviewTextFont()
        cell.textLabel.textColor = self.whisperGrey()
        cell.textLabel.sizeToFit()

        cell.detailTextLabel.font = self.tableviewSubtitleFont()
        cell.detailTextLabel.textColor = self.whisperGrey()
        cell.detailTextLabel.sizeToFit()

        if cell.isKindOfClass(UITableViewTextFieldCell) {
            var tfcell = cell as UITableViewTextFieldCell
            tfcell.textField.textColor = self.whisperGrey()
        }
    }

    class func configureTableViewTextCell(cell: UITableViewTextFieldCell) {
        self.configureTableViewCell(cell)
        cell.textField.font = self.tableviewSubtitleFont()

        if cell.textField.enabled {
            cell.textField.textColor = self.darkAsNightGrey()
            cell.textField.textAlignment = .Left
        } else {
            cell.textField.textColor = self.textFieldPlaceholderGrey()
            cell.textField.textAlignment = .Right
        }
    }

    class func configureTableViewSmallSubtitleCell(cell: UITableViewCell) {
        self.configureTableViewCell(cell)
        cell.detailTextLabel.font = self.subtitleFont()
    }

    class func configureColorsForView(view: UIView, tableView: UITableView) {
        tableView.backgroundView = nil
        tableView.backgroundColor = self.itsEverywhereGrey()
        tableView.separatorColor = self.readGrey()

        view.backgroundColor = self.itsEverywhereGrey()
    }

    class func configureColorsForView(view: UIView, collectionView: UICollectionView) {
        collectionView.backgroundView = nil
        collectionView.backgroundColor = self.itsEverywhereGrey()
        view.backgroundColor = self.itsEverywhereGrey()
    }

    class func configureFollowButton(followButton: UIButton) {
        followButton.contentHorizontalAlignment = .Left
        followButton.backgroundColor = UIColor.clearColor()
        followButton.titleLabel.font = self.subtitleFont()

        let followString = NSLocalizedString("Follow", comment: "Prompt to follow a blog.")
        followButton.setTitle(followString, forState: .Normal)
        followButton.setImage(UIImage(named: "reader-postaction-follow"), forState: .Normal)
        followButton.setTitleColor(self.allTAllShadeGrey(), forState: .Normal)

        let followedString = NSLocalizedString("Following", comment: "User is following the blog.")
        followButton.setTitle(followedString, forState: .Selected)
        followButton.setImage(UIImage(named: "reader-postaction-following"), forState: .Selected)
    }

    class func keyboardColor() -> UIColor {
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
