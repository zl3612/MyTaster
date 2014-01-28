//
//  UpperView.m
//  Mytaster
//
//  Created by Zheng Lin on 28/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "UpperView.h"

@implementation UpperView
{
    UILabel *starter;
    UILabel *main;
    UILabel *dessert;
    UILabel *drink;
    UILabel *budget;
    UILabel *noPerson;
    NSArray *_ads;
    NSArray *_adImgs;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //Upper View
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 10;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        budget = [[UILabel alloc] initWithFrame:CGRectMake(25, 10, 160, 30)];
        budget.text = @"Budget (per person):";
        budget.textColor = [UIColor lightGrayColor];
        
        self.budgetSlider = [[UISlider alloc] initWithFrame:CGRectMake(25, 40, 160, 30)];
        self.budgetSlider.minimumTrackTintColor = [UIColor colorWithRed:102.0/255.0 green:205.0/255.0 blue:170.0/255.0 alpha:1];
        starter = [[UILabel alloc] initWithFrame:CGRectMake(25, 70, 100, 30)];
        main = [[UILabel alloc] initWithFrame:CGRectMake(185, 70, 100, 30)];
        dessert = [[UILabel alloc] initWithFrame:CGRectMake(25, 110, 100, 30)];
        drink = [[UILabel alloc] initWithFrame:CGRectMake(185, 110, 100, 30)];
        starter.text = @"Starter";
        main.text = @"Main";
        dessert.text = @"Dessert";
        drink.text = @"Drink";
        
        starter.textColor = [UIColor lightGrayColor];
        main.textColor = [UIColor lightGrayColor];
        dessert.textColor = [UIColor lightGrayColor];
        drink.textColor = [UIColor lightGrayColor];
        
        self.isStarter = [[UISwitch alloc] initWithFrame:CGRectMake(100, 70, 150, 5)];
        self.isStarter.onTintColor = [UIColor colorWithRed:102.0/255.0 green:205.0/255.0 blue:170.0/255.0 alpha:1];
        self.isDessert = [[UISwitch alloc] initWithFrame:CGRectMake(100, 110, 150, 5)];
        self.isDessert.onTintColor = [UIColor colorWithRed:102.0/255.0 green:205.0/255.0 blue:170.0/255.0 alpha:1];
        self.isMain = [[UISwitch alloc] initWithFrame:CGRectMake(250, 70, 150, 5)];
        self.isMain.onTintColor = [UIColor colorWithRed:102.0/255.0 green:205.0/255.0 blue:170.0/255.0 alpha:1];
        self.isDrink = [[UISwitch alloc] initWithFrame:CGRectMake(250, 110, 150, 5)];
        self.isDrink.onTintColor = [UIColor colorWithRed:102.0/255.0 green:205.0/255.0 blue:170.0/255.0 alpha:1];
        
        [self addSubview:budget];
        [self addSubview:starter];
        [self addSubview:main];
        [self addSubview:dessert];
        [self addSubview:drink];
        [self addSubview:self.budgetSlider];
        [self addSubview:self.isStarter];
        [self addSubview:self.isDessert];
        [self addSubview:self.isMain];
        [self addSubview:self.isDrink];
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
