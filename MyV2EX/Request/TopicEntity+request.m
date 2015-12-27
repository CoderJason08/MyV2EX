//
//  TopicEntity+request.m
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/27.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import "TopicEntity+request.h"

@implementation TopicEntity (request)

+ (void)requestTopicListWithSuccessBlock:(RequestSuccessBlock)success failureBlock:(RequestFailureBlock)failureBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    [manager GET:kHotEssenrialListURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSArray *array = [MTLJSONAdapter modelsOfClass:[TopicEntity class] fromJSONArray:responseObject error:nil];
            ! success ? : success(array);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !failureBlock ? : failureBlock(error);
    }];
}

@end