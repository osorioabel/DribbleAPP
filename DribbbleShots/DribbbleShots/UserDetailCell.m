//
//  UserDetailCell.m
//  DribbbleShots
//
//  Created by Abel Osorio on 9/25/15.
//  Copyright © 2015 osorioabel. All rights reserved.
//

#import "UserDetailCell.h"


@implementation UserDetailCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = (UserDetailCell*)[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    self.userLabel = [[UILabel alloc]init];
    self.userAvatarView = [[UIImageView alloc]init];
    self.shotDescriptionView = [[UITextView alloc]init];
    [self configureCell];
    
    return self;
}

-(void)configureCell{
    
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:self.shot.imageUrl
                          options:0
                         progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                         }
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                            if (image) {
                                UIImage *newImage = [image resizedImageToFitInSize:self.userAvatarView.bounds.size scaleIfSmaller:NO];
                                self.userAvatarView.image = newImage;
                            }
                        }];
    self.userLabel.text= self.shot.User.name;
    self.shotDescriptionView.text = self.shot.shotDescription;
}

@end
