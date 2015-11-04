//
//  User.h
//  DribbbleShots
//
//  Created by Abel Osorio on 9/24/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface User : MTLModel <MTLJSONSerializing>


@property (nonatomic, copy, readonly) NSNumber *userId;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *location;
@property (nonatomic, copy, readonly) NSDate * date;
@property (nonatomic, copy, readonly) NSNumber *followingCount;
@property (nonatomic, copy, readonly) NSNumber *followersCount;
@property (nonatomic, copy, readonly) NSNumber *shotsCount;
@property (nonatomic, copy, readonly) NSURL *userUrl;
@property (nonatomic, copy, readonly) NSURL *avatarUrl;
@property (nonatomic, copy, readonly) NSURL *shotsUrl;
@property (nonatomic, copy, readonly) NSURL *followingUrl;

@end
