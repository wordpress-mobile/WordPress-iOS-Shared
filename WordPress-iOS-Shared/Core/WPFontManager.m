#import "WPFontManager.h"
#import "WPSharedLoggingPrivate.h"
#import <CoreText/CoreText.h>

@implementation WPFontManager

static NSString * const SharedBundle = @"WordPress-iOS-Shared.bundle";
static NSString * const FontTypeTTF = @"ttf";
static NSString * const FontTypeOTF = @"otf";

#pragma mark - Open Sans Fonts

static NSString* const OpenSansLightFontName = @"OpenSans-Light";
static NSString* const OpenSansItalicFontName = @"OpenSans-Italic";
static NSString* const OpenSansLightItalicFontName = @"OpenSans-LightItalic";
static NSString* const OpenSansBoldFontName = @"OpenSans-Bold";
static NSString* const OpenSansBoldItalicFontName = @"OpenSans-BoldItalic";
static NSString* const OpenSansSemiBoldFontName = @"OpenSans-Semibold";
static NSString* const OpenSansSemiboldItalicFontName = @"OpenSans-SemiboldItalic";
static NSString* const OpenSansRegularFontName = @"OpenSans-Regular";

/// Loads the OpenSans font family for the life of the current process.
/// This effectively makes it possible to look this font up using font descriptors.
///
+ (void)loadOpenSansFontFamily
{
    [self loadFontResourceNamed:OpenSansLightFontName withExtension:FontTypeTTF];
    [self loadFontResourceNamed:OpenSansItalicFontName withExtension:FontTypeTTF];
    [self loadFontResourceNamed:OpenSansLightItalicFontName withExtension:FontTypeTTF];
    [self loadFontResourceNamed:OpenSansBoldFontName withExtension:FontTypeTTF];
    [self loadFontResourceNamed:OpenSansBoldItalicFontName withExtension:FontTypeTTF];
    [self loadFontResourceNamed:OpenSansSemiBoldFontName withExtension:FontTypeTTF];
    [self loadFontResourceNamed:OpenSansSemiboldItalicFontName withExtension:FontTypeTTF];
    [self loadFontResourceNamed:OpenSansRegularFontName withExtension:FontTypeTTF];
}

+ (UIFont *)openSansLightFontOfSize:(CGFloat)size
{
    NSString *resourceName = @"OpenSans-Light";
    NSString *fontName = @"OpenSans-Light";
    return [self fontNamed:fontName resourceName:resourceName fontType:FontTypeTTF size:size];
}

+ (UIFont *)openSansItalicFontOfSize:(CGFloat)size
{
    NSString *resourceName = @"OpenSans-Italic";
    NSString *fontName = @"OpenSans-Italic";
    return [self fontNamed:fontName resourceName:resourceName fontType:FontTypeTTF size:size];
}

+ (UIFont *)openSansLightItalicFontOfSize:(CGFloat)size
{
    NSString *resourceName = @"OpenSans-LightItalic";
    NSString *fontName = @"OpenSans-LightItalic";
    return [self fontNamed:fontName resourceName:resourceName fontType:FontTypeTTF size:size];
}

+ (UIFont *)openSansBoldFontOfSize:(CGFloat)size
{
    NSString *resourceName = @"OpenSans-Bold";
    NSString *fontName = @"OpenSans-Bold";
    return [self fontNamed:fontName resourceName:resourceName fontType:FontTypeTTF size:size];
}

+ (UIFont *)openSansBoldItalicFontOfSize:(CGFloat)size
{
    NSString *resourceName = @"OpenSans-BoldItalic";
    NSString *fontName = @"OpenSans-BoldItalic";
    return [self fontNamed:fontName resourceName:resourceName fontType:FontTypeTTF size:size];
}

+ (UIFont *)openSansSemiBoldFontOfSize:(CGFloat)size
{
    NSString *resourceName = @"OpenSans-Semibold";
    NSString *fontName = @"OpenSans-Semibold";
    return [self fontNamed:fontName resourceName:resourceName fontType:FontTypeTTF size:size];
}

+ (UIFont *)openSansSemiBoldItalicFontOfSize:(CGFloat)size
{
    NSString *resourceName = @"OpenSans-SemiboldItalic";
    NSString *fontName = @"OpenSans-SemiboldItalic";
    return [self fontNamed:fontName resourceName:resourceName fontType:FontTypeTTF size:size];
}

+ (UIFont *)openSansRegularFontOfSize:(CGFloat)size
{
    NSString *resourceName = @"OpenSans-Regular";
    NSString *fontName = @"OpenSans";
    return [self fontNamed:fontName resourceName:resourceName fontType:FontTypeTTF size:size];
}

#pragma mark - System Fonts

