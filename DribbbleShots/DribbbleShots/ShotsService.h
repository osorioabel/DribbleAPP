//
//  ShotsService.h
//  DribbbleShots
//
//  Created by Abel Osorio on 9/24/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShotsService : NSObject

+ (void)getPopularShotsFromPage:(int)pageNumber onCompletation:(void (^)(id response, NSError *error))completionBlock;
@end
