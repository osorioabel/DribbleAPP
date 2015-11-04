//
//  ShotsCell.h
//  DribbbleShots
//
//  Created by Abel Osorio on 9/24/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shot.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <UIImage-Resize/UIImage+Resize.h>

@interface ShotsCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *mainImageView;
@property (strong, nonatomic) IBOutlet UILabel *shotNameLabel;
@property (strong, nonatomic) IBOutlet UIView *gradientLayer;
@property (strong, nonatomic) Shot *shot;
-(void)configureCell;


@end
