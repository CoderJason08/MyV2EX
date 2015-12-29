//
//  NSString+timestamp.h
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/29.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (timestamp)

/** 将时间戳转为yyyy-MM-dd HH:mm 格式 */
+ (NSString *)stringWithTimestamp:(NSString *)timestamp;

@end
