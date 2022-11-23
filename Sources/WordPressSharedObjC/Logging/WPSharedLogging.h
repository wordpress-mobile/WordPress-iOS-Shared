#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^WPSharedErrorLogger)(NSString *msg);

WPSharedErrorLogger _Nullable WPSharedGetErrorLogger(void);
void WPSharedSetErrorLogger(WPSharedErrorLogger _Nullable logger);

FOUNDATION_EXTERN void WPSharedLogError(NSString *msg);

NS_ASSUME_NONNULL_END
