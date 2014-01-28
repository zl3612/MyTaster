//
//  MT_MainView.m
//  Mytaster
//
//  Created by Zheng Lin on 10/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_MainView.h"

@implementation MT_MainView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.voucherView = [[MT_ElementView alloc] initWithFrame:CGRectMake(0, 0, 160, 160)  button:@"Voucher.png" label:@"My Vouchers" isMiddle:NO];
        self.storeView = [[MT_ElementView alloc] initWithFrame:CGRectMake(160, 0, 160, 160)  button:@"Store.png" label:@"Voucher Store" isMiddle:NO];
        self.messageView = [[MT_ElementView alloc] initWithFrame:CGRectMake(0, 340, 160, 160)  button:@"Message.png" label:@"Messages" isMiddle:NO];
        self.settingView = [[MT_ElementView alloc] initWithFrame:CGRectMake(160, 340, 160, 160) button:@"Setting.png" label:@"Settings" isMiddle:NO];
        self.middleView = [[MT_ElementView alloc] initWithFrame:CGRectMake(0, 160, 320, 180)  button:@"action.png" label:@"" isMiddle:YES];
        
        self.swipeDown1 = [[ UIButton alloc] initWithFrame:CGRectMake(0, 160, 100, 180)];
        self.swipeDown2 = [[ UIButton alloc] initWithFrame:CGRectMake(220, 160, 100, 180)];
        self.swipeDown1.hidden = YES;
        self.swipeDown2.hidden = YES;

        
        [self addSubview:self.voucherView];
        [self addSubview:self.storeView];
        [self addSubview:self.messageView];
        [self addSubview:self.settingView];
        [self addSubview:self.middleView];
        [self addSubview:self.swipeDown1];
        [self addSubview:self.swipeDown2];



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
