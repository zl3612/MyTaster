//
//  MTCommunicator.h
//  Mytaster
//
//  Created by Zheng Lin on 12/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol MTCommunicatorDelegate;

@interface MT_MTCommunicator : NSObject
@property (weak, nonatomic) id<MTCommunicatorDelegate> delegate;

- (void)searchAdsAtCoordinate:(CLLocationCoordinate2D)coordinate;
- (void)searchSuggestionsAtCoordinate:(CLLocationCoordinate2D)coordinate;

- (UIImage*)downloadImage:(NSString*)url;

@end