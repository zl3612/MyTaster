//
//  MT_SegmentControlViewController.m
//  Mytaster
//
//  Created by Kaiyan XIAO on 12/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_SegmentControlViewController.h"

@interface MT_SegmentControlViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *choicesSegmentControl;

@end

@implementation MT_SegmentControlViewController

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
//    [self setChoicesSegmentControlImages];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setChoicesSegmentControlImages
{
    self.choicesSegmentControl.frame = CGRectMake(self.choicesSegmentControl.frame.origin.x, self.choicesSegmentControl.frame.origin.y, self.choicesSegmentControl.frame.size.width, 35);
//    self.choicesSegmentControl.tintColor = [UIColor clearColor];
    
    [self.choicesSegmentControl setImage:[[UIImage imageNamed:@"SmallVoucher"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forSegmentAtIndex:0];
    
}

@end
