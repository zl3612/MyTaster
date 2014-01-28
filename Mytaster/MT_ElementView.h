//
//  MT_ElementView.h
//  Mytaster
//
//  Created by Zheng Lin on 10/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MT_ElementView : UIView
@property (nonatomic, strong) UIButton *btAction, *startFetch;

- (id)initWithFrame:(CGRect)frame button:(NSString *)btImage label:(NSString *)label isMiddle:(BOOL)middle;
@end
