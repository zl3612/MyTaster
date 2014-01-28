//
//  MT_MTManager.m
//  Mytaster
//
//  Created by Zheng Lin on 13/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_MTManager.h"
#import "MT_AdBuilder.h"
#import "MT_SuggestionBuilder.h"
#import "MT_MTCommunicator.h"
#import "MT_Advertisement.h"


@implementation MT_MTManager
{
    BOOL isOnline;
}

- (id)init
{
    self = [super init];
    if (self) {

        isOnline = NO;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downloadImage:) name:@"MTDownloadAdImageNotification" object:nil];

    }
    return self;
}

-(void)fetchAdsAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    [self.communicator searchAdsAtCoordinate:coordinate];
    
    
}

-(void)fetchSuggestionsAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    [self.communicator searchSuggestionsAtCoordinate:coordinate];
    
    
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)downloadImage:(NSNotification*)notification
{

    UIImageView *imageView = notification.userInfo[@"imageView"];
    NSString *adUrl = notification.userInfo[@"adUrl"];
    
    

    	// 3
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *image = [self.communicator downloadImage:adUrl];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                imageView.image = image;
                
            });

            
        });
        
}





#pragma mark - MTCommunicatorDelegate
- (void) receivedAdsJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    NSArray *ads = [MT_AdBuilder adsFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingAdsFailedWithError:error];
        
    } else {
        [self.delegate didReceiveAds:ads];
    }
}

- (void)fetchingAdsFailedWithError:(NSError *)error
{
    [self.delegate fetchingAdsFailedWithError:error];
}

//
- (void) receivedSuggestionsJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    NSArray *suggestions = [MT_SuggestionBuilder suggestionsFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingAdsFailedWithError:error];
        
    } else {
        [self.delegate didReceiveSuggestions:suggestions];
    }
}

- (void)fetchingSuggestionsFailedWithError:(NSError *)error
{
    [self.delegate fetchingSuggestionsFailedWithError:error];
}

@end
