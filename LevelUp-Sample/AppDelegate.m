//
//  AppDelegate.m
//  LevelUp-Sample
//
//  Created by Amy Ly on 9/24/15.
//  Copyright © 2015 Amy Ly. All rights reserved.
//

#import "AppDelegate.h"
#import "LUPlacesViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface AppDelegate ()

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GMSServices provideAPIKey:@"AIzaSyBq6tmcS4pEnwg6LNyuXzoqgVCu85N-0Ek"];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    LUPlacesViewController *placesVC = [[LUPlacesViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:placesVC];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
