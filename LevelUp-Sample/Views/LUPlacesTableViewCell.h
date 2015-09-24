//
//  LUPlacesTableViewCell.h
//  LevelUp-Sample
//
//  Created by Amy Ly on 9/24/15.
//  Copyright © 2015 Amy Ly. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMaps;

@interface LUPlacesTableViewCell : UITableViewCell

- (void)configureCellForGMSPlace:(GMSPlace *)place;

@end
