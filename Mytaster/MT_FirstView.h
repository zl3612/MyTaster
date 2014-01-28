//
//  MT_FirstView.h
//  Mytaster
//
//  Created by Zheng Lin on 27/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MT_TopBarView.h"
#import "MT_MainView.h"

@interface MT_FirstView : UIView

@property (nonatomic, strong) MT_TopBarView *topBarView;
@property (nonatomic, strong) MT_MainView *mainView;

-(id)initWithFrame:(CGRect)frame userName:(NSString *)userName;


@end
