//
//  TopicTableView.h
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/27.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 提供给外界刷新数据调用的API */
@protocol TopicListTableViewDelegate <NSObject>
- (void)headerRefreshing;
- (void)footerRereshing;
@end

@interface TopicTableView : UITableView
@property (nonatomic, assign) BOOL shouldRemoveHeaderView;
@property (strong, nonatomic) NSArray *topicListArray;
@property (nonatomic, weak) id<TopicListTableViewDelegate> topicListTableViewDelegate;
- (void)setupFooterView;
@end
