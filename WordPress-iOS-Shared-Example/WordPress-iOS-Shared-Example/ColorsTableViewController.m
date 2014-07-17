#import "ColorsTableViewController.h"
#import <WordPress-iOS-Shared/WPStyleGuide.h>

@interface ColorsTableViewController ()

@property (nonatomic, strong) NSArray *colors;

@end

@interface ColorDetails : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *color;

+ (instancetype)initWithTitle:(NSString *)title andColor:(UIColor *)color;

@end

@implementation ColorDetails

+ (instancetype)initWithTitle:(NSString *)title andColor:(UIColor *)color {
    ColorDetails *colorDetails = [[[self class] alloc] init];
    colorDetails.title = title;
    colorDetails.color = color;
    return colorDetails;
}

@end

@implementation ColorsTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = NSLocalizedString(@"Colors", nil);
        self.colors = @[
                        [ColorDetails initWithTitle:NSLocalizedString(@"WordPress Blue", nil) andColor:[WPStyleGuide wordPressBlue]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Base Lighter Blue", nil) andColor:[WPStyleGuide baseLighterBlue]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Base Darker Blue", nil) andColor:[WPStyleGuide baseDarkerBlue]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Light Blue", nil) andColor:[WPStyleGuide lightBlue]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"New Kid on the Block Blue", nil) andColor:[WPStyleGuide newKidOnTheBlockBlue]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Midnight Blue", nil) andColor:[WPStyleGuide midnightBlue]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Jazzy Orange", nil) andColor:[WPStyleGuide jazzyOrange]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Fire Orange", nil) andColor:[WPStyleGuide fireOrange]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Big Eddie Grey", nil) andColor:[WPStyleGuide bigEddieGrey]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Little Eddie Grey", nil) andColor:[WPStyleGuide littleEddieGrey]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Whisper Grey", nil) andColor:[WPStyleGuide whisperGrey]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"All T All Shade Grey", nil) andColor:[WPStyleGuide allTAllShadeGrey]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Read Grey", nil) andColor:[WPStyleGuide readGrey]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"It's Everywhere Grey", nil) andColor:[WPStyleGuide itsEverywhereGrey]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Dark As Night Grey", nil) andColor:[WPStyleGuide darkAsNightGrey]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Text Field Placeholder Grey", nil) andColor:[WPStyleGuide textFieldPlaceholderGrey]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Validation Error Red", nil) andColor:[WPStyleGuide validationErrorRed]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Stats Lighter Blue", nil) andColor:[WPStyleGuide statsLighterBlue]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Stats Darker Blue", nil) andColor:[WPStyleGuide statsDarkerBlue]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Table View Action Color", nil) andColor:[WPStyleGuide tableViewActionColor]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Button Action Color", nil) andColor:[WPStyleGuide buttonActionColor]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Keyboard Color", nil) andColor:[WPStyleGuide keyboardColor]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Notifiations Light Grey", nil) andColor:[WPStyleGuide notificationsLightGrey]],
                        [ColorDetails initWithTitle:NSLocalizedString(@"Notifiations Dark Grey", nil) andColor:[WPStyleGuide notificationsDarkGrey]],
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
    ColorDetails *colorDetails = [self.colors objectAtIndex:indexPath.row];
    cell.textLabel.text = colorDetails.title;
    cell.backgroundColor = colorDetails.color;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
