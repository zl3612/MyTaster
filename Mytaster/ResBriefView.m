//
//  ResBriefView.m
//  Mytaster
//
//  Created by Zheng Lin on 24/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "ResBriefView.h"

@implementation ResBriefView
{
    UIImageView *coverImage;
    UIActivityIndicatorView *indicator;
}

- (id)initWithFrame:(CGRect)frame resCover:(NSString *)resCover
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
        //the cover image has a 5 pixcels margin from its frame
        coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, frame.size.width - 10, frame.size.height - 10)];
        [self addSubview:coverImage];
        
        //Design mark under the images here
        
        //Design activity indicator
        indicator = [[UIActivityIndicatorView alloc] init];
        indicator.center = self.center;
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [indicator startAnimating];
        [self addSubview:indicator];
        
         [coverImage addObserver:self forKeyPath:@"image" options:0 context:nil];
        //Here Ad stands for suggestion restaurants
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MTDownloadAdImageNotification"
                                                            object:self
                                                          userInfo:@{@"imageView":coverImage, @"adUrl":resCover}];
        
    }
    return self;
}

- (void)dealloc
{
    [coverImage removeObserver:self forKeyPath:@"image"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"image"])
    {
        [indicator stopAnimating];
    }
}
@end
