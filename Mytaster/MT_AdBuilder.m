//
//  MT_AdBuilder.m
//  Mytaster
//
//  Created by Zheng Lin on 12/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_AdBuilder.h"
#import "MT_Advertisement.h"

@implementation MT_AdBuilder

+ (NSArray  *)adsFromJSON:(NSData  *)objectNotation error:(NSError  **)error
{
    NSError  *localError = nil;
    NSDictionary  *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray  *ads = [[NSMutableArray  alloc] init];
    
    NSArray  *results = [parsedObject valueForKey:@"ads"];
    NSLog(@"Count %lu", (unsigned long)results.count);
    
    for (NSDictionary  *adDic in results) {
        MT_Advertisement *ad = [[MT_Advertisement alloc] init];
        
        for (NSString  *key in adDic) {
            if ([ad respondsToSelector:NSSelectorFromString(key)]) {
                [ad setValue:[adDic valueForKey:key] forKey:key];
            }
        }
        
        [ads addObject:ad];
    }
    
    return ads;
}
@end
