#import <UIKit/UIKit.h>

@class WPTextFieldTableViewCell;
@interface WPStyleGuide : NSObject

// Fonts
+ (nonnull UIFont *)largePostTitleFont;
+ (nonnull NSDictionary *)largePostTitleAttributes;
+ (nonnull UIFont *)postTitleFont;
+ (nonnull UIFont *)postTitleFontBold;
+ (nonnull NSDictionary *)postTitleAttributes;
+ (nonnull NSDictionary *)postTitleAttributesBold;
+ (nonnull UIFont *)subtitleFont;
+ (nonnull NSDictionary *)subtitleAttributes;
+ (nonnull UIFont *)subtitleFontItalic;
+ (nonnull NSDictionary *)subtitleItalicAttributes;
+ (nonnull UIFont *)subtitleFontBold;
+ (nonnull NSDictionary *)subtitleAttributesBold;
+ (nonnull UIFont *)labelFont;
+ (nonnull UIFont *)labelFontNormal;
+ (nonnull NSDictionary *)labelAttributes;
+ (nonnull UIFont *)regularTextFont;
+ (nonnull UIFont *)regularTextFontSemiBold;
+ (nonnull UIFont *)regularTextFontBold;
+ (nonnull NSDictionary *)regularTextAttributes;
+ (nonnull UIFont *)tableviewTextFont;
+ (nonnull UIFont *)tableviewSubtitleFont;
+ (nonnull UIFont *)tableviewSectionHeaderFont;
+ (nonnull UIFont *)tableviewSectionFooterFont;

// Color
+ (nonnull UIColor *)wordPressBlue;
+ (nonnull UIColor *)lightBlue;
+ (nonnull UIColor *)mediumBlue;
+ (nonnull UIColor *)darkBlue;
+ (nonnull UIColor *)grey;
+ (nonnull UIColor *)lightGrey;
+ (nonnull UIColor *)greyLighten30;
+ (nonnull UIColor *)greyLighten20;
+ (nonnull UIColor *)greyLighten10;
+ (nonnull UIColor *)greyDarken10;
+ (nonnull UIColor *)greyDarken20;
+ (nonnull UIColor *)greyDarken30;
+ (nonnull UIColor *)darkGrey;
+ (nonnull UIColor *)jazzyOrange;
+ (nonnull UIColor *)fireOrange;
+ (nonnull UIColor *)validGreen;
+ (nonnull UIColor *)warningYellow;
+ (nonnull UIColor *)errorRed;
+ (nonnull UIColor *)alertYellowDark;
+ (nonnull UIColor *)alertYellowLighter;
+ (nonnull UIColor *)alertRedDarker;

// Misc
+ (nonnull UIColor *)keyboardColor;
+ (nonnull UIColor *)textFieldPlaceholderGrey;
+ (nonnull UIColor *)tableViewActionColor;

// Bar Button Styles
+ (UIBarButtonItemStyle)barButtonStyleForDone;
+ (UIBarButtonItemStyle)barButtonStyleForBordered;
+ (void)setLeftBarButtonItemWithCorrectSpacing:(nonnull UIBarButtonItem *)barButtonItem forNavigationItem:(nonnull UINavigationItem *)navigationItem;
+ (void)setRightBarButtonItemWithCorrectSpacing:(nonnull UIBarButtonItem *)barButtonItem forNavigationItem:(nonnull UINavigationItem *)navigationItem;

// View and TableView Helpers
+ (void)configureColorsForView:(nullable UIView *)view andTableView:(nullable UITableView *)tableView;
+ (void)configureColorsForView:(nullable UIView *)view collectionView:(nullable UICollectionView *)collectionView;
+ (void)configureTableViewCell:(nullable UITableViewCell *)cell;
+ (void)configureTableViewSmallSubtitleCell:(nullable UITableViewCell *)cell;
+ (void)configureTableViewActionCell:(nullable UITableViewCell *)cell;
+ (void)configureTableViewDestructiveActionCell:(nullable UITableViewCell *)cell;
+ (void)configureTableViewTextCell:(nullable WPTextFieldTableViewCell *)cell;
+ (void)configureTableViewSectionHeader:(nullable UIView *)header;
+ (void)configureTableViewSectionFooter:(nullable UIView *)footer;

// Move to a feature category
+ (nonnull UIColor *)buttonActionColor;
+ (nonnull UIColor *)nuxFormText;
+ (nonnull UIColor *)nuxFormPlaceholderText;
+ (void)configureFollowButton:(nullable UIButton *)followButton;

// Deprecated Colors
+ (nonnull UIColor *)baseLighterBlue;
+ (nonnull UIColor *)baseDarkerBlue;
+ (nonnull UIColor *)newKidOnTheBlockBlue;
+ (nonnull UIColor *)midnightBlue;
+ (nonnull UIColor *)bigEddieGrey;
+ (nonnull UIColor *)littleEddieGrey;
+ (nonnull UIColor *)whisperGrey;
+ (nonnull UIColor *)allTAllShadeGrey;
+ (nonnull UIColor *)readGrey;
+ (nonnull UIColor *)itsEverywhereGrey;
+ (nonnull UIColor *)darkAsNightGrey;
+ (nonnull UIColor *)validationErrorRed;

@end
