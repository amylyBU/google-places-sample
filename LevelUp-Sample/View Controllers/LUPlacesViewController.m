//
//  LUPlacesViewController.m
//  LevelUp-Sample
//
//  Created by Amy Ly on 9/24/15.
//  Copyright © 2015 Amy Ly. All rights reserved.
//

#import "LUPlacesViewController.h"
#import "LUPlacesTableViewCell.h"
#import "UIScrollView+SVPullToRefresh.h"
#import "LUService.h"
@import GoogleMaps;

static NSString * const kLUPlacesTableViewCellIdentifier = @"LUPlacesCellIdentifier";

@interface LUPlacesViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *placesTableView;

@end

@implementation LUPlacesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    [[LUService shared] getNearbyLocations];
}

- (void)setUpTableView {
    self.placesTableView.delegate = self;
    self.placesTableView.dataSource = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTableViewContents:) name:kLocationsDidUpdateNotification object:[LUService shared]];
    [self.placesTableView registerNib:[UINib nibWithNibName:@"LUPlacesTableViewCell" bundle:nil] forCellReuseIdentifier:kLUPlacesTableViewCellIdentifier];
    self.placesTableView.estimatedRowHeight = UITableViewAutomaticDimension;
    [self.placesTableView addPullToRefreshWithActionHandler:^{
        [[LUService shared] getNearbyLocations];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [LUService shared].nearbyLocations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LUPlacesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLUPlacesTableViewCellIdentifier];
    GMSPlaceLikelihood *likelihood = [LUService shared].nearbyLocations[indexPath.row];
    GMSPlace *place = likelihood.place;
    [cell configureCellForGMSPlace:place];
    return cell;
}

#pragma mark - Notifications

- (void)updateTableViewContents:(NSNotification *)notification {
    
    [self.placesTableView reloadData];
    [self.placesTableView.pullToRefreshView stopAnimating];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
