//
//  APIClient.m
//  DribbbleShots
//
//  Created by Abel Osorio on 9/24/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import "APIClient.h"
#import <AFNetworkActivityIndicatorManager.h>

static NSString * const APIBaseURLString = @"https://api.dribbble.com/";

@implementation APIClient

+(instancetype)sharedClient {
    static APIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:20 * 1024 * 1024     // 10MB. memory cache
                                                          diskCapacity:100 * 1024 * 1024     // 50MB. on disk cache
                                                              diskPath:nil];
        sessionConfiguration.URLCache = cache;
        sessionConfiguration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
        _sharedClient = [[APIClient alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURLString] sessionConfiguration:sessionConfiguration];
    });
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    
    self = [super initWithBaseURL:url];
    if(self) {
    }
    
    return self;
}

- (instancetype)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)configuration
{
    self = [super initWithBaseURL:url sessionConfiguration:configuration];
    if (!self) return nil;
    self.requestSerializer.timeoutInterval= 40.0;
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
    return self;
}
-(NSString*) APIURL{
    
    return APIBaseURLString;
}

@end
