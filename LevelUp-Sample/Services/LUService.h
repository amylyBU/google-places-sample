//
//  LUService.h
//  LevelUp-Sample
//
//  Created by Amy Ly on 9/24/15.
//  Copyright © 2015 Amy Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kLocationsDidUpdateNotification;

@interface LUService : NSObject

@property (strong, nonatomic) NSArray *nearbyLocations;

+ (instancetype)shared;
- (void)getNearbyLocations;

@end
