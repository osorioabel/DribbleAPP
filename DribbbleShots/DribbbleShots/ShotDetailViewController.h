//
//  ShotDetailViewController.h
//  DribbbleShots
//
//  Created by Abel Osorio on 9/25/15.
//  Copyright © 2015 osorioabel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shot.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <UIImage-Resize/UIImage+Resize.h>


@interface ShotDetailViewController : UIViewController

@property (nonatomic, assign) Shot* shot;
@property (weak, nonatomic) IBOutlet UIImageView *shotImageView;
@property (weak, nonatomic) IBOutlet UIImageView *userAvatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *shotUserLabel;
@property (weak, nonatomic) IBOutlet UITextView *shotDescription;


@end
