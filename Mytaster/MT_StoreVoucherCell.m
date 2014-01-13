//
//  MT_StoreVoucherCell.m
//  Mytaster
//
//  Created by Kaiyan XIAO on 13/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_StoreVoucherCell.h"

@interface MT_StoreVoucherCell ()
@property (weak, nonatomic) IBOutlet UILabel *sellingVoucherInfos;
@property (weak, nonatomic) IBOutlet UILabel *sellingVoucherExpire;
@property (weak, nonatomic) IBOutlet UILabel *sellingVoucherPrice;

@end

@implementation MT_StoreVoucherCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setSellingVoucherByModel:(NSDictionary*)model
{
    self.sellingVoucherInfos.text = model[@"infos"];
    self.sellingVoucherExpire.text = model[@"expire"];
    self.sellingVoucherPrice.text = model[@"price"];
}

@end
