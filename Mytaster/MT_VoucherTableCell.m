//
//  MT_VoucherTableCell.m
//  Mytaster
//
//  Created by Kaiyan XIAO on 12/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_VoucherTableCell.h"

@interface MT_VoucherTableCell ()
@property (weak, nonatomic) IBOutlet UILabel *VoucherInfos;
@property (weak, nonatomic) IBOutlet UILabel *VoucherExpire;
@property (weak, nonatomic) IBOutlet UILabel *VoucherPrice;

@end

@implementation MT_VoucherTableCell

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

- (void)setVoucherInfos:(NSString *)infos expire:(NSString *)expire price:(NSString *)price
{
    self.VoucherInfos.text = infos;
    self.VoucherExpire.text = expire;
    self.VoucherPrice.text = price;
}

- (void)setVoucherByModel:(NSDictionary *)model
{
    self.VoucherInfos.text = model[@"infos"];
    self.VoucherExpire.text = model[@"expire"];
    self.VoucherPrice.text = model[@"price"];
}

@end
