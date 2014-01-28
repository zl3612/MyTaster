//
//  MTManagerDelegate.h
//  Mytaster
//
//  Created by Zheng Lin on 12/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTManagerDelegate <NSObject>

- (void)didReceiveAds:(NSArray  *)ads;
- (void)fetchingAdsFailedWithError:(NSError  *)error;

- (void)didReceiveSuggestions:(NSArray  *)suggestions;
- (void)fetchingSuggestionsFailedWithError:(NSError  *)error;

@end
