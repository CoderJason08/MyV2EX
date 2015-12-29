//
//  UserEntity.h
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/29.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import <Foundation/Foundation.h>

/** member */
@interface UserEntity : NSObject

@property (copy, nonatomic) NSString *avatar_large;
@property (copy, nonatomic) NSString *avatar_mini;
@property (copy, nonatomic) NSString *avatar_normal;
@property (copy, nonatomic) NSString *username;
@end
