//
//  FontTableViewCell.m
//  WordPress-iOS-Shared-Example
//
//  Created by Sendhil Panchadsaram on 7/16/14.
//  Copyright (c) 2014 WordPress. All rights reserved.
//

#import "FontTableViewCell.h"

@implementation FontTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
