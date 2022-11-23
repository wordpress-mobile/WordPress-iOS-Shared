#import "WPSharedLogging.h"

static WPSharedErrorLogger wordPressSharedLogger = nil;

WPSharedErrorLogger _Nullable WPSharedGetErrorLogger(void)
{
    return wordPressSharedLogger;
}

void WPSharedSetErrorLogger(WPSharedErrorLogger _Nullable logger)
{
    wordPressSharedLogger = logger;
}

void WPSharedLogError(NSString *msg)
{
    WPSharedErrorLogger logger = WPSharedGetErrorLogger();
    if (logger != NULL) {
        logger(msg);
    } else {
        NSLog(@"[WordPress-Shared] Warning: please call `WPSharedSetErrorLogger` to set a error logger.");
    }
}
