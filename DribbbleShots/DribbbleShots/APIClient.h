//
//  APIClient.h
//  DribbbleShots
//
//  Created by Abel Osorio on 9/24/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPSessionManager.h>
@interface APIClient : AFHTTPSessionManager


+ (instancetype)sharedClient;

@end
