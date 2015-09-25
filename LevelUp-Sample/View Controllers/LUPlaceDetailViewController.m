//
//  LUPlaceDetailViewController.m
//  LevelUp-Sample
//
//  Created by Amy Ly on 9/24/15.
//  Copyright © 2015 Amy Ly. All rights reserved.
//

#import "LUPlaceDetailViewController.h"
#import "GMSPlace+Formatting.h"

@interface LUPlaceDetailViewController ()

@property (strong, nonatomic) GMSPlace *place;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *dollarSignLabel;
@property (weak, nonatomic) IBOutlet UILabel *openStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@end


@implementation LUPlaceDetailViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (instancetype)initWithGMSPlace:(GMSPlace *)place {
    self = [super init];
    if (self) {
        _place = place;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.nameLabel.text = self.place.name;
    self.addressLabel.text = self.place.formattedAddress;
    self.dollarSignLabel.text = [GMSPlace formatDollarSignForPlace:self.place];
    self.openStatusLabel.text = [GMSPlace formatOpenNowStatusForPlace:self.place];
    self.phoneLabel.text =self.place.phoneNumber;
}

@end
