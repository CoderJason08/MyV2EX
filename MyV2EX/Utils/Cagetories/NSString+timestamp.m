//
//  NSString+timestamp.m
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/29.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import "NSString+timestamp.h"

@implementation NSString (timestamp)

+ (NSString *)stringWithTimestamp:(NSString *)timestamp {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}
@end
