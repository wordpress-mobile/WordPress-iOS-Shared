#import <UIKit/UIKit.h>

@class UITableViewTextFieldCell;
@interface WPStyleGuide : NSObject

// Fonts
+ (UIFont *)largePostTitleFont;
+ (NSDictionary *)largePostTitleAttributes;
+ (UIFont *)postTitleFont;
+ (UIFont *)postTitleFontBold;
+ (NSDictionary *)postTitleAttributes;
+ (NSDictionary *)postTitleAttributesBold;
+ (UIFont *)subtitleFont;
+ (NSDictionary *)subtitleAttributes;
+ (UIFont *)subtitleFontItalic;
+ (NSDictionary *)subtitleItalicAttributes;
+ (UIFont *)subtitleFontBold;
+ (NSDictionary *)subtitleAttributesBold;
+ (UIFont *)labelFont;
+ (UIFont *)labelFontNormal;
+ (NSDictionary *)labelAttributes;
+ (UIFont *)regularTextFont;
+ (UIFont *)regularTextFontSemiBold;
+ (UIFont *)regularTextFontBold;
+ (NSDictionary *)regularTextAttributes;
+ (UIFont *)tableviewTextFont;
+ (UIFont *)tableviewSubtitleFont;
+ (UIFont *)tableviewSectionHeaderFont;

// Color
+ (UIColor *)wordPressBlue;
+ (UIColor *)lightBlue;
+ (UIColor *)mediumBlue;
+ (UIColor *)darkBlue;
+ (UIColor *)gray;
+ (UIColor *)lightGrey;
+ (UIColor *)grayLighten30;
+ (UIColor *)grayLighten20;
+ (UIColor *)grayLighten10;
+ (UIColor *)grayDarken10;
+ (UIColor *)grayDarken20;
+ (UIColor *)grayDarken30;
+ (UIColor *)darkGray;
+ (UIColor *)jazzyOrange;
+ (UIColor *)fireOrange;
+ (UIColor *)validGreen;
+ (UIColor *)warningYellow;
+ (UIColor *)errorRed;

// Misc
+ (UIColor *)keyboardColor;
+ (UIColor *)textFieldPlaceholderGrey;
+ (UIColor *)tableViewActionColor;

// Bar Button Styles
+ (UIBarButtonItemStyle)barButtonStyleForDone;
+ (UIBarButtonItemStyle)barButtonStyleForBordered;
+ (void)setLeftBarButtonItemWithCorrectSpacing:(UIBarButtonItem *)barButtonItem forNavigationItem:(UINavigationItem *)navigationItem;
+ (void)setRightBarButtonItemWithCorrectSpacing:(UIBarButtonItem *)barButtonItem forNavigationItem:(UINavigationItem *)navigationItem;

// View and TableView Helpers
+ (void)configureColorsForView:(UIView *)view andTableView:(UITableView *)tableView;
+ (void)configureColorsForView:(UIView *)view collectionView:(UICollectionView *)collectionView;
+ (void)configureTableViewActionCell:(UITableViewCell *)cell;
+ (void)configureTableViewCell:(UITableViewCell *)cell;
+ (void)configureTableViewTextCell:(UITableViewTextFieldCell *)cell;
+ (void)configureTableViewSmallSubtitleCell:(UITableViewCell *)cell;

// Move to a feature category
+ (UIColor *)buttonActionColor;
+ (UIColor *)nuxFormText;
+ (UIColor *)nuxFormPlaceholderText;
+ (UIColor *)notificationsLightGrey;
+ (UIColor *)notificationsDarkGrey;
+ (void)configureFollowButton:(UIButton *)followButton;

// Deprecated Colors
+ (UIColor *)baseLighterBlue;
+ (UIColor *)baseDarkerBlue;
+ (UIColor *)newKidOnTheBlockBlue;
+ (UIColor *)midnightBlue;
+ (UIColor *)bigEddieGrey;
+ (UIColor *)littleEddieGrey;
+ (UIColor *)whisperGrey;
+ (UIColor *)allTAllShadeGrey;
+ (UIColor *)readGrey;
+ (UIColor *)itsEverywhereGrey;
+ (UIColor *)darkAsNightGrey;
+ (UIColor *)validationErrorRed;

@end
