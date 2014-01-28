//
//  MT_Restaurant.h
//  Mytaster
//
//  Created by Zheng Lin on 24/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MT_Restaurant : NSObject

//"type" is the type of food, rate is the user rate
@property (nonatomic, copy, readonly)NSString  *resID,*resName, *type,  *rate, *distance, *imgurl;

@end
