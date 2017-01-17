#import <UIKit/UIKit.h>

@interface WPFontManager : NSObject

/// Loads the OpenSans font family for the life of the current process.
/// This effectively makes it possible to look this font up using font descriptors.
///
+ (void)loadOpenSansFontFamily;
+ (nonnull UIFont *)openSansLightFontOfSize:(CGFloat)size __deprecated_msg("Use systemLightFontOfSize instead");
+ (nonnull UIFont *)openSansItalicFontOfSize:(CGFloat)size __deprecated_msg("Use systemItalicFontOfSize instead");
+ (nonnull UIFont *)openSansLightItalicFontOfSize:(CGFloat)size __deprecated_msg("Use systemLightItalicFontOfSize instead");
+ (nonnull UIFont *)openSansBoldFontOfSize:(CGFloat)size __deprecated_msg("Use systemBoldFontOfSize instead");
+ (nonnull UIFont *)openSansBoldItalicFontOfSize:(CGFloat)size __deprecated_msg("Use systemBoldItalicFontOfSize instead");
+ (nonnull UIFont *)openSansSemiBoldFontOfSize:(CGFloat)size __deprecated_msg("Use systemSemiBoldFontOfSize instead");
+ (nonnull UIFont *)openSansSemiBoldItalicFontOfSize:(CGFloat)size __deprecated_msg("Use systemSemiBoldItalicFontOfSize instead");
+ (nonnull UIFont *)openSansRegularFontOfSize:(CGFloat)size __deprecated_msg("Use systemRegularFontOfSize instead");

+ (nonnull UIFont *)systemLightFontOfSize:(CGFloat)size;
+ (nonnull UIFont *)systemItalicFontOfSize:(CGFloat)size;
+ (nonnull UIFont *)systemBoldFontOfSize:(CGFloat)size;
+ (nonnull UIFont *)systemSemiBoldFontOfSize:(CGFloat)size;
+ (nonnull UIFont *)systemRegularFontOfSize:(CGFloat)size;

/// Loads the Merriwheather font family for the life of the current process.
/// This effectively makes it possible to look this font up using font descriptors.
///
+ (void)loadMerriweatherFontFamily;
+ (nonnull UIFont *)merriweatherBoldFontOfSize:(CGFloat)size;
+ (nonnull UIFont *)merriweatherBoldItalicFontOfSize:(CGFloat)size;
+ (nonnull UIFont *)merriweatherItalicFontOfSize:(CGFloat)size;
+ (nonnull UIFont *)merriweatherLightFontOfSize:(CGFloat)size;
+ (nonnull UIFont *)merriweatherLightItalicFontOfSize:(CGFloat)size;
+ (nonnull UIFont *)merriweatherRegularFontOfSize:(CGFloat)size;

@end
