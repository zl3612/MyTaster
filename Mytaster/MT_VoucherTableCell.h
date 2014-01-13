//
//  MT_VoucherTableCell.h
//  Mytaster
//
//  Created by Kaiyan XIAO on 12/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MT_VoucherTableCell : UITableViewCell

- (void)setVoucherInfos:(NSString*)infos expire:(NSString*)expire price:(NSString*)price;
- (void)setVoucherByModel:(NSDictionary*)model;

@end
