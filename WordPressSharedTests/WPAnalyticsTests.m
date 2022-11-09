#import <Quick/Quick.h>
#import <OCMock/OCMock.h>
#import "TestAnalyticsTracker.h"

// Rather than duplicate these tests for each method, we abstracted them into a set of
// shared examples and use an NSInvocation object to tell us what to call.
QuickConfigurationBegin(WPAnalyticsMethodBehavior)

+ (void)configure:(QCKConfiguration *)configuration
{
    sharedExamples(@"a WPAnalyticsTracker method", ^(QCKDSLSharedExampleContext context) {
        NSInvocation *invocation = context()[@"invocation"];
        it(@"should not be called if tracker isn't registered", ^{
            id trackerMock = OCMStrictClassMock([TestAnalyticsTracker class]);
            id expectation = [trackerMock reject];
            [invocation invokeWithTarget:expectation];
            [trackerMock verify];
        });

        it(@"should be called if tracker is registered", ^{
            id trackerMock = OCMStrictClassMock([TestAnalyticsTracker class]);
            id expectation = [trackerMock expect];
            [invocation invokeWithTarget:expectation];
            [invocation invokeWithTarget:trackerMock];
            [trackerMock verify];
        });

        it(@"should be called on multiple trackers if registered", ^{
            id trackerMock = OCMStrictClassMock([TestAnalyticsTracker class]);
            id trackerMock2 = OCMStrictClassMock([TestAnalyticsTracker class]);
            id expectation = [trackerMock expect];
            id expectation2 = [trackerMock2 expect];
            [invocation invokeWithTarget:expectation];
            [invocation invokeWithTarget:expectation2];
            [invocation invokeWithTarget:trackerMock];
            [invocation invokeWithTarget:trackerMock2];
            [trackerMock verify];
            [trackerMock2 verify];
        });
    });
}

QuickConfigurationEnd

QuickSpecBegin(WPAnalyticsSpecs)

beforeEach(^{
    [WPAnalytics clearTrackers];
});

describe(@"beginSession", ^{
    NSMethodSignature *signature = [TestAnalyticsTracker instanceMethodSignatureForSelector:@selector(beginSession)];
    NSInvocation *invocation  = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:@selector(beginSession)];

    itBehavesLike(@"a WPAnalyticsTracker method", ^{ return @{@"invocation": invocation}; });
});

describe(@"endSession", ^{
    NSMethodSignature *signature = [TestAnalyticsTracker instanceMethodSignatureForSelector:@selector(endSession)];
    NSInvocation *invocation  = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:@selector(endSession)];
    
    itBehavesLike(@"a WPAnalyticsTracker method", ^{ return @{@"invocation": invocation}; });
});

describe(@"refreshMetadata", ^{
    NSMethodSignature *signature = [TestAnalyticsTracker instanceMethodSignatureForSelector:@selector(refreshMetadata)];
    NSInvocation *invocation  = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:@selector(refreshMetadata)];
    
    itBehavesLike(@"a WPAnalyticsTracker method", ^{ return @{@"invocation": invocation}; });
});

describe(@"beginTimerForStat:", ^{
    NSMethodSignature *signature = [TestAnalyticsTracker instanceMethodSignatureForSelector:@selector(beginTimerForStat:)];
    NSInvocation *invocation  = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:@selector(beginTimerForStat:)];
    WPAnalyticsStat stat = WPAnalyticsStatApplicationOpened;
    [invocation setArgument:&stat atIndex:2];
    
    itBehavesLike(@"a WPAnalyticsTracker method", ^{ return @{@"invocation": invocation}; });
});

describe(@"endTimerForStat:withProperties", ^{
    NSMethodSignature *signature = [TestAnalyticsTracker instanceMethodSignatureForSelector:@selector(endTimerForStat:withProperties:)];
    NSInvocation *invocation  = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:@selector(endTimerForStat:withProperties:)];
    
    WPAnalyticsStat stat = WPAnalyticsStatApplicationOpened;
    NSDictionary *dict = @{};
    [invocation setArgument:&stat atIndex:2];
    [invocation setArgument:&dict atIndex:3];
    
    itBehavesLike(@"a WPAnalyticsTracker method", ^{ return @{@"invocation": invocation}; });
});

describe(@"track:", ^{
    NSMethodSignature *signature = [TestAnalyticsTracker instanceMethodSignatureForSelector:@selector(track:)];
    NSInvocation *invocation  = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:@selector(track:)];
    WPAnalyticsStat stat = WPAnalyticsStatApplicationOpened;
    [invocation setArgument:&stat atIndex:2];
    
    itBehavesLike(@"a WPAnalyticsTracker method", ^{ return @{@"invocation": invocation}; });
});

describe(@"track:withProperties:", ^{
    NSMethodSignature *signature = [TestAnalyticsTracker instanceMethodSignatureForSelector:@selector(track:withProperties:)];
    NSInvocation *invocation  = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:@selector(track:withProperties:)];
    
    WPAnalyticsStat stat = WPAnalyticsStatApplicationOpened;
    NSDictionary *dict = @{};
    [invocation setArgument:&stat atIndex:2];
    [invocation setArgument:&dict atIndex:3];
    
    itBehavesLike(@"a WPAnalyticsTracker method", ^{ return @{@"invocation": invocation}; });
});

describe(@"trackString:", ^{
    NSMethodSignature *signature = [TestAnalyticsTracker instanceMethodSignatureForSelector:@selector(trackString:)];
    NSInvocation *invocation  = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:@selector(trackString:)];
    NSString *event = @"my_event";
    [invocation setArgument:&event atIndex:2];

    itBehavesLike(@"a WPAnalyticsTracker method", ^{ return @{@"invocation": invocation}; });
});

describe(@"trackString:withProperties:", ^{
    NSMethodSignature *signature = [TestAnalyticsTracker instanceMethodSignatureForSelector:@selector(trackString:withProperties:)];
    NSInvocation *invocation  = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:@selector(trackString:withProperties:)];

    NSString *event = @"my_event";
    NSDictionary *dict = @{};
    [invocation setArgument:&event atIndex:2];
    [invocation setArgument:&dict atIndex:3];

    itBehavesLike(@"a WPAnalyticsTracker method", ^{ return @{@"invocation": invocation}; });
});

QuickSpecEnd
