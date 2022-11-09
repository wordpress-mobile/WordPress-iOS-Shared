#import "TestAnalyticsTracker.h"

#import <OCMock/OCMock.h>

@implementation TestAnalyticsTracker

- (void)track:(WPAnalyticsStat)stat
{
    // No-op
}

- (void)track:(WPAnalyticsStat)stat withProperties:(NSDictionary *)properties
{
    // No-op
}

- (void)beginSession
{
    // No-op
}

- (void)endSession
{
    // No-op
}

- (void)refreshMetadata
{
    // No-op
}

- (void)trackString:(NSString *)event {
    // No-op
}


- (void)trackString:(NSString *)event withProperties:(NSDictionary *)properties {
    // No-op
}


@end

void WPAnalyticsTestVerifyUnregistered(WPAnalyticsMethodBehaviorInvocation invocation) {
    id trackerMock = OCMStrictClassMock([TestAnalyticsTracker class]);
    id expectation = [trackerMock reject];
    invocation(expectation);
    [trackerMock verify];
}

void WPAnalyticsTestVerifyRegistered(WPAnalyticsMethodBehaviorInvocation invocation) {
    id trackerMock = OCMStrictClassMock([TestAnalyticsTracker class]);
    id expectation = [trackerMock expect];
    invocation(expectation);
    invocation(trackerMock);
    [trackerMock verify];
}

void WPAnalyticsTestVerifyMultipleTrackers(WPAnalyticsMethodBehaviorInvocation invocation) {
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
}
