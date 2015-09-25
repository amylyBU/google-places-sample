//
//  LUPlacesTableViewCell.m
//  LevelUp-Sample
//
//  Created by Amy Ly on 9/24/15.
//  Copyright © 2015 Amy Ly. All rights reserved.
//

#import "LUPlacesTableViewCell.h"

@interface LUPlacesTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation LUPlacesTableViewCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)configureCellForGMSPlace:(GMSPlace *)place {
    self.nameLabel.text = place.name;
}

@end
