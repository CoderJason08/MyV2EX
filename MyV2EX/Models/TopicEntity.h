//
//  TopicEntity.h
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/27.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import <Mantle/Mantle.h>
@class UserEntity;
//@interface TopicEntity : MTLModel <MTLJSONSerializing>
@interface TopicEntity : NSObject

@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *topic_id;
@property (copy, nonatomic) NSString *created;
@property (copy, nonatomic) NSString *last_modified;
@property (copy, nonatomic) NSString *last_touched;
@property (copy, nonatomic) NSString *replies;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *url;

@property (strong, nonatomic) UserEntity *member;

@end
