//
//  MT_MainView.m
//  Mytaster
//
//  Created by Zheng Lin on 10/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_MainView.h"
#import "MT_ElementView.h"

@implementation MT_MainView
{
    MT_ElementView *voucherView;
    MT_ElementView *storeView;
    MT_ElementView *messageView;
    MT_ElementView *settingView;
    MT_ElementView *middleView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        voucherView = [[MT_ElementView alloc] initWithFrame:CGRectMake(0, 0, 160, 160)  button:@"Voucher.png" label:@"My Vouchers" isMiddle:NO];
        storeView = [[MT_ElementView alloc] initWithFrame:CGRectMake(160, 0, 160, 160)  button:@"Store.png" label:@"Voucher Store" isMiddle:NO];
        messageView = [[MT_ElementView alloc] initWithFrame:CGRectMake(0, 340, 160, 160)  button:@"Message.png" label:@"Messages" isMiddle:NO];
        settingView = [[MT_ElementView alloc] initWithFrame:CGRectMake(160, 340, 160, 160) button:@"Setting.png" label:@"Settings" isMiddle:NO];
        middleView = [[MT_ElementView alloc] initWithFrame:CGRectMake(0, 160, 320, 180)  button:@"action.png" label:@"" isMiddle:YES];
        
        [self addSubview:voucherView];
        [self addSubview:storeView];
        [self addSubview:messageView];
        [self addSubview:settingView];
        [self addSubview:middleView];

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
