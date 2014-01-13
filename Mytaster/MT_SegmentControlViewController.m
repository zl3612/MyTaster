//
//  MT_SegmentControlViewController.m
//  Mytaster
//
//  Created by Kaiyan XIAO on 12/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_SegmentControlViewController.h"
#import "MT_VoucherViewController.h"
#import "MT_StoreViewController.h"

@interface MT_SegmentControlViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *choicesSegmentControl;
@property (weak, nonatomic) IBOutlet UIView *detailContainer;

@property (strong, nonatomic) MT_VoucherViewController *voucherController;
@property (strong, nonatomic) MT_StoreViewController *storeController;

@property (strong, nonatomic) UIViewController *currentController;
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
//    [self selectVoucherSegment];
//    [self selectStoreSegment];
    [self selectSegmentByController:self.voucherController];

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

#pragma mark - making the controllers lazy instantiatied

- (MT_VoucherViewController*)voucherController
{
    if (!_voucherController) {
        _voucherController = [self.storyboard instantiateViewControllerWithIdentifier:@"MT_VoucherViewController"];
    }
    
    return _voucherController;
}

- (MT_StoreViewController*)storeController
{
    if (!_storeController) {
        _storeController = [self.storyboard instantiateViewControllerWithIdentifier:@"MT_StoreViewController"];
    }
    
    return _storeController;
}

#pragma mark - methods about responding to segmented control's selecetion and changing view

- (IBAction)segmentChanged:(UISegmentedControl *)sender {
    switch ([sender selectedSegmentIndex]) {
        case  0:
            [self unselectSegmentByController:self.currentController];
            [self selectSegmentByController:self.voucherController];
            break;
        case 1:
            [self unselectSegmentByController:self.currentController];
            [self selectSegmentByController:self.storeController];
            break;
            
        default:
            break;
    }
}

- (void)selectSegmentByController:(UIViewController*)controller
{
    [self addChildViewController:controller];
    controller.view.frame = self.detailContainer.frame;
    [self.view addSubview:controller.view];
    [controller didMoveToParentViewController:self];
    self.currentController = controller;
}

- (void)unselectSegmentByController:(UIViewController*)controller
{
    [controller willMoveToParentViewController:nil];
    [controller.view removeFromSuperview];
    [controller removeFromParentViewController];
}

- (void)selectVoucherSegment
{
    MT_VoucherViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"MT_VoucherViewController"];
    [self addChildViewController:controller];
    controller.view.frame = self.detailContainer.frame;
    [self.view addSubview:controller.view];
    [controller didMoveToParentViewController:self];
}

- (void)selectStoreSegment
{
    MT_StoreViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"MT_StoreViewController"];
    [self addChildViewController:controller];
    controller.view.frame = self.detailContainer.frame;
    [self.view addSubview:controller.view];
    [controller didMoveToParentViewController:self];
}

@end
