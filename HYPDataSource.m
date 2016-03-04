//
//  HYPDataSource.m
//  HYPWeiBo
//
//  Created by 郝一鹏 on 16/3/3.
//  Copyright © 2016年 bupt. All rights reserved.
//

#import "HYPDataSource.h"

@implementation HYPDataSource

+ (instancetype)sharedStore{
    static HYPDataSource *sharedStore = nil;
    if (!nil) {
        sharedStore = [[self alloc] init];
    }
    return sharedStore;
}



- (NSDictionary *)getPublicWeibo{
    
    NSLog(@"getweibo");
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    
    NSLog(@"token是：%@",token);
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/public_timeline.json?access_token=%@",token];
    

    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *getPublicWeiboSession = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
    
    __block NSDictionary *pubilcWeiboJson = nil;
    
    NSURLSessionDataTask *pubilcWeiboTask = [getPublicWeiboSession dataTaskWithRequest:request completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
    NSDictionary *publicWeibo = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        pubilcWeiboJson = publicWeibo;
        NSLog(@"1...%@",pubilcWeiboJson);
    }];
    
    [pubilcWeiboTask resume];
    
    NSLog(@"2...%@",pubilcWeiboJson);
    
    return pubilcWeiboJson;
}

@end
