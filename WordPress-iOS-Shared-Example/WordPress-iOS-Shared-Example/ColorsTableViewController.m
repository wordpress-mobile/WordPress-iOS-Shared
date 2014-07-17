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
                        [TitleAndColor initWithTitle:@"WordPress Blue" andColor:[WPStyleGuide wordPressBlue]],
                        [TitleAndColor initWithTitle:@"Base Lighter Blue" andColor:[WPStyleGuide baseLighterBlue]],
                        [TitleAndColor initWithTitle:@"Base Darker Blue" andColor:[WPStyleGuide baseDarkerBlue]],
                        [TitleAndColor initWithTitle:@"Light Blue" andColor:[WPStyleGuide lightBlue]],
                        [TitleAndColor initWithTitle:@"New Kid on the Block Blue" andColor:[WPStyleGuide newKidOnTheBlockBlue]],
                        [TitleAndColor initWithTitle:@"Midnight Blue" andColor:[WPStyleGuide midnightBlue]],
                        [TitleAndColor initWithTitle:@"Jazzy Orange" andColor:[WPStyleGuide jazzyOrange]],
                        [TitleAndColor initWithTitle:@"Fire Orange" andColor:[WPStyleGuide fireOrange]],
                        [TitleAndColor initWithTitle:@"Big Eddie Grey" andColor:[WPStyleGuide bigEddieGrey]],
                        [TitleAndColor initWithTitle:@"Little Eddie Grey" andColor:[WPStyleGuide littleEddieGrey]],
                        [TitleAndColor initWithTitle:@"Whisper Grey" andColor:[WPStyleGuide whisperGrey]],
                        [TitleAndColor initWithTitle:@"All T All Shade Grey" andColor:[WPStyleGuide allTAllShadeGrey]],
                        [TitleAndColor initWithTitle:@"Read Grey" andColor:[WPStyleGuide readGrey]],
                        [TitleAndColor initWithTitle:@"It's Everywhere Grey" andColor:[WPStyleGuide itsEverywhereGrey]],
                        [TitleAndColor initWithTitle:@"Dark As Night Grey" andColor:[WPStyleGuide darkAsNightGrey]],
                        [TitleAndColor initWithTitle:@"Text Field Placeholder Grey" andColor:[WPStyleGuide textFieldPlaceholderGrey]],
                        [TitleAndColor initWithTitle:@"Validation Error Red" andColor:[WPStyleGuide validationErrorRed]],
                        [TitleAndColor initWithTitle:@"Stats Lighter Blue" andColor:[WPStyleGuide statsLighterBlue]],
                        [TitleAndColor initWithTitle:@"Stats Darker Blue" andColor:[WPStyleGuide statsDarkerBlue]],
                        [TitleAndColor initWithTitle:@"Table View Action Color" andColor:[WPStyleGuide tableViewActionColor]],
                        [TitleAndColor initWithTitle:@"Button Action Color" andColor:[WPStyleGuide buttonActionColor]],
                        [TitleAndColor initWithTitle:@"Keyboard Color" andColor:[WPStyleGuide keyboardColor]],
                        [TitleAndColor initWithTitle:@"Notifiations Light Grey" andColor:[WPStyleGuide notificationsLightGrey]],
                        [TitleAndColor initWithTitle:@"Notifiations Dark Grey" andColor:[WPStyleGuide notificationsDarkGrey]],
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
