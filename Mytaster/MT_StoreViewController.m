//
//  MT_StoreViewController.m
//  Mytaster
//
//  Created by Kaiyan XIAO on 13/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_StoreViewController.h"
#import "MT_StoreVoucherCell.h"

@interface MT_StoreViewController ()

@end

@implementation MT_StoreViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - methods for selling vouchers' table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[MT_StoreViewController sellingVouchers] count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MT_StoreVoucherCell";
    MT_StoreVoucherCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell setSellingVoucherByModel:[MT_StoreViewController sellingVouchers][indexPath.row]];
    
    return cell;
}

#pragma mark - some static functions for offering dummy data
+ (NSArray*)sellingVouchers
{
    return @[@{@"infos": @"Four Season - 15% off", @"expire": @"20-02-2014", @"price": @"1200"}, @{@"infos": @"Fat Duck - 30£ off", @"expire": @"10-04-2014", @"price": @"10000"}];
}

@end
