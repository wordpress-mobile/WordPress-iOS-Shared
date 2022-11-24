#import "WPSharedLogging.h"

static id<WordPressLoggingDelegate> wordPressSharedLogger = nil;

id<WordPressLoggingDelegate> _Nullable WPSharedGetErrorLogger(void)
{
    return wordPressSharedLogger;
}

void WPSharedSetErrorLogger(id<WordPressLoggingDelegate> _Nullable logger)
{
    wordPressSharedLogger = logger;
}

#define WPSharedLogv(logFunc) \
    ({ \
        id<WordPressLoggingDelegate> logger = WPSharedGetErrorLogger(); \
        if (logger == NULL) { \
            NSLog(@"[WordPress-Shared] Warning: please call `WPSharedSetErrorLogger` to set a error logger."); \
            return; \
        } \
        if (![logger respondsToSelector:@selector(logFunc)]) { \
            NSLog(@"[WordPress-Shared] Warning: %@ does not implement " #logFunc, logger); \
            return; \
        } \
        [logger performSelector:@selector(logFunc) withObject:[[NSString alloc] initWithFormat:str arguments:args]]; \
    })

#define WPSharedLog(logFunc) \
    ({ \
        va_list args; \
        va_start(args, str); \
        WPSharedLogv(logFunc); \
        va_end(args); \
    })

void WPSharedLogError(NSString *str, ...)   { WPSharedLog(logError:); }
void WPSharedLogWarning(NSString *str, ...) { WPSharedLog(logWarning:); }
void WPSharedLogInfo(NSString *str, ...)    { WPSharedLog(logInfo:); }
void WPSharedLogDebug(NSString *str, ...)   { WPSharedLog(logDebug:); }
void WPSharedLogVerbose(NSString *str, ...) { WPSharedLog(logVerbose:); }

void WPSharedLogvError(NSString *str, va_list args)     { WPSharedLogv(logError:); }
void WPSharedLogvWarning(NSString *str, va_list args)   { WPSharedLogv(logWarning:); }
void WPSharedLogvInfo(NSString *str, va_list args)      { WPSharedLogv(logInfo:); }
void WPSharedLogvDebug(NSString *str, va_list args)     { WPSharedLogv(logDebug:); }
void WPSharedLogvVerbose(NSString *str, va_list args)   { WPSharedLogv(logVerbose:); }
