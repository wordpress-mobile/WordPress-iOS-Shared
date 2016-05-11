#import "WPSharedLogging.h"
#import "Logging.h"

int WPSharedGetLoggingLevel() {
    return ddLogLevel;
}

void WPSharedSetLoggingLevel(int level) {
    ddLogLevel = level;
}
