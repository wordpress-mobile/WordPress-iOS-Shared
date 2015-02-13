//
//  DeviceTest.h
//  WordPress-iOS-Shared-Example
//
//  Created by Diego E. Rey Mendez on 2/13/15.
//  Copyright (c) 2015 WordPress. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^DeviceTestVerificationBlock)();

@interface DeviceTest : NSObject

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, copy, readonly) DeviceTestVerificationBlock verification;

- (instancetype)initWithTitle:(NSString *)title
              andVerification:(DeviceTestVerificationBlock)verification;

@end
