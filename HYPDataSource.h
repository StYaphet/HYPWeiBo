//
//  HYPDataSource.h
//  HYPWeiBo
//
//  Created by 郝一鹏 on 16/3/3.
//  Copyright © 2016年 bupt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYPDataSource : NSObject

+ (instancetype)sharedStore;
- (NSDictionary *)getPublicWeibo;

@end