+ (UIFont *)systemLightFontOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightLight];
}

+ (UIFont *)systemItalicFontOfSize:(CGFloat)size
{
    return [UIFont italicSystemFontOfSize:size];
}

+ (UIFont *)systemBoldFontOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightBold];
}

+ (UIFont *)systemSemiBoldFontOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightSemibold];
}

+ (UIFont *)systemRegularFontOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightRegular];
}

#pragma mark - Merryweather Fonts

static NSString* const MerriweatherBoldFontName = @"Merriweather-Bold";
static NSString* const MerriweatherBoldItalicFontName = @"Merriweather-BoldItalic";
static NSString* const MerriweatherItalicFontName = @"Merriweather-Italic";
static NSString* const MerriweatherLightFontName = @"Merriweather-Light";
static NSString* const MerriweatherLightItalicFontName = @"Merriweather-LightItalic";
static NSString* const MerriweatherRegularFontName = @"Merriweather-Regular";

/// Loads the Merriwheather font family for the life of the current process.
/// This effectively makes it possible to look this font up using font descriptors.
///
+ (void)loadMerriweatherFontFamily
{
    [self loadFontResourceNamed:MerriweatherBoldFontName withExtension:FontTypeTTF];
    [self loadFontResourceNamed:MerriweatherBoldItalicFontName withExtension:FontTypeTTF];
    [self loadFontResourceNamed:MerriweatherItalicFontName withExtension:FontTypeTTF];
    [self loadFontResourceNamed:MerriweatherLightFontName withExtension:FontTypeTTF];
    [self loadFontResourceNamed:MerriweatherLightItalicFontName withExtension:FontTypeTTF];
    [self loadFontResourceNamed:MerriweatherRegularFontName withExtension:FontTypeTTF];
}

+ (UIFont *)merriweatherBoldFontOfSize:(CGFloat)size
{
    NSString *resourceName = @"Merriweather-Bold";
    NSString *fontName = @"Merriweather-Bold";
    return [self fontNamed:fontName resourceName:resourceName fontType:FontTypeTTF size:size];
}

+ (UIFont *)merriweatherBoldItalicFontOfSize:(CGFloat)size;
{
    NSString *resourceName = @"Merriweather-BoldItalic";
    NSString *fontName = @"Merriweather-BoldItalic";
    return [self fontNamed:fontName resourceName:resourceName fontType:FontTypeTTF size:size];
}

+ (UIFont *)merriweatherItalicFontOfSize:(CGFloat)size;
{
    NSString *resourceName = @"Merriweather-Italic";
    NSString *fontName = @"Merriweather-Italic";
    return [self fontNamed:fontName resourceName:resourceName fontType:FontTypeTTF size:size];
}

+ (UIFont *)merriweatherLightFontOfSize:(CGFloat)size;
{
    NSString *resourceName = @"Merriweather-Light";
    NSString *fontName = @"Merriweather-Light";
    return [self fontNamed:fontName resourceName:resourceName fontType:FontTypeTTF size:size];
}

+ (UIFont *)merriweatherLightItalicFontOfSize:(CGFloat)size
{
    NSString *resourceName = @"Merriweather-LightItalic";
    NSString *fontName = @"Merriweather-LightItalic";
    return [self fontNamed:fontName resourceName:resourceName fontType:FontTypeTTF size:size];
}

+ (UIFont *)merriweatherRegularFontOfSize:(CGFloat)size
{
    NSString *resourceName = @"Merriweather-Regular";
    NSString *fontName = @"Merriweather";
    return [self fontNamed:fontName resourceName:resourceName fontType:FontTypeTTF size:size];
}


#pragma mark - Private Methods

+ (UIFont *)fontNamed:(NSString *)fontName resourceName:(NSString *)resourceName fontType:(NSString *)fontType size:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:fontName size:size];
    if (!font) {
        [[self class] loadFontResourceNamed:resourceName withExtension:fontType];
        font = [UIFont fontWithName:fontName size:size];

        // safe fallback
        if (!font) {
            font = [UIFont systemFontOfSize:size];
        }
    }

    return font;
}

+ (void)loadFontResourceNamed:(NSString *)name withExtension:(NSString *)extension
{
    NSString *resourceName = [NSString stringWithFormat:@"%@/%@", SharedBundle, name];
    NSURL *url = [[NSBundle bundleForClass:self] URLForResource:resourceName withExtension:extension];

    CFErrorRef error;
    if (!CTFontManagerRegisterFontsForURL((CFURLRef)url, kCTFontManagerScopeProcess, &error)) {
        CFStringRef errorDescription = CFErrorCopyDescription(error);
        DDLogError(@"Failed to load font: %@", errorDescription);
        CFRelease(errorDescription);
    }

    return;
}

@end
