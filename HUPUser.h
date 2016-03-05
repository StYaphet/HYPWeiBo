//
//  HUPUser.h
//  HYPWeiBo
//
//  Created by 郝一鹏 on 16/3/4.
//  Copyright © 2016年 bupt. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface HUPUser : MTLModel
/** 用户id */
@property (nonatomic,copy) NSString *userID;
/** 用户头像 */
@property (nonatomic, copy) NSString *profileImageURL;
/** 用户昵称 */
@property (nonatomic, copy) NSString *name;

@end
