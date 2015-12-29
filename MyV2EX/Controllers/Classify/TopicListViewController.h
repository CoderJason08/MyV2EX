//
//  TopicListViewController.h
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/29.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicTableView.h"

typedef NS_ENUM(NSInteger, TopicListType) {
    TopicListTypeNewest = 0,
    TopicListTypeSkill = 1,
    TopicListTypeOriginality = 2,

};

@interface TopicListViewController : UIViewController
@property (nonatomic) TopicListType topicListType;
@property (strong, nonatomic) TopicTableView *tableView;
@property (nonatomic, assign) BOOL isFromTopicContainer;
@end
