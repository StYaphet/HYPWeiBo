//
//  testViewController.m
//  HYPWeiBo
//
//  Created by 郝一鹏 on 16/2/27.
//  Copyright © 2016年 bupt. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController

//- (void)loadView{
//    
//    CGRect screenRect = [[UIScreen mainScreen]bounds];
//    
//    CGRect statusBarRect = [[UIApplication sharedApplication] statusBarFrame];
//    
//    CGRect naviRect = self.navigationController.navigationBar.frame;
//    
//    CGRect scrollViewRect = CGRectMake(0, screenRect.origin.y - statusBarRect.size.height - naviRect.size.height, screenRect.size.width *3, screenRect.size.height - statusBarRect.size.height - naviRect.size.height);
//    
//    UIScrollView *aScrollView = [[UIScrollView alloc] initWithFrame:scrollViewRect];
//    
//    
//    
//}


- (void)setBackgroundColor:(UIColor *)color{
    self.view.backgroundColor = color;
    
}

- (void)setBackgroundImage:(UIImage *)image{
    UIImageView *aImageView = [[UIImageView alloc] initWithImage:image];
    self.view = aImageView;
    self.view.contentMode = UIViewContentModeScaleAspectFit;
}

@end
