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
                       [FontDetails initWithTitle:NSLocalizedString(@"Large Post Title Font", nil) andFont:[WPStyleGuide largePostTitleFont] andAttributes:[WPStyleGuide largePostTitleAttributes]],
                       [FontDetails initWithTitle:NSLocalizedString(@"Post Title Font", nil) andFont:[WPStyleGuide postTitleFont] andAttributes:nil],
                       [FontDetails initWithTitle:NSLocalizedString(@"Post Title Font Bold", nil) andFont:[WPStyleGuide postTitleFontBold] andAttributes:[WPStyleGuide postTitleAttributes]],
                       [FontDetails initWithTitle:NSLocalizedString(@"Subtitle Font", nil) andFont:[WPStyleGuide subtitleFont] andAttributes:[WPStyleGuide subtitleAttributes]],
                       [FontDetails initWithTitle:NSLocalizedString(@"Subtitle Font Italic", nil) andFont:[WPStyleGuide subtitleFont] andAttributes:[WPStyleGuide subtitleItalicAttributes]],
                       [FontDetails initWithTitle:NSLocalizedString(@"Subtitle Font Bold", nil) andFont:[WPStyleGuide subtitleFont] andAttributes:[WPStyleGuide subtitleAttributesBold]],
                       [FontDetails initWithTitle:NSLocalizedString(@"Label Font", nil) andFont:[WPStyleGuide labelFont] andAttributes:[WPStyleGuide labelAttributes]],
                       [FontDetails initWithTitle:NSLocalizedString(@"Label Font Normal", nil) andFont:[WPStyleGuide labelFontNormal] andAttributes:[WPStyleGuide labelAttributes]],
                       [FontDetails initWithTitle:NSLocalizedString(@"Regular Text Font", nil) andFont:[WPStyleGuide regularTextFont] andAttributes:[WPStyleGuide regularTextAttributes]],
                       [FontDetails initWithTitle:NSLocalizedString(@"Regular Text Bold", nil) andFont:[WPStyleGuide regularTextFontBold] andAttributes:[WPStyleGuide regularTextAttributes]],
                       [FontDetails initWithTitle:NSLocalizedString(@"Tableview Text Font", nil) andFont:[WPStyleGuide tableviewTextFont] andAttributes:nil],
                       [FontDetails initWithTitle:NSLocalizedString(@"Tableview Subtitle Font", nil) andFont:[WPStyleGuide tableviewSubtitleFont] andAttributes:nil],
                       [FontDetails initWithTitle:NSLocalizedString(@"Tableview Section Header Font", nil) andFont:[WPStyleGuide tableviewSectionHeaderFont] andAttributes:nil],
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
