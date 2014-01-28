//
//  MTCommunicator.m
//  Mytaster
//
//  Created by Zheng Lin on 12/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "MT_MTCommunicator.h"
#import "MTCommunicatorDelegate.h"

@implementation MT_MTCommunicator

- (void)searchAdsAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    NSString  *urlAsString = @"ftp://ginlin:lingin@192.168.1.2/Public/Paella_test/ads.json";
    NSURL  *url = [[NSURL  alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection  sendAsynchronousRequest:[[NSURLRequest  alloc] initWithURL:url] queue:[[NSOperationQueue  alloc] init] completionHandler:^(NSURLResponse  *response, NSData  *data, NSError  *error) {
        
        if (error) {
            [self.delegate fetchingAdsFailedWithError:error];
        } else {
            [self.delegate receivedAdsJSON:data];
        }
    }];
}

- (void)searchSuggestionsAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    NSString  *urlAsString = @"ftp://ginlin:lingin@192.168.1.2/Public/Paella_test/results.json";
    NSURL  *url = [[NSURL  alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection  sendAsynchronousRequest:[[NSURLRequest  alloc] initWithURL:url] queue:[[NSOperationQueue  alloc] init] completionHandler:^(NSURLResponse  *response, NSData  *data, NSError  *error) {
        
        if (error) {
            [self.delegate fetchingSuggestionsFailedWithError:error];
        } else {
            [self.delegate receivedSuggestionsJSON:data];
        }
    }];
}

- (UIImage*)downloadImage:(NSString*)url
{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    return [UIImage imageWithData:data];
}

@end
