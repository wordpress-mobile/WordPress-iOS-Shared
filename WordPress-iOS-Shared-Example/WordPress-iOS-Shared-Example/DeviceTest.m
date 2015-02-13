//
//  DeviceTest.m
//  WordPress-iOS-Shared-Example
//
//  Created by Diego E. Rey Mendez on 2/13/15.
//  Copyright (c) 2015 WordPress. All rights reserved.
//

#import "DeviceTest.h"

@implementation DeviceTest

- (instancetype)initWithTitle:(NSString *)title
              andVerification:(DeviceTestVerificationBlock)verification {
    
    self = [super init];
    
    if (self) {
        _title = title;
        _verification = verification;
    }
    
    return self;
}

@end
