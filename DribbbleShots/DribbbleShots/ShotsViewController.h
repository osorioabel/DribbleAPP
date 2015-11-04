//
//  ShotsViewController.h
//  DribbbleShots
//
//  Created by Abel Osorio on 9/24/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shot.h"
#import "ShotDetailViewController.h"

@interface ShotsViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, assign) int page;
@property (nonatomic, strong) NSMutableArray *shots;
@property (nonatomic, strong) NSMutableArray *moreShots;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign) Shot* shotSelected;




@end
