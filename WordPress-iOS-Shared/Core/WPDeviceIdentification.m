#import "WPDeviceIdentification.h"

static NSString* const WPDeviceModelNameiPhone6 = @"iPhone 6";
static NSString* const WPDeviceModelNameiPhone6Plus = @"iPhone 6 Plus";
static NSString* const WPDeviceModelNameiPadSimulator = @"iPad Simulator";
static NSString* const WPDeviceModelNameiPhoneSimulator = @"iPhone Simulator";

@implementation WPDeviceIdentification

#pragma mark - Simulator support

/**
 *  @brief      Method to figure out if the specified model represents an iOS simulator.
 *  @details    Works both for the iPhone and iPad simulator device models.
 *
 *  @param      model       The device model.  Cannot be nil.
 *
 *  @return     YES if the device is a simulator.  NO otherwise.
 */
+ (BOOL)isASimulator:(NSString*)model
{
    NSParameterAssert([model isKindOfClass:[NSString class]]);
    
    return [self isiPadSimulator:model] || [self isiPhoneSimulator:model];
}

/**
 *  @brief      Method to figure out if the specified model represents an iPad simulator.
 *
 *  @param      model       The device model.  Cannot be nil.
 *
 *  @return     YES if the device is an iPad simulator.  NO otherwise.
 */
+ (BOOL)isiPadSimulator:(NSString*)model
{
    NSParameterAssert([model isKindOfClass:[NSString class]]);
    
    return [model isEqualToString:WPDeviceModelNameiPadSimulator];
}

/**
 *  @brief      Method to figure out if the specified model represents an iPhone simulator.
 *
 *  @param      model       The device model.  Cannot be nil.
 *
 *  @return     YES if the device is an iPhone simulator.  NO otherwise.
 */
+ (BOOL)isiPhoneSimulator:(NSString*)model
{
    NSParameterAssert([model isKindOfClass:[NSString class]]);
    
    return [model isEqualToString:WPDeviceModelNameiPhoneSimulator];
}

#pragma mark - Simulator device identification

/**
 *  @brief      Method to figure out if the device is a simulator's iPhone 6.
 *  @details    We only want to use this identification method when the device model shows that
 *              this is a simulator.  The reason for this choice is that we're using an
 *              approximation here to detect the device model, which by definition is imperfect.
 *              Whenever the real device model is available, that's the preferred verification
 *              method.
 *
 *  @returns    YES if the device is an iPhone 6 running in the simulator, NO otherwise.
 */
+ (BOOL)isiPhoneSixRunningInSimulator:(NSString*)model
{
    NSParameterAssert([model isKindOfClass:[NSString class]]);
    
    return ([self isASimulator:model]
            && IS_IPHONE
            && [[UIScreen mainScreen] respondsToSelector:@selector(nativeScale)]
            && [[UIScreen mainScreen] nativeScale] > 2.5f);
}

/**
 *  @brief      Method to figure out if the device is a simulator's iPhone 6 Plus.
 *  @details    We only want to use this identification method when the device model shows that
 *              this is a simulator.  The reason for this choice is that we're using an
 *              approximation here to detect the device model, which by definition is imperfect.
 *              Whenever the real device model is available, that's the preferred verification
 *              method.
 *
 *  @returns    YES if the device is an iPhone 6 Plus running in the simulator, NO otherwise.
 */
+ (BOOL)isiPhoneSixPlusRunningInSimulator:(NSString*)model
{
    NSParameterAssert([model isKindOfClass:[NSString class]]);
    
    return ([self isASimulator:model]
            && [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone
            && MAX([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width) == 667);
}

#pragma mark - Device identification

+ (BOOL)isiPhoneSix
{
    NSString *model = [UIDevice currentDevice].model;
    
    return ([model isEqualToString:WPDeviceModelNameiPhone6]
            || [self isiPhoneSixRunningInSimulator:model]);
}

+ (BOOL)isiPhoneSixPlus
{
    NSString *model = [UIDevice currentDevice].model;
    
    return ([model isEqualToString:WPDeviceModelNameiPhone6Plus]
            || [self isiPhoneSixPlusRunningInSimulator:model]);
}

+ (BOOL)isiOSVersionEarlierThan8
{
    return [[[UIDevice currentDevice] systemVersion] floatValue] < 8.0;
}

@end
