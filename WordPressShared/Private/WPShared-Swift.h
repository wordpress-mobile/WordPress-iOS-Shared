// Import this header instead of <WordPressShared/WordPressShared-Swift.h>
// This allows the pod to be built as a static or dynamic framework
// See https://github.com/CocoaPods/CocoaPods/issues/7594
#if __has_include("WordPressShared-Swift.h")
    #import "WordPressShared-Swift.h"
#else
    #import <WordPressShared/WordPressShared-Swift.h>
#endif
