//
//  ShotDetailViewController.m
//  DribbbleShots
//
//  Created by Abel Osorio on 9/25/15.
//  Copyright © 2015 osorioabel. All rights reserved.
//

#import "ShotDetailViewController.h"

@implementation ShotDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setUpView];
    
}

-(void) setUpView{
    self.title=self.shot.title;
    self.shotDescription.text = self.shot.shotDescription;
    self.shotUserLabel.text = self.shot.User.name;
    [self.userAvatarImageView sd_setImageWithURL:self.shot.User.avatarUrl];
    self.userAvatarImageView.layer.cornerRadius = self.userAvatarImageView.frame.size.width / 2;
    self.userAvatarImageView.clipsToBounds = YES;
    self.userAvatarImageView.layer.borderWidth = 0.5;
    self.userAvatarImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.shotImageView sd_setImageWithURL:self.shot.imageUrl];
    
}

- (IBAction)sharePressed:(id)sender {
    
    NSString *textToShare = NSLocalizedString(@"Look at this awesome Shot from Dribbble!", nil);
    NSURL *shotUrl = self.shot.imageUrl;
    NSArray *objectsToShare = @[textToShare, shotUrl];
    
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    NSArray *excludedActivities = @[UIActivityTypeAirDrop,UIActivityTypePostToWeibo,
                                    UIActivityTypeMessage, UIActivityTypeMail,
                                    UIActivityTypePrint, UIActivityTypeCopyToPasteboard,
                                    UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll,
                                    UIActivityTypeAddToReadingList, UIActivityTypePostToFlickr,
                                    UIActivityTypePostToVimeo, UIActivityTypePostToTencentWeibo];
    controller.excludedActivityTypes = excludedActivities;
    
    [self presentViewController:controller animated:YES completion:nil];
    
    
}


@end
