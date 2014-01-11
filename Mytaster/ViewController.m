//
//  ViewController.m
//  Mytaster
//
//  Created by Zheng Lin on 10/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "ViewController.h"
#import "MT_TopBarView.h"
#import "MT_MainView.h"
#import "MT_SuggestionMainView.h"

@interface ViewController (){
    MT_TopBarView *topBarView;
    MT_MainView *mainView;
    MT_SuggestionMainView *suggestionMainView;
    
    UIButton *middleButton;
    UIButton *swipeDownButton;
    UIButton *startToFetchButton;
}


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    topBarView = [[MT_TopBarView alloc] initWithFrame:CGRectMake(0, 20, 320, 50) userName:@"Zheng Lin"];
    mainView = [[MT_MainView alloc] initWithFrame:CGRectMake(0, 70, 320, 500)];
    suggestionMainView = [[MT_SuggestionMainView alloc] initWithFrame:CGRectMake(0, 570, 320, 388)];
    
    
    //Create the button in the middle
    middleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //[middleButton setTitle:@"Show View" forState:UIControlStateNormal];
    middleButton.frame = CGRectMake(120, 275, 100, 100);
    [middleButton addTarget:self action:@selector(youMayLike:) forControlEvents:UIControlEventTouchUpInside];
    //Create the swipe down
    swipeDownButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    swipeDownButton.frame = CGRectMake(0,0, 320, 180);
    [swipeDownButton addTarget:self action:@selector(swipeDown:) forControlEvents:UIControlEventTouchDragInside];
    swipeDownButton.hidden = YES;
    //Create Start2Fetch Button
    startToFetchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startToFetchButton.frame = CGRectMake(120,40, 100, 100);
    [startToFetchButton addTarget:self action:@selector(startToFetch:) forControlEvents:UIControlEventTouchUpInside];
    startToFetchButton.hidden = YES;


    [self.view addSubview:topBarView];
    [self.view addSubview:mainView];
    [self.view addSubview:middleButton];
    [self.view addSubview:swipeDownButton];
    [self.view addSubview:startToFetchButton];
    [self.view addSubview:suggestionMainView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)youMayLike:(id)sender
{
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [mainView setTransform:CGAffineTransformMakeTranslation(0.0, -230.0-20)];
                         [topBarView setTransform:CGAffineTransformMakeTranslation(0.0, -230.0-20)];
                         [suggestionMainView setTransform:CGAffineTransformMakeTranslation(0.0, -390.0-40)];
                     }
                     completion:^(BOOL finished){
                         middleButton.hidden = YES;
                         swipeDownButton.hidden = NO;
                         startToFetchButton.hidden = NO;
                         NSLog(@"Done!");
                     }];
}

-(IBAction)swipeDown:(id)sender
{
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [mainView setTransform:CGAffineTransformMakeTranslation(0.0, 0.0)];
                         [topBarView setTransform:CGAffineTransformMakeTranslation(0.0, 0.0)];
                         [suggestionMainView setTransform:CGAffineTransformMakeTranslation(0.0, 0.0)];
                     }
                     completion:^(BOOL finished){
                         middleButton.hidden = NO;
                         swipeDownButton.hidden = YES;
                         startToFetchButton.hidden = YES;
                         NSLog(@"Done1!");
                     }];

}

-(IBAction)startToFetch:(id)sender
{
    NSLog(@"Start to fetch");
}
@end
