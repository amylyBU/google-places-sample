//
//  LUService.m
//  LevelUp-Sample
//
//  Created by Amy Ly on 9/24/15.
//  Copyright © 2015 Amy Ly. All rights reserved.
//

#import "LUService.h"
@import GoogleMaps;

static LUService *_shared;

@implementation LUService

#pragma mark - Singleton

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[LUService alloc] init];
    });
    return _shared;
}

@end
