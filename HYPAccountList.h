//
//  HYPAccountList.h
//  HYPWeiBo
//
//  Created by 郝一鹏 on 16/3/4.
//  Copyright © 2016年 bupt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HYPAccount;

@interface HYPAccountList : NSObject

+ (void)savaAcountsWithAccount:(HYPAccount *)account;
+ (HYPAccount *)account;

@end
