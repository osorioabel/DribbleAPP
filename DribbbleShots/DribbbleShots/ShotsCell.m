//
//  ShotsCell.m
//  DribbbleShots
//
//  Created by Abel Osorio on 9/24/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import "ShotsCell.h"



@implementation ShotsCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = (ShotsCell*)[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    self.mainImageView = [[UIImageView alloc]init];
    self.shotNameLabel = [[UILabel alloc]init];
    self.gradientLayer = [[UIView alloc]init];
    
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
                                UIImage *newImage = [image resizedImageToFitInSize:self.mainImageView.bounds.size scaleIfSmaller:NO];
                                self.mainImageView.image = newImage;
                            }
                        }];
    self.shotNameLabel.text= self.shot.title;
}

@end
