//
//  LUPlacesViewController.m
//  LevelUp-Sample
//
//  Created by Amy Ly on 9/24/15.
//  Copyright © 2015 Amy Ly. All rights reserved.
//

#import "LUPlacesViewController.h"
#import "LUPlacesTableViewCell.h"
#import "LUService.h"
@import GoogleMaps;

static NSString * const kLUPlacesTableViewCellIdentifier = @"LUPlacesCellIdentifier";

@interface LUPlacesViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *placesTableView;
@property (strong, nonatomic) NSArray *nearbyLocations;

@end

@implementation LUPlacesViewController {
    GMSPlacesClient *_placesClient;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    [self getNearbyLocations];
}

- (void)setUpTableView {
    self.placesTableView.delegate = self;
    self.placesTableView.dataSource = self;
    [self.placesTableView registerNib:[UINib nibWithNibName:@"LUPlacesTableViewCell" bundle:nil] forCellReuseIdentifier:kLUPlacesTableViewCellIdentifier];
    self.placesTableView.estimatedRowHeight = UITableViewAutomaticDimension;
}

- (void)getNearbyLocations {
    _placesClient = [GMSPlacesClient sharedClient];
    
    [_placesClient currentPlaceWithCallback:^(GMSPlaceLikelihoodList * _Nullable likelihoodList, NSError * _Nullable error) {
        if (error) {
            NSLog(@"ERROR %@", [error localizedDescription]);
            return;
        }
        
        self.nearbyLocations = likelihoodList.likelihoods;
        [self.placesTableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger count = self.nearbyLocations.count;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LUPlacesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLUPlacesTableViewCellIdentifier];
    GMSPlaceLikelihood *likelihood = self.nearbyLocations[indexPath.row];
    GMSPlace *place = likelihood.place;
    [cell configureCellForGMSPlace:place];
    return cell;
}

#pragma mark - UITableViewDelegate


@end
