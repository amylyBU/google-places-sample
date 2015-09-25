//
//  GMSPlace+Formatting.h
//  LevelUp-Sample
//
//  Created by Amy Ly on 9/25/15.
//  Copyright © 2015 Amy Ly. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>

@interface GMSPlace (Formatting)

+ (NSString *)formatOpenNowStatusForPlace:(GMSPlace *)place;
+ (NSString *)formatDollarSignForPlace:(GMSPlace *)place;

@end
