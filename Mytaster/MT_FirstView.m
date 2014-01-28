//
//  MT_FirstView.m
//  Mytaster
//
//  Created by Zheng Lin on 27/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_FirstView.h"

@implementation MT_FirstView

- (id)initWithFrame:(CGRect)frame userName:(NSString *)userName
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.topBarView = [[ MT_TopBarView alloc] initWithFrame:CGRectMake(0, 0, 320, 50) userName:userName];
        self.mainView = [[ MT_MainView alloc] initWithFrame:CGRectMake(0, 50, 320, 500)];
        
        [self addSubview:self.topBarView];
        [self addSubview:self.mainView];
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
