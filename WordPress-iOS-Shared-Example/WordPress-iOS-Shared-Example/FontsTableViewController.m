#import "FontsTableViewController.h"
#import "FontTableViewCell.h"
#import <WordPress-iOS-Shared/WPStyleGuide.h>

@interface FontsTableViewController ()

@property (nonatomic, strong) NSArray *fonts;

@end

@interface FontAndAttributes : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) NSDictionary *attributes;

+ (instancetype)initWithTitle:(NSString *)title andFont:(UIFont *)font andAttributes:(NSDictionary *)attributes;

@end

@implementation FontAndAttributes

+ (instancetype)initWithTitle:(NSString *)title andFont:(UIFont *)font andAttributes:(NSDictionary *)attributes {
    FontAndAttributes *fontAndAttributes = [[[self class] alloc] init];
    fontAndAttributes.title = title;
    fontAndAttributes.font = font;
    fontAndAttributes.attributes = attributes;
    return fontAndAttributes;
}

@end

@implementation FontsTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = NSLocalizedString(@"Fonts", nil);
        self.fonts = @[
                       [FontAndAttributes initWithTitle:@"Large Post Title Font" andFont:[WPStyleGuide largePostTitleFont] andAttributes:[WPStyleGuide largePostTitleAttributes]],
                       [FontAndAttributes initWithTitle:@"Post Title Font" andFont:[WPStyleGuide postTitleFont] andAttributes:nil],
                       [FontAndAttributes initWithTitle:@"Post Title Font Bold" andFont:[WPStyleGuide postTitleFontBold] andAttributes:[WPStyleGuide postTitleAttributes]],
                       [FontAndAttributes initWithTitle:@"Subtitle Font" andFont:[WPStyleGuide subtitleFont] andAttributes:[WPStyleGuide subtitleAttributes]],
                       [FontAndAttributes initWithTitle:@"Subtitle Font Italic" andFont:[WPStyleGuide subtitleFont] andAttributes:[WPStyleGuide subtitleItalicAttributes]],
                       [FontAndAttributes initWithTitle:@"Subtitle Font Bold" andFont:[WPStyleGuide subtitleFont] andAttributes:[WPStyleGuide subtitleAttributesBold]],
                       [FontAndAttributes initWithTitle:@"Label Font" andFont:[WPStyleGuide labelFont] andAttributes:[WPStyleGuide labelAttributes]],
                       [FontAndAttributes initWithTitle:@"Label Font Normal" andFont:[WPStyleGuide labelFontNormal] andAttributes:[WPStyleGuide labelAttributes]],
                       [FontAndAttributes initWithTitle:@"Regular Text Font" andFont:[WPStyleGuide regularTextFont] andAttributes:[WPStyleGuide regularTextAttributes]],
                       [FontAndAttributes initWithTitle:@"Regular Text Bold" andFont:[WPStyleGuide regularTextFontBold] andAttributes:[WPStyleGuide regularTextAttributes]],
                       [FontAndAttributes initWithTitle:@"Tableview Text Font" andFont:[WPStyleGuide tableviewTextFont] andAttributes:nil],
                       [FontAndAttributes initWithTitle:@"Tableview Subtitle Font" andFont:[WPStyleGuide tableviewSubtitleFont] andAttributes:nil],
                       [FontAndAttributes initWithTitle:@"Tableview Section Header Font" andFont:[WPStyleGuide tableviewSectionHeaderFont] andAttributes:nil],
                       ];
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
    FontAndAttributes *fontAndAttributes = self.fonts[indexPath.row];
    cell.title.text = fontAndAttributes.title;
    if ([fontAndAttributes.attributes count] > 0) {
        cell.title.attributedText = [[NSAttributedString alloc] initWithString:fontAndAttributes.title attributes:fontAndAttributes.attributes];
    }
    cell.title.font = fontAndAttributes.font;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
