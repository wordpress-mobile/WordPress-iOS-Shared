//
//  DeviceTableViewCell.h
//  WordPress-iOS-Shared-Example
//
//  Created by Diego E. Rey Mendez on 2/13/15.
//  Copyright (c) 2015 WordPress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceTableViewCell : UITableViewCell

@property (nonatomic, strong, readwrite) IBOutlet UILabel *title;
@property (nonatomic, strong, readwrite) IBOutlet UILabel *testResult;

@end
