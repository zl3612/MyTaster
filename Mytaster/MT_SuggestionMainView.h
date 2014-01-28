//
//  MT_SuggestionMainView.h
//  Mytaster
//
//  Created by Zheng Lin on 10/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpperView.h"
#import "HorizontalScroller.h"
#import "ResBriefView.h"

@interface MT_SuggestionMainView : UIView

@property (strong, nonatomic) UpperView *upperView;
@property (strong, nonatomic) IBOutlet UITableView *adsTableView;
@property (strong, nonatomic) IBOutlet UITableView *resBriefTableView;
@property (strong, nonatomic) HorizontalScroller *scroller;

@end
