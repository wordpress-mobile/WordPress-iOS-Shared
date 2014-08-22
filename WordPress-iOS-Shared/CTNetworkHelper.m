#import "CTNetworkHelper.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <Reachability.h>

@interface CTNetworkHelper () {
    CTTelephonyNetworkInfo *_telephonyInfo;
}

@end

@implementation CTNetworkHelper

+ (id)sharedNetworkHelper
{
    static CTNetworkHelper *sharedHelper = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedHelper = [[self alloc] init];
    });

    return sharedHelper;
}

- (id)init
{
    if (self = [super init]) {
        _telephonyInfo = [CTTelephonyNetworkInfo new];
        [self updateMaxConcurrentDownloadsForCurrentConnection:_telephonyInfo];

        [NSNotificationCenter.defaultCenter addObserverForName:CTRadioAccessTechnologyDidChangeNotification
                                                        object:nil
                                                         queue:nil
                                                    usingBlock:^(NSNotification *note)
         {
             [self updateMaxConcurrentDownloadsForCurrentConnection:_telephonyInfo];
         }];
    }

    return self;
}

#pragma mark - Private Methods

- (void)updateMaxConcurrentDownloadsForCurrentConnection:(CTTelephonyNetworkInfo *)telephonyInfo
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];

    // if all else fails, set maxConcurrentDownloads to 5
    self.maxConcurrentDownloads = 5;

    if (networkStatus == NotReachable) {
            self.maxConcurrentDownloads = 0;
    } else if (networkStatus == ReachableViaWiFi) {
            self.maxConcurrentDownloads = 10;
    } else if (networkStatus == ReachableViaWWAN) {
            // Comparison of wireless data standards:
            // http://en.wikipedia.org/wiki/Comparison_of_wireless_data_standards#Peak_bit_rate_and_throughput

            NSString *currentRadioAccessTechnology = telephonyInfo.currentRadioAccessTechnology;
            if ([currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyGPRS] ||
                [currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMA1x] ||
                [currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyWCDMA] ||
                [currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyEdge])
            {
                // <1Mb/s
                self.maxConcurrentDownloads = 3;
            } else if ([currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMAEVDORev0] ||
                       [currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMAEVDORevA] ||
                       [currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMAEVDORevB])
            {
                // 1Mb/s to 5Mb/s
                self.maxConcurrentDownloads = 5;
            } else if ([currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyHSDPA] ||
                       [currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyHSUPA])
            {
                // 5Mb/s to 15Mb/s
                self.maxConcurrentDownloads = 7;
            } else {
                // >15Mb/s or no cell radio connection
                self.maxConcurrentDownloads = 10;
            }
    } else {
        NSAssert(true, @"should never get here");
    }
}

@end
