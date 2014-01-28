//
//  ViewController.m
//  Mytaster
//
//  Created by Zheng Lin on 10/01/2014.
//  Copyright (c) 2014 Paella Intelligence. All rights reserved.
//

#import "ViewController.h"

//views
#import "MT_TopBarView.h"
#import "MT_MainView.h"
#import "MT_SuggestionMainView.h"
#import "AdsCell.h"
#import "MT_FirstView.h"
#import "AdsCell.h"
#import "ResBriefView.h"

//models
#import "MT_Advertisement.h"
#import "MT_Restaurant.h"
#import "MT_Restaurant+TableRepresentation.h"
#import "MT_MTManager.h"
#import "MT_MTCommunicator.h"

@interface ViewController ()<MTManagerDelegate,UITableViewDataSource, UITableViewDelegate,HorizontalScrollerDelegate>{
    MT_TopBarView *topBarView;
    MT_MainView *mainView;
    MT_SuggestionMainView *suggestionMainView;
    MT_FirstView *firstView;
    
    UIButton *middleButton;
    UIButton *swipeDownButton;
    UIButton *startToFetchButton;
    
    //for fetching  JSON data
    NSArray *_ads;
    NSArray *_suggestions;
    NSDictionary *currentSuggestionData;
    int currentSuggestionIndex;
    
    MT_MTManager *_manager;
    int currentAdIndex;
    

}

@property (weak, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    firstView = [[MT_FirstView alloc] initWithFrame:CGRectMake(0, 20, 320, 550) userName:@"Zheng Lin"];
    [firstView.mainView.middleView.btAction addTarget:self action:@selector(youMayLike:) forControlEvents:UIControlEventTouchUpInside];
    [firstView.mainView.middleView.startFetch addTarget:self action:@selector(startToFetch:) forControlEvents:UIControlEventTouchUpInside];
    [firstView.mainView.swipeDown1 addTarget:self action:@selector(swipeDown:) forControlEvents:UIControlEventTouchDragInside];
    [firstView.mainView.swipeDown2 addTarget:self action:@selector(swipeDown:) forControlEvents:UIControlEventTouchDragInside];
    [self.view addSubview:firstView];
    
    //
    suggestionMainView = [[MT_SuggestionMainView alloc] initWithFrame:CGRectMake(0, 570, 320, 388)];
    
    [self.view addSubview:suggestionMainView];
    
    suggestionMainView.adsTableView.delegate = self;
    suggestionMainView.adsTableView.dataSource = self;
    suggestionMainView.resBriefTableView.delegate = self;
    suggestionMainView.resBriefTableView.dataSource =self;
    
    suggestionMainView.scroller.delegate = self;
    
    currentSuggestionIndex = 0;
    //
    _manager = [[MT_MTManager alloc] init];
    _manager.communicator = [[MT_MTCommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;

    
    NSLog(@"View controller - view did load");

 }


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)reloadScroller
{
    //allAlbums = [[LibraryAPI sharedInstance] getAlbums];
    if (currentSuggestionIndex < 0) currentSuggestionIndex = 0;
    else if (currentSuggestionIndex >= _suggestions.count) currentSuggestionIndex = _suggestions.count-1;
    [suggestionMainView.scroller reload];
    
    [self showDataForSuggestionAtIndex:currentSuggestionIndex];
}

-(void)showDataForSuggestionAtIndex:(int)suggestionIndex
{
    //defensive code: make sure the requested index is lower than the amount of the suggestions
    if (suggestionIndex < _suggestions.count) {
        //fetch the suggestion restaurant
        MT_Restaurant *restaurant = _suggestions[suggestionIndex];
        //save the suggestion data to present it later in the ResBrief table view
        currentSuggestionData = [restaurant tr_tableRepresentation];
    }
    else
    {
        currentSuggestionData = nil;
    }
    [suggestionMainView.resBriefTableView reloadData];
}

#pragma mark - Accessors
- (CLLocationManager *)locationManager
{
    if (_locationManager) {
        return _locationManager;
    }
    id appDelegate = [[UIApplication sharedApplication] delegate];
    if ([appDelegate respondsToSelector:@selector(locationManager)]) {
        _locationManager = [appDelegate performSelector:@selector(locationManager)];
    }
    return _locationManager;
}


#pragma mark - MeetupManagerDelegate
- (void)didReceiveAds:(NSArray  *)ads
{
    _ads = ads;
    dispatch_async(dispatch_get_main_queue(), ^{
        [suggestionMainView.adsTableView reloadData];
    });
}

- (void)fetchingAdsFailedWithError:(NSError  *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

- (void)didReceiveSuggestions:(NSArray *)suggestions
{
    _suggestions = suggestions;
    dispatch_async(dispatch_get_main_queue(), ^{
        suggestionMainView.resBriefTableView.hidden = NO;
        suggestionMainView.adsTableView.hidden = YES;
        suggestionMainView.scroller.hidden = NO;
        suggestionMainView.upperView.hidden = YES;
        [self reloadScroller];
    });
}

- (void)fetchingSuggestionsFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

#pragma mark - AdsTableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == suggestionMainView.adsTableView) {
        NSLog(@"there is %lu ads", (unsigned long)[_ads count]);
        return [_ads count];
    }
    else
    {
        NSLog(@"there is %lu suggestion", (unsigned long)[currentSuggestionData[@"titles"] count]);
        return [currentSuggestionData[@"titles"] count];;
    }

}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == suggestionMainView.adsTableView) {
        AdsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (!cell)
        {
            NSLog(@"table");
            MT_Advertisement *ad = [[ MT_Advertisement alloc] init];
            ad = _ads[indexPath.row];
            cell = [[AdsCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell" adUrl:ad.imgurl];
            
        }
        return cell;

    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        }
        
        cell.textLabel.text = currentSuggestionData[@"titles"][indexPath.row];
        cell.detailTextLabel.text = currentSuggestionData[@"values"][indexPath.row];
        return cell;

    }
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == suggestionMainView.adsTableView) {
        return 120.0;
    }
    else
        return 30.0;
}


