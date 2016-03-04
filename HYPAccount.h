//
//  HYPAccount.h
//  HYPWeiBo
//
//  Created by 郝一鹏 on 16/3/4.
//  Copyright © 2016年 bupt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYPAccount : NSObject

@property (nonatomic,copy) NSString *token;
@property (nonatomic,copy) NSString *uid;
@property (nonatomic,copy) NSString *expiresIn;

- (instancetype)initWithToken:(NSString *)token uid:(NSString *)uid expiresIn:(NSString *)expiresIn;

@end
