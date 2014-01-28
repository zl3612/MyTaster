//
//  MT_AdBuilder.h
//  Mytaster
//
//  Created by Zheng Lin on 12/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MT_AdBuilder : NSObject

+ (NSArray  *)adsFromJSON:(NSData  *)objectNotation error:(NSError  **)error;

@end
