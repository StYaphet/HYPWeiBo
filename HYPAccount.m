//
//  HYPAccount.m
//  HYPWeiBo
//
//  Created by 郝一鹏 on 16/3/4.
//  Copyright © 2016年 bupt. All rights reserved.
//

#import "HYPAccount.h"

@interface HYPAccount () <NSCoding>

@end

@implementation HYPAccount


- (instancetype)initWithToken:(NSString *)token uid:(NSString *)uid expiresIn:(NSString *)expiresIn{
    
    self = [super init];
    
    if (self) {
        self.token = token;
        self.uid = uid;
        self.expiresIn = expiresIn;
        int timeInterval = [expiresIn intValue];
        self.timeOut = [NSDate dateWithTimeIntervalSinceNow:timeInterval];

    }
    
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.token forKey:@"token"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.expiresIn forKey:@"expiresIn"];
    [aCoder encodeObject:self.timeOut forKey:@"timeOut"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        _token = [aDecoder decodeObjectForKey:@"token"];
        _uid = [aDecoder decodeObjectForKey:@"uid"];
        _expiresIn = [aDecoder decodeObjectForKey:@"expiresIn"];
        _timeOut = [aDecoder decodeObjectForKey:@"timeOut"];
    }
    
    NSLog(@"解固后的token为：%@",_token);
    
    return self;
}


@end
