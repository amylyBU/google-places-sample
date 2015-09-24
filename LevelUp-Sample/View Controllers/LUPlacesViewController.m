//
//  LUPlacesViewController.m
//  LevelUp-Sample
//
//  Created by Amy Ly on 9/24/15.
//  Copyright © 2015 Amy Ly. All rights reserved.
//

#import "LUPlacesViewController.h"
#import "LUPlacesTableViewCell.h"

static NSString * const kLUPlacesTableViewCellIdentifier = @"LUPlacesCellIdentifier";

@interface LUPlacesViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *placesTableView;

@end

@implementation LUPlacesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
}

- (void)setUpTableView {
    self.placesTableView.delegate = self;
    self.placesTableView.dataSource = self;
    [self.placesTableView registerNib:[UINib nibWithNibName:@"LUPlacesTableViewCell" bundle:nil] forCellReuseIdentifier:kLUPlacesTableViewCellIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LUPlacesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLUPlacesTableViewCellIdentifier];
    // configure cell
    return cell;
}

#pragma mark - UITableViewDelegate

@end
