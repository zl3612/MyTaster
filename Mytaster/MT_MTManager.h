//
//  MT_MTManager.h
//  Mytaster
//
//  Created by Zheng Lin on 13/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "MTManagerDelegate.h"
#import "MTCommunicatorDelegate.h"

@class MT_MTCommunicator;

@interface MT_MTManager : NSObject <MTCommunicatorDelegate>

@property (strong, nonatomic) MT_MTCommunicator *communicator;
@property (weak, nonatomic) id<MTManagerDelegate> delegate;

- (void)fetchAdsAtCoordinate:(CLLocationCoordinate2D)coordinate;
- (void)fetchSuggestionsAtCoordinate:(CLLocationCoordinate2D)coordinate;

@end
