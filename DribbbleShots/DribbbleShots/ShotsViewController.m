//
//  ShotsViewController.m
//  DribbbleShots
//
//  Created by Abel Osorio on 9/24/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import "ShotsViewController.h"
#import "ShotsService.h"
#import "ShotsCell.h"
#import <SVPullToRefresh.h>



@implementation ShotsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setUpView];
    [self retrieveShotsFromPage:1];
}

-(void) setUpView{
    self.title=NSLocalizedString(@"Dribble Shots", nil);
    self.page=1;
    __weak ShotsViewController *weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        self.shots=nil;
        self.page=1;
        [weakSelf retrieveShotsFromPage:1];
    }];
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [self insertShotsAtBottom];
    }];
    
}

- (void)insertShotsAtBottom {
    __weak ShotsViewController *weakSelf = self;
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(backgroundQueue, ^{
        [weakSelf retrieveShotsFromPage:self.page];
        for (int i=0; i<self.moreShots.count; i++) {
            [weakSelf.tableView beginUpdates];
            [weakSelf.shots addObject:[self.moreShots objectAtIndex:i]];
            [weakSelf.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:weakSelf.shots.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationBottom];
            [weakSelf.tableView endUpdates];
        }
        [weakSelf.tableView.infiniteScrollingView stopAnimating];
    });
}


-(void) retrieveShotsFromPage:(int)pageNumber{
    
    [ShotsService getPopularShotsFromPage:pageNumber onCompletation:^(id shots, NSError *error){
        if (!error) {
            if (self.page!=1) {
                self.moreShots = shots;
            }else{
                self.shots = shots;
                [self.tableView reloadData];
            }
            self.page=self.page+1;
        }else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Shots"
                                                                message:[error localizedDescription]
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shots.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 260;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ShotsCell*cell = (ShotsCell*)[tableView dequeueReusableCellWithIdentifier:@"shotCell"];
    cell.selectionStyle= UITableViewCellSelectionStyleNone;
    cell.shot = [self.shots objectAtIndex:indexPath.row];
    [cell configureCell];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.shotSelected = [self.shots objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"shotDetail" sender:nil];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"shotDetail"]) {
        ShotDetailViewController * detailVC = (ShotDetailViewController*) segue.destinationViewController;
        detailVC.shot=self.shotSelected;
    }
}




@end
