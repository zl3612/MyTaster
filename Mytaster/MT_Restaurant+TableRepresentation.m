//
//  MT_Restaurant+TableRepresentation.m
//  Mytaster
//
//  Created by Zheng Lin on 24/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_Restaurant+TableRepresentation.h"

@implementation MT_Restaurant (TableRepresentation)
- (NSDictionary*)tr_tableRepresentation
{
    return @{@"titles":@[@"Restaurant", @"User Rate", @"Type of Food", @"Distance"],
             @"values":@[self.resName, self.rate, self.type, self.distance]};
}
@end
