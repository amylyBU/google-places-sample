//
//  LUService.m
//  LevelUp-Sample
//
//  Created by Amy Ly on 9/24/15.
//  Copyright © 2015 Amy Ly. All rights reserved.
//

#import "LUService.h"
#import "LUPlacesViewController.h"
@import GoogleMaps;

static LUService *_shared;
NSString * const kLocationsDidUpdateNotification = @"kLocationsDidUpdateNotification";


@implementation LUService {
    GMSPlacesClient *_placesClient;
}

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[LUService alloc] init];
    });
    return _shared;
}

- (void)getNearbyLocations {
    _placesClient = [GMSPlacesClient sharedClient];
    [_placesClient currentPlaceWithCallback:^(GMSPlaceLikelihoodList * _Nullable likelihoodList, NSError * _Nullable error) {
        if (error) {
            NSLog(@"ERROR %@", [error localizedDescription]);
            return;
        }
        self.nearbyLocations = likelihoodList.likelihoods;
        [[NSNotificationCenter defaultCenter] postNotificationName:kLocationsDidUpdateNotification object:self];
        
    }];
}

@end
