//
//  GMSPlace+Formatting.m
//  LevelUp-Sample
//
//  Created by Amy Ly on 9/25/15.
//  Copyright © 2015 Amy Ly. All rights reserved.
//

#import "GMSPlace+Formatting.h"


@implementation GMSPlace (Formatting)

+ (NSString *)formatOpenNowStatusForPlace:(GMSPlace *)place {
    switch (place.openNowStatus) {
        case kGMSPlacesOpenNowStatusYes:
            return @"Open Now";
        case kGMSPlacesOpenNowStatusNo:
            return @"Closed Now";
        case kGMSPlacesOpenNowStatusUnknown:
            return @"No Status";
    }
}

+ (NSString *)formatDollarSignForPlace:(GMSPlace *)place {
    switch (place.priceLevel) {
        case kGMSPlacesPriceLevelUnknown:
            return @"Price Level Unknown";
        case kGMSPlacesPriceLevelFree:
            return @"Free";
        case kGMSPlacesPriceLevelCheap:
            return @"$";
        case kGMSPlacesPriceLevelMedium:
            return @"$$";
        case kGMSPlacesPriceLevelHigh:
            return @"$$$";
        case kGMSPlacesPriceLevelExpensive:
            return @"$$$$";
    }
}

@end
