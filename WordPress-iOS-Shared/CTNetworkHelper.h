#import <Foundation/Foundation.h>

@interface CTNetworkHelper : NSObject

@property (nonatomic, readwrite) NSInteger maxConcurrentDownloads;

+ (id)sharedNetworkHelper;

@end
