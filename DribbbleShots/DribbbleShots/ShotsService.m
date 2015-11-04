//
//  ShotsService.m
//  DribbbleShots
//
//  Created by Abel Osorio on 9/24/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import "ShotsService.h"
#import "APIClient.h"
#import <Mantle.h>
#import "Shot.h"

NSString *const popularShotsUrl = @"v1/shots?access_token=dc5a71673c52e02fb510a7bf514789a90c1d9c169c13edbd92e5e19ba74a5f56&page=";

@implementation ShotsService


+(void)getPopularShotsFromPage:(int)pageNumber onCompletation:(void (^)(id response, NSError *error))completionBlock{
    
    __block NSMutableArray *popularShots = nil;
    __block NSError *error = nil;
    NSString * url = [NSString stringWithFormat:@"%@%d",popularShotsUrl,pageNumber];
    [[APIClient sharedClient] GET:url parameters:nil success:^(NSURLSessionDataTask * __unused task, id responseObject ) {
        popularShots = [[NSMutableArray alloc] initWithCapacity:[responseObject count]];
        for (NSDictionary *JSONnoteData in responseObject) {
            Shot*shot = [MTLJSONAdapter modelOfClass:[Shot class] fromJSONDictionary:JSONnoteData error:&error];
            if (error) {
                NSLog(@"%@",error);
            }else{
                if (shot) [popularShots addObject:shot];
            }
        }
        completionBlock(popularShots,nil);
        
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        completionBlock(popularShots,nil);
    }];
    
}



@end
