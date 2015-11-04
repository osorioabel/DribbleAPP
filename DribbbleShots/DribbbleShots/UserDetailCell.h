//
//  UserDetailCell.h
//  DribbbleShots
//
//  Created by Abel Osorio on 9/25/15.
//  Copyright © 2015 osorioabel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shot.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <UIImage-Resize/UIImage+Resize.h>

@interface UserDetailCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UIImageView *userAvatarView;
@property (strong, nonatomic) IBOutlet UILabel *userLabel;
@property (strong, nonatomic) IBOutlet UITextView *shotDescriptionView;
@property (strong, nonatomic) Shot *shot;
-(void)configureCell;


@end
