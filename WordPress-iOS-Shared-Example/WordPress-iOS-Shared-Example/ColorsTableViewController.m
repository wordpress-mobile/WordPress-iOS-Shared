#import "ColorsTableViewController.h"
#import <WordPress-iOS-Shared/WPStyleGuide.h>

@interface ColorsTableViewController ()

@property (nonatomic, strong) NSArray *colors;

@end

@interface TitleAndColor : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *color;

+ (instancetype)initWithTitle:(NSString *)title andColor:(UIColor *)color;

@end

@implementation TitleAndColor

+ (instancetype)initWithTitle:(NSString *)title andColor:(UIColor *)color {
    TitleAndColor *titleAndColor = [[[self class] alloc] init];
    titleAndColor.title = title;
    titleAndColor.color = color;
    return titleAndColor;
}

@end

@implementation ColorsTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = NSLocalizedString(@"Colors", nil);
        self.colors = @[
                        [TitleAndColor initWithTitle:NSLocalizedString(@"WordPress Blue", nil) andColor:[WPStyleGuide wordPressBlue]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Base Lighter Blue", nil) andColor:[WPStyleGuide baseLighterBlue]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Base Darker Blue", nil) andColor:[WPStyleGuide baseDarkerBlue]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Light Blue", nil) andColor:[WPStyleGuide lightBlue]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"New Kid on the Block Blue", nil) andColor:[WPStyleGuide newKidOnTheBlockBlue]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Midnight Blue", nil) andColor:[WPStyleGuide midnightBlue]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Jazzy Orange", nil) andColor:[WPStyleGuide jazzyOrange]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Fire Orange", nil) andColor:[WPStyleGuide fireOrange]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Big Eddie Grey", nil) andColor:[WPStyleGuide bigEddieGrey]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Little Eddie Grey", nil) andColor:[WPStyleGuide littleEddieGrey]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Whisper Grey", nil) andColor:[WPStyleGuide whisperGrey]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"All T All Shade Grey", nil) andColor:[WPStyleGuide allTAllShadeGrey]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Read Grey", nil) andColor:[WPStyleGuide readGrey]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"It's Everywhere Grey", nil) andColor:[WPStyleGuide itsEverywhereGrey]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Dark As Night Grey", nil) andColor:[WPStyleGuide darkAsNightGrey]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Text Field Placeholder Grey", nil) andColor:[WPStyleGuide textFieldPlaceholderGrey]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Validation Error Red", nil) andColor:[WPStyleGuide validationErrorRed]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Stats Lighter Blue", nil) andColor:[WPStyleGuide statsLighterBlue]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Stats Darker Blue", nil) andColor:[WPStyleGuide statsDarkerBlue]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Table View Action Color", nil) andColor:[WPStyleGuide tableViewActionColor]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Button Action Color", nil) andColor:[WPStyleGuide buttonActionColor]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Keyboard Color", nil) andColor:[WPStyleGuide keyboardColor]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Notifiations Light Grey", nil) andColor:[WPStyleGuide notificationsLightGrey]],
                        [TitleAndColor initWithTitle:NSLocalizedString(@"Notifiations Dark Grey", nil) andColor:[WPStyleGuide notificationsDarkGrey]],
                        ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    TitleAndColor *titleAndColor = [self.colors objectAtIndex:indexPath.row];
    cell.textLabel.text = titleAndColor.title;
    cell.backgroundColor = titleAndColor.color;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
