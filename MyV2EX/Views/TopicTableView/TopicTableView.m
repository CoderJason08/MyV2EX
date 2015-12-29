//
//  TopicTableView.m
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/27.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import "TopicTableView.h"
#import "TopicTableViewCell.h"
#import "TopicEntity+request.h"
@interface TopicTableView () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSArray *topicListArray;

@end

@implementation TopicTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
        self.topicListArray = [NSArray array];
        [self loadTopicListData];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registerClass:[TopicTableViewCell class] forCellReuseIdentifier:NSStringFromClass([TopicTableViewCell class])];
    }
    return self;
}

- (void)loadTopicListData {
    
    [TopicEntity requestTopicListWithSuccessBlock:^(NSArray *topicArray) {
        
        self.topicListArray = topicArray;
        [self reloadData];
        
    } failureBlock:^(NSError *errorMessage) {
        
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.topicListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TopicTableViewCell class])];
    
    [self setupModelWithCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)setupModelWithCell:(TopicTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.topicEntity = self.topicListArray[indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([TopicTableViewCell class]) cacheByIndexPath:indexPath configuration:^(TopicTableViewCell * cell) {
        
        [self setupModelWithCell:cell atIndexPath:indexPath];
    }];
}


@end