#pragma mark - HorizontalScrollerDelegate methods
- (void)horizontalScroller:(HorizontalScroller *)scroller clickedViewAtIndex:(int)index
{
    currentSuggestionIndex = index;
    [self showDataForSuggestionAtIndex:index];
}

- (NSInteger)numberOfViewsForHorizontalScroller:(HorizontalScroller*)scroller
{
    return _suggestions.count;
}

- (UIView*)horizontalScroller:(HorizontalScroller*)scroller viewAtIndex:(int)index
{
    MT_Restaurant *res = _suggestions[index];
    return [[ResBriefView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) resCover:res.imgurl];
}

- (NSInteger)initialViewIndexForHorizontalScroller:(HorizontalScroller *)scroller
{
    return currentSuggestionIndex;
}

#pragma mark - Button actions
-(IBAction)youMayLike:(id)sender
{
    //[self.view addSubview:suggestionMainView];
    firstView.mainView.messageView.hidden = YES;
    firstView.mainView.settingView.hidden = YES;
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [firstView setTransform:CGAffineTransformMakeTranslation(0.0, -230.0-20)];
                         [topBarView setTransform:CGAffineTransformMakeTranslation(0.0, -230.0-20)];
                         [suggestionMainView setTransform:CGAffineTransformMakeTranslation(0.0, -390.0-40)];
                     }
                     completion:^(BOOL finished){

                         
                         firstView.mainView.middleView.btAction.hidden = YES;
                         firstView.mainView.middleView.startFetch.hidden = NO;
                         firstView.mainView.swipeDown1.hidden = NO;
                         firstView.mainView.swipeDown2.hidden = NO;
                         suggestionMainView.adsTableView.hidden = NO;
                         suggestionMainView.resBriefTableView.hidden = YES;
                         suggestionMainView.upperView.hidden = NO;
                         suggestionMainView.scroller.hidden = YES;
                         
                         NSLog(@"you may like button - animation finished!");
                         if ([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized) {
                             NSLog(@"do this");
                             [_manager fetchAdsAtCoordinate:self.locationManager.location.coordinate];
                         }
                     }];
}



-(IBAction)swipeDown:(id)sender
{
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [firstView setTransform:CGAffineTransformMakeTranslation(0.0, 0.0)];
                         
                         [suggestionMainView setTransform:CGAffineTransformMakeTranslation(0.0, 0.0)];
                     }
                     completion:^(BOOL finished){
                         firstView.mainView.middleView.btAction.hidden = NO;
                         firstView.mainView.middleView.startFetch.hidden = YES;
                         firstView.mainView.swipeDown1.hidden = YES;
                         firstView.mainView.swipeDown2.hidden = YES;

                         firstView.mainView.messageView.hidden  = NO;
                         firstView.mainView.settingView.hidden = NO;
                         NSLog(@"Done1!");
                     }];

}

-(IBAction)startToFetch:(id)sender
{
    NSLog(@"Start to fetch");
    if ([CLLocationManager locationServicesEnabled]) {
        NSLog(@"Location Services Enabled");
        switch ([CLLocationManager authorizationStatus]) {
            case kCLAuthorizationStatusAuthorized:
                NSLog(@"We have access to location services");
                [_manager fetchSuggestionsAtCoordinate:self.locationManager.location.coordinate];
                break;
            case kCLAuthorizationStatusDenied:
                NSLog(@"Location services denied by user");
                break;
            case kCLAuthorizationStatusRestricted:
                NSLog(@"Parental controls restrict location services");
                break;
            case kCLAuthorizationStatusNotDetermined:
                NSLog(@"Unable to determine, possibly not available");
                break;
            default:
                break;
        }
    }
    else {
        NSLog(@"Location Services Are Disabled");
    }

    }
@end
