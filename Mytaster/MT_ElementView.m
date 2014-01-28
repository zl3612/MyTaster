//
//  MT_ElementView.m
//  Mytaster
//
//  Created by Zheng Lin on 10/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_ElementView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MT_ElementView
{
    UIImageView *bgImageView;
    UIImageView *btImageView;
    UILabel *elementName;
}

- (id)initWithFrame:(CGRect)frame button:(NSString *)btImage label:(NSString *)label isMiddle:(BOOL)middle
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        if (middle) {
            bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 180)];
            bgImageView.image = [UIImage imageNamed:@"makalong.jpeg"];
            
            btImageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/2.0-40, frame.size.height/2.0-40, 80, 80)];
            btImageView.image = [UIImage imageNamed:btImage];

            btImageView.layer.cornerRadius = 40;
            btImageView.clipsToBounds = YES;

            self.btAction = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width/2.0-40, frame.size.height/2.0-40, 80, 80)];
            self.startFetch = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width/2.0-40, frame.size.height/2.0-40, 80, 80)];
            self.startFetch.hidden = YES;
            [self addSubview:bgImageView];
            [self addSubview:btImageView];
            [self addSubview:self.btAction];
            [self addSubview:self.startFetch];
            
        }
        else
        {
            elementName = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, 160, 40)];
            elementName.text = label;
            elementName.textAlignment = NSTextAlignmentCenter;
            elementName.textColor = [UIColor colorWithRed:102.0/255.0 green:205.0/255.0 blue:170.0/255.0 alpha:1];
            self.layer.borderColor = [UIColor lightGrayColor].CGColor;
            self.layer.borderWidth = 1.0f;
            btImageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/2.0-40, frame.size.height/2.0-50, 80, 80)];
            btImageView.image = [UIImage imageNamed:btImage];
            self.btAction = [[ UIButton alloc] initWithFrame:CGRectMake(frame.size.width/2.0-40, frame.size.height/2.0-50, 80, 80)];
            [self addSubview:btImageView];
            [self addSubview:elementName];
            [self addSubview:self.btAction];

        }


        
        //btAction  = [[UIButton alloc] initWithFrame:btImageView.frame];
//        btAction = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [btAction setTitle:@"Show View" forState:UIControlStateNormal];
//        btAction.frame = btImageView.frame;
//        [self addSubview:btAction];
        
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
