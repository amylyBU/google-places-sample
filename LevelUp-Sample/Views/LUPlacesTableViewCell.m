//
//  LUPlacesTableViewCell.m
//  LevelUp-Sample
//
//  Created by Amy Ly on 9/24/15.
//  Copyright © 2015 Amy Ly. All rights reserved.
//

#import "LUPlacesTableViewCell.h"
#import "GMSPlace+Formatting.h"

@interface LUPlacesTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *openStatusLabel;

@end


@implementation LUPlacesTableViewCell

- (void)configureCellForGMSPlace:(GMSPlace *)place {
    self.place = place;
    self.nameLabel.text = place.name;
    self.addressLabel.text = place.formattedAddress;
    self.openStatusLabel.text = [GMSPlace formatOpenNowStatusForPlace:place];
}

@end
