#import "WPFontManager.h"
#import <CoreText/CoreText.h>

@implementation WPFontManager

static NSString * const kBundle = @"WordPress-iOS-Shared.bundle";

+ (UIFont *)openSansLightFontOfSize:(CGFloat)size
{
    NSString *fontName = @"OpenSans-Light";
    UIFont *font = [UIFont fontWithName:fontName size:size];
    if (!font) {
        [[self class] dynamicallyLoadFontNamed:fontName];
        font = [UIFont fontWithName:fontName size:size];
        
        // safe fallback
        if (!font) font = [UIFont systemFontOfSize:size];
    }
    
    return font;
}

+ (UIFont *)openSansItalicFontOfSize:(CGFloat)size
{
    NSString *fontName = @"OpenSans-Italic";
    UIFont *font = [UIFont fontWithName:fontName size:size];
    if (!font) {
        [[self class] dynamicallyLoadFontNamed:fontName];
        font = [UIFont fontWithName:fontName size:size];
        
        // safe fallback
        if (!font) font = [UIFont systemFontOfSize:size];
    }
    
    return font;
}

+ (UIFont *)openSansLightItalicFontOfSize:(CGFloat)size
{
    NSString *fontName = @"OpenSans-LightItalic";
    UIFont *font = [UIFont fontWithName:fontName size:size];
    if (!font) {
        [[self class] dynamicallyLoadFontNamed:fontName];
        font = [UIFont fontWithName:fontName size:size];
        
        // safe fallback
        if (!font) font = [UIFont systemFontOfSize:size];
    }
    
    return font;
}

+ (UIFont *)openSansBoldFontOfSize:(CGFloat)size
{
    NSString *fontName = @"OpenSans-Bold";
    UIFont *font = [UIFont fontWithName:fontName size:size];
    if (!font) {
        [[self class] dynamicallyLoadFontNamed:fontName];
        font = [UIFont fontWithName:fontName size:size];
        
        // safe fallback
        if (!font) font = [UIFont systemFontOfSize:size];
    }
    
    return font;
}

+ (UIFont *)openSansBoldItalicFontOfSize:(CGFloat)size
{
    NSString *fontName = @"OpenSans-BoldItalic";
    UIFont *font = [UIFont fontWithName:fontName size:size];
    if (!font) {
        [[self class] dynamicallyLoadFontNamed:fontName];
        font = [UIFont fontWithName:fontName size:size];
        
        // safe fallback
        if (!font) font = [UIFont systemFontOfSize:size];
    }
    
    return font;
}

+ (UIFont *)openSansRegularFontOfSize:(CGFloat)size
{
    NSString *fontName = @"OpenSans-Regular";
    UIFont *font = [UIFont fontWithName:fontName size:size];
    if (!font) {
        [[self class] dynamicallyLoadFontNamed:fontName];
        font = [UIFont fontWithName:fontName size:size];
        
        // safe fallback
        if (!font) font = [UIFont systemFontOfSize:size];
    }
    
    return font;
}

+ (void)dynamicallyLoadFontNamed:(NSString *)name
{
    NSString *resourceName = [NSString stringWithFormat:@"%@/%@", kBundle, name];
    NSURL *url = [[NSBundle mainBundle] URLForResource:resourceName withExtension:@"ttf"];
    NSData *fontData = [NSData dataWithContentsOfURL:url];
    
    if (fontData) {
        CFErrorRef error;
        CGDataProviderRef provider = CGDataProviderCreateWithCFData((CFDataRef)fontData);
        CGFontRef font = CGFontCreateWithDataProvider(provider);
        if (!CTFontManagerRegisterGraphicsFont(font, &error)) {
            CFStringRef errorDescription = CFErrorCopyDescription(error);
            DDLogError(@"Failed to load font: %@", errorDescription);
            CFRelease(errorDescription);
        }
        CFRelease(font);
        CFRelease(provider);
    }
}
@end
