//
//  MTCommunicatorDelegate.h
//  Mytaster
//
//  Created by Zheng Lin on 12/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

// MTCommunicator relies on the delegate of MTCommunicatorDelegate to handle the parsing of JSON data.
@protocol MTCommunicatorDelegate <NSObject>

//get Ads data
- (void)receivedAdsJSON:(NSData  *)objectNotation;
- (void)fetchingAdsFailedWithError:(NSError  *)error;

//get suggestions data
- (void)receivedSuggestionsJSON:(NSData  *)objectNotation;
- (void)fetchingSuggestionsFailedWithError:(NSError  *)error;


@end
