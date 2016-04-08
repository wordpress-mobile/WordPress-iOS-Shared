#import "FontsTableViewController.h"
#import "FontTableViewCell.h"
#import <WordPressShared/WPStyleGuide.h>
#import <WordPressShared/WPFontManager.h>

static const CGFloat FontSize = 20.0;

@interface FontsTableViewController ()

@property (nonatomic, strong) NSMutableArray *fonts;

@end

@interface FontDetails : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) NSDictionary *attributes;

+ (instancetype)initWithTitle:(NSString *)title andFont:(UIFont *)font andAttributes:(NSDictionary *)attributes;

@end

@implementation FontDetails

+ (instancetype)initWithTitle:(NSString *)title andFont:(UIFont *)font andAttributes:(NSDictionary *)attributes {
    FontDetails *fontDetails = [[self class] new];
    fontDetails.title = title;
    fontDetails.font = font;
    fontDetails.attributes = attributes;
    return fontDetails;
}

@end

@implementation FontsTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = NSLocalizedString(@"Fonts", nil);
        self.fonts = [NSMutableArray array];
        for (NSDictionary *font in [self fontDetails]) {
            NSDictionary *attributes = font[@"attributes"] == [NSNull null] ? nil : font[@"attributes"];
            [self.fonts addObject:[FontDetails initWithTitle:font[@"title"] andFont:font[@"font"] andAttributes:attributes]];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.fonts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FontTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FontsCell" forIndexPath:indexPath];
    FontDetails *fontDetails = self.fonts[indexPath.row];
    cell.title.text = fontDetails.title;
    if ([fontDetails.attributes count] > 0) {
        cell.title.attributedText = [[NSAttributedString alloc] initWithString:fontDetails.title attributes:fontDetails.attributes];
    }
    cell.title.font = fontDetails.font;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - Private Methods

- (NSArray *)fontDetails {
    return @[
             @{@"title": NSLocalizedString(@"Merriweather",nil), @"font": [WPFontManager merriweatherRegularFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"Merriweather Bold",nil), @"font": [WPFontManager merriweatherBoldFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"Merriweather Bold Italic",nil), @"font": [WPFontManager merriweatherBoldItalicFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"Merriweather Italic",nil), @"font": [WPFontManager merriweatherItalicFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"Merriweather Light",nil), @"font": [WPFontManager merriweatherLightFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"Merriweather Italic",nil), @"font": [WPFontManager merriweatherLightItalicFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"OpenSans",nil), @"font": [WPFontManager openSansRegularFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"OpenSans Bold",nil), @"font": [WPFontManager openSansBoldFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"OpenSans Bold Italic",nil), @"font": [WPFontManager openSansBoldItalicFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"OpenSans Italic",nil), @"font": [WPFontManager openSansItalicFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"OpenSans Light",nil), @"font": [WPFontManager openSansLightFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"OpenSans Light Italic",nil), @"font": [WPFontManager openSansLightItalicFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"OpenSans Semi-Bold",nil), @"font": [WPFontManager openSansSemiBoldFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"OpenSans Semi-Bold Italic",nil), @"font": [WPFontManager openSansSemiBoldItalicFontOfSize:FontSize]},

             @{@"title": NSLocalizedString(@"System",nil), @"font": [WPFontManager systemRegularFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"System Bold",nil), @"font": [WPFontManager systemBoldFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"System Italic",nil), @"font": [WPFontManager systemItalicFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"System Light",nil), @"font": [WPFontManager systemLightFontOfSize:FontSize]},
             @{@"title": NSLocalizedString(@"System Semi-Bold",nil), @"font": [WPFontManager systemSemiBoldFontOfSize:FontSize]},

             @{@"title": NSLocalizedString(@"Large Post Title Font", nil), @"font": [WPStyleGuide largePostTitleFont], @"attributes": [WPStyleGuide largePostTitleAttributes]},
             @{@"title": NSLocalizedString(@"Post Title Font", nil), @"font": [WPStyleGuide postTitleFont], @"attributes": [WPStyleGuide postTitleAttributes]},
             @{@"title": NSLocalizedString(@"Post Title Font Bold", nil), @"font": [WPStyleGuide postTitleFontBold], @"attributes": [WPStyleGuide postTitleAttributesBold]},
             @{@"title": NSLocalizedString(@"Post Title Font", nil), @"font": [WPStyleGuide postTitleFont], @"attributes": [WPStyleGuide postTitleAttributes]},
             @{@"title": NSLocalizedString(@"Subtitle Font", nil), @"font": [WPStyleGuide subtitleFont], @"attributes": [WPStyleGuide subtitleAttributes]},
             @{@"title": NSLocalizedString(@"Subtitle Font Italic", nil), @"font": [WPStyleGuide subtitleFontItalic], @"attributes": [WPStyleGuide subtitleItalicAttributes]},
             @{@"title": NSLocalizedString(@"Subtitle Font Bold", nil), @"font": [WPStyleGuide subtitleFontBold], @"attributes": [WPStyleGuide subtitleAttributesBold]},
             @{@"title": NSLocalizedString(@"Label Font", nil), @"font": [WPStyleGuide labelFont], @"attributes": [WPStyleGuide labelAttributes]},
             @{@"title": NSLocalizedString(@"Label Font Normal", nil), @"font": [WPStyleGuide labelFontNormal], @"attributes": [WPStyleGuide labelAttributes]},
             @{@"title": NSLocalizedString(@"Regular Text Font", nil), @"font": [WPStyleGuide regularTextFont], @"attributes": [WPStyleGuide regularTextAttributes]},
             @{@"title": NSLocalizedString(@"Regular Text Font Bold", nil), @"font": [WPStyleGuide regularTextFontBold], @"attributes": [WPStyleGuide regularTextAttributes]},
             @{@"title": NSLocalizedString(@"Regular Text Font Semibold", nil), @"font": [WPStyleGuide regularTextFontSemiBold], @"attributes": [WPStyleGuide regularTextAttributes]},
             @{@"title": NSLocalizedString(@"Tableview Text Font", nil), @"font": [WPStyleGuide tableviewTextFont], @"attributes": [NSNull null]},
             @{@"title": NSLocalizedString(@"Tableview Subtitle Font", nil), @"font": [WPStyleGuide tableviewSubtitleFont], @"attributes": [NSNull null]},
             @{@"title": NSLocalizedString(@"Tableview Section Header Font", nil), @"font": [WPStyleGuide tableviewSectionHeaderFont], @"attributes": [NSNull null]},
             ];
}

@end
