#import "FontsTableViewController.h"
#import "FontTableViewCell.h"
#import <WordPress-iOS-Shared/WPStyleGuide.h>

@interface FontsTableViewController ()

@property (nonatomic, strong) NSArray *fonts;

@end

@interface FontDetails : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) NSDictionary *attributes;

+ (instancetype)initWithTitle:(NSString *)title andFont:(UIFont *)font andAttributes:(NSDictionary *)attributes;

@end

@implementation FontDetails

+ (instancetype)initWithTitle:(NSString *)title andFont:(UIFont *)font andAttributes:(NSDictionary *)attributes {
    FontDetails *fontDetails = [[[self class] alloc] init];
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
        self.fonts = @[
                       [FontDetails initWithTitle:@"Large Post Title Font" andFont:[WPStyleGuide largePostTitleFont] andAttributes:[WPStyleGuide largePostTitleAttributes]],
                       [FontDetails initWithTitle:@"Post Title Font" andFont:[WPStyleGuide postTitleFont] andAttributes:nil],
                       [FontDetails initWithTitle:@"Post Title Font Bold" andFont:[WPStyleGuide postTitleFontBold] andAttributes:[WPStyleGuide postTitleAttributes]],
                       [FontDetails initWithTitle:@"Subtitle Font" andFont:[WPStyleGuide subtitleFont] andAttributes:[WPStyleGuide subtitleAttributes]],
                       [FontDetails initWithTitle:@"Subtitle Font Italic" andFont:[WPStyleGuide subtitleFont] andAttributes:[WPStyleGuide subtitleItalicAttributes]],
                       [FontDetails initWithTitle:@"Subtitle Font Bold" andFont:[WPStyleGuide subtitleFont] andAttributes:[WPStyleGuide subtitleAttributesBold]],
                       [FontDetails initWithTitle:@"Label Font" andFont:[WPStyleGuide labelFont] andAttributes:[WPStyleGuide labelAttributes]],
                       [FontDetails initWithTitle:@"Label Font Normal" andFont:[WPStyleGuide labelFontNormal] andAttributes:[WPStyleGuide labelAttributes]],
                       [FontDetails initWithTitle:@"Regular Text Font" andFont:[WPStyleGuide regularTextFont] andAttributes:[WPStyleGuide regularTextAttributes]],
                       [FontDetails initWithTitle:@"Regular Text Bold" andFont:[WPStyleGuide regularTextFontBold] andAttributes:[WPStyleGuide regularTextAttributes]],
                       [FontDetails initWithTitle:@"Tableview Text Font" andFont:[WPStyleGuide tableviewTextFont] andAttributes:nil],
                       [FontDetails initWithTitle:@"Tableview Subtitle Font" andFont:[WPStyleGuide tableviewSubtitleFont] andAttributes:nil],
                       [FontDetails initWithTitle:@"Tableview Section Header Font" andFont:[WPStyleGuide tableviewSectionHeaderFont] andAttributes:nil],
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
    FontDetails *fontDetails = self.fonts[indexPath.row];
    cell.title.text = fontDetails.title;
    if ([fontDetails.attributes count] > 0) {
        cell.title.attributedText = [[NSAttributedString alloc] initWithString:fontDetails.title attributes:fontDetails.attributes];
    }
    cell.title.font = fontDetails.font;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
