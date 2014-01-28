//
//  MT_MainView.h
//  Mytaster
//
//  Created by Zheng Lin on 10/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MT_ElementView.h"

@interface MT_MainView : UIView

@property (nonatomic, strong) MT_ElementView *voucherView,*storeView,*messageView,*settingView, *middleView;
@property (nonatomic, strong) UIButton *swipeDown1, *swipeDown2;

-(id)initWithFrame:(CGRect)frame;
@end
