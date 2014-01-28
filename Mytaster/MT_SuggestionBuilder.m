//
//  MT_SuggestionBuilder.m
//  Mytaster
//
//  Created by Zheng Lin on 28/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_SuggestionBuilder.h"
#import "MT_Restaurant.h"
@implementation MT_SuggestionBuilder

+ (NSArray  *)suggestionsFromJSON:(NSData  *)objectNotation error:(NSError  **)error
{
    NSError  *localError = nil;
    NSDictionary  *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray  *suggestions = [[NSMutableArray  alloc] init];
    
    NSArray  *results = [parsedObject valueForKey:@"suggestions"];
    NSLog(@"Count %lu", (unsigned long)results.count);
    
    for (NSDictionary  *suggestionDic in results) {
        MT_Restaurant *restaurant = [[MT_Restaurant alloc] init];
        
        for (NSString  *key in suggestionDic) {
            if ([restaurant respondsToSelector:NSSelectorFromString(key)]) {
                [restaurant setValue:[suggestionDic valueForKey:key] forKey:key];
            }
        }
        
        [suggestions addObject:restaurant];
    }
    
    return suggestions;
}


@end
