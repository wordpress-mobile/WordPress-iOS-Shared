#import "WPSharedLogging.h"
#import "WPSharedLoggingPrivate.h"

DDLogLevel WPSharedGetLoggingLevel() {
    return ddLogLevel;
}

void WPSharedSetLoggingLevel(DDLogLevel level) {
    ddLogLevel = level;
}
