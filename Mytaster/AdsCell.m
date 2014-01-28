//
//  AdsCell.m
//  Mytaster
//
//  Created by Zheng Lin on 15/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "AdsCell.h"

@implementation AdsCell
{
    UIImageView *adImage;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier adUrl:(NSString *)adUrl
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.frame = CGRectMake(0, 0, 320, 120);
        adImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:adImage];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MTDownloadAdImageNotification" object:self userInfo:@{@"imageView":adImage, @"adUrl":adUrl}];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
