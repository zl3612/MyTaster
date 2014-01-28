//
//  MT_SuggestionBuilder.h
//  Mytaster
//
//  Created by Zheng Lin on 28/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MT_SuggestionBuilder : NSObject
+ (NSArray  *)suggestionsFromJSON:(NSData  *)objectNotation error:(NSError  **)error;

@end
