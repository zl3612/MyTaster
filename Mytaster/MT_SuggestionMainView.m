//
//  MT_SuggestionMainView.m
//  Mytaster
//
//  Created by Zheng Lin on 10/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_SuggestionMainView.h"
#import <QuartzCore/QuartzCore.h>

#import "AdsCell.h"
#import "MT_Advertisement.h"

@implementation MT_SuggestionMainView
{
    UIActivityIndicatorView *indicator;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //Upper View
        self.upperView = [[UpperView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];

        
        
        //add ad view
       self.adsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 150, 320, 280) style:UITableViewStylePlain];

        self.resBriefTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 150, self.frame.size.width, self.frame.size.height-120) style:UITableViewStyleGrouped];
        //add scroller view
        self.scroller = [[HorizontalScroller alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 120)];
        self.scroller.backgroundColor = [UIColor colorWithRed:0.24f green:0.35f blue:0.49f alpha:1];
        
        [self addSubview:self.scroller];
        self.scroller.hidden = YES;
        [self addSubview:self.upperView];
        
        [self addSubview:self.adsTableView];
        [self addSubview:self.resBriefTableView];
        self.resBriefTableView.hidden = YES;
        
        //indicator
//        indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(150, 200, 20, 20)];
//        //indicator.center = self.center;
//        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
//        [indicator startAnimating];
//        [self addSubview:indicator];

        //self.adsTableView.hidden = YES;
    }
    return self;
}
@end
