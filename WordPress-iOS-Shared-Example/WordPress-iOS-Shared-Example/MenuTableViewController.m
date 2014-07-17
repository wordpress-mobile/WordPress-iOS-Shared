#import "MenuTableViewController.h"

@interface MenuTableViewController ()

@property (nonatomic, strong) NSArray *menuItems;

@end

@implementation MenuTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.menuItems = @[NSLocalizedString(@"Fonts", nil) , NSLocalizedString(@"Colors", nil)];
        self.title = NSLocalizedString(@"WordPress iOS Shared Entities", nil);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MenuCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell" forIndexPath:indexPath];
    cell.textLabel.text = self.menuItems[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"FontsSegue" sender:nil];
    } else {
        [self performSegueWithIdentifier:@"ColorsSegue" sender:nil];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
