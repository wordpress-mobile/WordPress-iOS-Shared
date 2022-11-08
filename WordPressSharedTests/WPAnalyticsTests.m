#import <Quick/Quick.h>
#import <OCMock/OCMock.h>
#import "TestAnalyticsTracker.h"

typedef void *(^WPAnalyticsMethodBehaviorInvocation)(id<WPAnalyticsTracker>);

// Rather than duplicate these tests for each method, we abstracted them into a set of
// shared examples and use an NSInvocation object to tell us what to call.
QuickConfigurationBegin(WPAnalyticsMethodBehavior)

+ (void)configure:(QCKConfiguration *)configuration
{
    sharedExamples(@"a WPAnalyticsTracker method", ^(QCKDSLSharedExampleContext context) {
        WPAnalyticsMethodBehaviorInvocation invocation = context()[@"invocation"];
        it(@"should not be called if tracker isn't registered", ^{
            id trackerMock = OCMStrictClassMock([TestAnalyticsTracker class]);
            id expectation = [trackerMock reject];
            invocation(expectation);
            [trackerMock verify];
        });

        it(@"should be called if tracker is registered", ^{
            id trackerMock = OCMStrictClassMock([TestAnalyticsTracker class]);
            id expectation = [trackerMock expect];
            invocation(expectation);
            invocation(trackerMock);
            [trackerMock verify];
        });

        it(@"should be called on multiple trackers if registered", ^{
            id trackerMock = OCMStrictClassMock([TestAnalyticsTracker class]);
            id trackerMock2 = OCMStrictClassMock([TestAnalyticsTracker class]);
            id expectation = [trackerMock expect];
            id expectation2 = [trackerMock2 expect];
            invocation(expectation);
            invocation(expectation2);
            invocation(trackerMock);
            invocation(trackerMock2);
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
    itBehavesLike(@"a WPAnalyticsTracker method", ^{
        return @{
            @"invocation": ^(id<WPAnalyticsTracker> tracker){
                [tracker beginSession];
            }
        };
    });
});

describe(@"endSession", ^{
    itBehavesLike(@"a WPAnalyticsTracker method", ^{
        return @{
            @"invocation": ^(id<WPAnalyticsTracker> tracker){
                [tracker endSession];
            }
        };
    });
});

describe(@"refreshMetadata", ^{
    itBehavesLike(@"a WPAnalyticsTracker method", ^{
        return @{
            @"invocation": ^(id<WPAnalyticsTracker> tracker){
                [tracker refreshMetadata];
            }
        };
    });
});

describe(@"beginTimerForStat:", ^{
    itBehavesLike(@"a WPAnalyticsTracker method", ^{
        return @{
            @"invocation": ^(id<WPAnalyticsTracker> tracker){
                [tracker beginTimerForStat:WPAnalyticsStatApplicationOpened];
            }
        };
    });
});

describe(@"endTimerForStat:withProperties", ^{
    itBehavesLike(@"a WPAnalyticsTracker method", ^{
        return @{
            @"invocation": ^(id<WPAnalyticsTracker> tracker){
                [tracker endTimerForStat:WPAnalyticsStatApplicationOpened withProperties:@{}];
            }
        };
    });
});

describe(@"track:", ^{
    itBehavesLike(@"a WPAnalyticsTracker method", ^{
        return @{
            @"invocation": ^(id<WPAnalyticsTracker> tracker){
                [tracker track:WPAnalyticsStatApplicationOpened];
            }
        };
    });
});

describe(@"track:withProperties:", ^{
    itBehavesLike(@"a WPAnalyticsTracker method", ^{
        return @{
            @"invocation": ^(id<WPAnalyticsTracker> tracker){
                [tracker track:WPAnalyticsStatApplicationOpened withProperties:@{}];
            }
        };

    });
});

describe(@"trackString:", ^{
    itBehavesLike(@"a WPAnalyticsTracker method", ^{
        return @{
            @"invocation": ^(id<WPAnalyticsTracker> tracker){
                [tracker trackString:@"my_event"];
            }
        };
    });
});

describe(@"trackString:withProperties:", ^{
    itBehavesLike(@"a WPAnalyticsTracker method", ^{
        return @{
            @"invocation": ^(id<WPAnalyticsTracker> tracker){
                [tracker trackString:@"my_event" withProperties:@{}];
            }
        };
    });
});

QuickSpecEnd
