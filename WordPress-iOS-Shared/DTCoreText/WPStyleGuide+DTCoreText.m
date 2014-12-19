#import "WPStyleGuide+DTCoreText.h"
#import <DTCoreText/DTCoreText.h>

@implementation WPStyleGuide (DTCoreText)

+ (NSDictionary *)defaultDTCoreTextOptions
{
    NSString *defaultStyles = @"blockquote {background-color: #EEEEEE; width: 100%; display: block; padding: 8px 5px 10px 0;}";
    DTCSSStylesheet *cssStylesheet = [[DTCSSStylesheet alloc] initWithStyleBlock:defaultStyles];
    return @{
             DTDefaultFontFamily:@"Open Sans",
             DTDefaultLineHeightMultiplier:(IS_IPAD ? @1.6 : @1.4),
             DTDefaultFontSize:(IS_IPAD ? @18 : @16),
             DTDefaultTextColor:[WPStyleGuide littleEddieGrey],
             DTDefaultLinkColor:[WPStyleGuide baseLighterBlue],
             DTDefaultLinkHighlightColor:[WPStyleGuide midnightBlue],
             DTDefaultLinkDecoration:@NO,
             DTDefaultStyleSheet:cssStylesheet
             };
}

@end
