//
//  MT_TopBarView.m
//  Mytaster
//
//  Created by Zheng Lin on 10/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_TopBarView.h"

@implementation MT_TopBarView
{
    UILabel *appName;
    UILabel *userName;
    UIImageView *appIcon;
    UIImageView *userPortrait;
}

- (id)initWithFrame:(CGRect)frame userName:(NSString *)userNameText
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
        self.backgroundColor = [UIColor colorWithRed:102.0/255.0 green:205.0/255.0 blue:170.0/255.0 alpha:1];
        
        appIcon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 20, 20)];
        appIcon.image = [UIImage imageNamed:@"logo.png"];
        
        userPortrait = [[UIImageView alloc] initWithFrame:CGRectMake(280, 10, 30, 30)];
        userPortrait.image = [UIImage imageNamed:@"user.png"];
        
        appName = [[UILabel alloc] initWithFrame:CGRectMake(33, 0, 100, 50)];
        appName.text = @"MyTaster";
        appName.textColor = [UIColor whiteColor];
        
        userName = [[UILabel alloc] initWithFrame:CGRectMake(200, 0, 77, 50)];
        userName.text = userNameText;
        userName.textColor = [UIColor whiteColor];
        userName.textAlignment = NSTextAlignmentRight;
    
        [self addSubview:appIcon];
        [self addSubview:userPortrait];
        [self addSubview:appName];
        [self addSubview:userName];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
