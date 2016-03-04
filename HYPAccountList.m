//
//  HYPAccountList.m
//  HYPWeiBo
//
//  Created by 郝一鹏 on 16/3/4.
//  Copyright © 2016年 bupt. All rights reserved.
//

#import "HYPAccountList.h"
#import "HYPAccount.h"

@implementation HYPAccountList

+ (BOOL)savaAcountsWithAccount:(HYPAccount *)account{
    
    NSArray *documentDictionaries = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDictionary = [documentDictionaries firstObject];
    
    NSString *path = [documentDictionary stringByAppendingPathComponent:@"account.archive"];
    
    NSLog(@"保存account");
    
    return [NSKeyedArchiver archiveRootObject:account toFile:path];
    
    
    
}

+ (HYPAccount *)account{
    
    NSArray *documentDictionaries = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDictionary = [documentDictionaries firstObject];
    
    NSString *path = [documentDictionary stringByAppendingPathComponent:@"account.archive"];
    
    HYPAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    NSLog(@"取出Account");
    
    return account;
}
@end
