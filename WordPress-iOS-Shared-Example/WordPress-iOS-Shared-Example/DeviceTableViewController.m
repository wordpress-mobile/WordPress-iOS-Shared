#import "DeviceTableViewController.h"
#import "DeviceTableViewCell.h"
#import "DeviceTest.h"
#import "FontTableViewCell.h"
#import <WordPress-iOS-Shared/WPDeviceIdentification.h>
#import <WordPress-iOS-Shared/WPStyleGuide.h>
#import <WordPress-iOS-Shared/WPFontManager.h>

@interface DeviceTableViewController ()

@property (nonatomic, strong) NSMutableArray *deviceTests;

@end

@implementation DeviceTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = NSLocalizedString(@"Fonts", nil);
        
        [self setupDeviceTests];
    }
    return self;
}

- (void)setupDeviceTests
{
    NSAssert(_deviceTests == nil,
             @"Device check initialized twice.");
    
    _deviceTests = [NSMutableArray array];
    
    DeviceTest* iPhone6Test = [[DeviceTest alloc] initWithTitle:@"iPhone 6"
                                                andVerification:^BOOL{
                                                    return [WPDeviceIdentification isiPhoneSix];
                                                }];
    
    DeviceTest* iPhone6PlusTest = [[DeviceTest alloc] initWithTitle:@"iPhone 6 Plus"
                                                    andVerification:^BOOL{
                                                        return [WPDeviceIdentification isiPhoneSixPlus];
                                                    }];
    
    DeviceTest* iOSEarlierThan8Test = [[DeviceTest alloc] initWithTitle:@"iOS < 8"
                                                        andVerification:^BOOL{
                                                            return [WPDeviceIdentification isiOSVersionEarlierThan8];
                                                        }];
    
    [_deviceTests addObject:iPhone6Test];
    [_deviceTests addObject:iPhone6PlusTest];
    [_deviceTests addObject:iOSEarlierThan8Test];
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
    return [self.deviceTests count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DeviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeviceCell" forIndexPath:indexPath];
    NSAssert([cell isKindOfClass:[DeviceTableViewCell class]],
             @"The cell's reuse identifier is probably wrong.");
    
    DeviceTest *deviceTest = self.deviceTests[indexPath.row];
    
    cell.title.text = deviceTest.title;
    cell.testResult.text = deviceTest.verification() ? @"YES" : @"NO";
    
    return cell;
}

@end
