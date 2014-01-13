//
//  ChoicesTabBarController.m
//  Mytaster
//
//  Created by Kaiyan XIAO on 12/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_ChoicesTabBarController.h"

@interface MT_ChoicesTabBarController ()

@end

@implementation MT_ChoicesTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self moveTabBarToTop];
    [self setTabBarAppearance];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - methods to adjust the tab bar

- (void)moveTabBarToTop
{
    self.tabBar.autoresizingMask = 0;
    self.tabBar.frame = CGRectMake(0, 0, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
}

- (void)setTabBarAppearance
{
//    self.tabBar.backgroundColor = [UIColor colorWithRed:120.0f green:205.0f blue:170.0f alpha:1];
//    self.tabBarItem;
//    self.tabBar.opaque = YES;
    [self.viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [((UIViewController*)obj).tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }];
}

@end
