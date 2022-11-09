#import "WPSharedLogging.h"

#if SWIFT_PACKAGE
@import WordPressSharedLoggingObjCPrivate;
#else
#import "WPSharedLoggingPrivate.h"
#endif

DDLogLevel WPSharedGetLoggingLevel() {
    return ddLogLevel;
}

void WPSharedSetLoggingLevel(DDLogLevel level) {
    ddLogLevel = level;
}
