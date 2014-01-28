//
//  UpperView.h
//  Mytaster
//
//  Created by Zheng Lin on 28/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpperView : UIView

@property (nonatomic, strong) UISlider *budgetSlider;
@property (nonatomic, strong) UISwitch *isStarter;
@property (nonatomic, strong) UISwitch *isDessert;
@property (nonatomic, strong) UISwitch *isMain;
@property (nonatomic, strong) UISwitch *isDrink;

@end
