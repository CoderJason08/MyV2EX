//
//  TopicEntity+request.h
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/27.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import "TopicEntity.h"

typedef void(^RequestSuccessBlock)(NSArray *topicArray);
typedef void(^RequestFailureBlock)(NSError *errorMessage);

@interface TopicEntity (request)

+ (void)requestTopicListWithSuccessBlock:(RequestSuccessBlock)success failureBlock:(RequestFailureBlock)failureBlock;

@end
