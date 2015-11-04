//
//  Shot.h
//  DribbbleShots
//
//  Created by Abel Osorio on 9/24/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>
#import "User.h"

@interface Shot : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSNumber *shotId;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *shotDescription;
@property (nonatomic, copy, readonly) NSDate * date;
@property (nonatomic, copy, readonly) NSNumber *commentCount;
@property (nonatomic, copy, readonly) NSNumber *likesCount;
@property (nonatomic, copy, readonly) NSNumber *viewCount;
@property (nonatomic, copy, readonly) NSURL *commentUrl;
@property (nonatomic, copy, readonly) NSURL *imageUrl;
@property (nonatomic, copy, readonly) User *User;





@end
