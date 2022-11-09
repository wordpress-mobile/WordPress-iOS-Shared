#import <Foundation/Foundation.h>
#import "WPAnalytics.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestAnalyticsTracker : NSObject<WPAnalyticsTracker>

- (void)track:(WPAnalyticsStat)stat;
- (void)track:(WPAnalyticsStat)stat withProperties:(NSDictionary *)properties;

- (void)beginSession;
- (void)endSession;
- (void)refreshMetadata;

@end

typedef void (^WPAnalyticsMethodBehaviorInvocation)(id<WPAnalyticsTracker>);

FOUNDATION_EXTERN void WPAnalyticsTestVerifyUnregistered(WPAnalyticsMethodBehaviorInvocation invocation);
FOUNDATION_EXTERN void WPAnalyticsTestVerifyRegistered(WPAnalyticsMethodBehaviorInvocation invocation);
FOUNDATION_EXTERN void WPAnalyticsTestVerifyMultipleTrackers(WPAnalyticsMethodBehaviorInvocation invocation);

NS_ASSUME_NONNULL_END
