//
//  TopicTableView.m
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/27.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import "TopicTableView.h"
#import "TopicTableViewCell.h"

@interface TopicTableView () <UITableViewDelegate,UITableViewDataSource>



@end

@implementation TopicTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
        self.topicListArray = [NSArray array];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registerClass:[TopicTableViewCell class] forCellReuseIdentifier:NSStringFromClass([TopicTableViewCell class])];
        [self setupHeaderView];
        [self reloadData];
    }
    return self;
}

- (void)setupHeaderView {
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.font = [UIFont fontWithName:FontName size:13];
    self.mj_header = header;
}

- (void)setupFooterView {
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    footer.stateLabel.font = [UIFont fontWithName:FontName size:13];
    self.mj_footer = footer;
}

- (void)refreshData {
    if (_topicListTableViewDelegate && [_topicListTableViewDelegate respondsToSelector:@selector(headerRefreshing)]) {
        [_topicListTableViewDelegate headerRefreshing];
    }
}

- (void)loadMoreData {
    if (_topicListTableViewDelegate && [_topicListTableViewDelegate respondsToSelector:@selector(footerRereshing)]) {
        [_topicListTableViewDelegate footerRereshing];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
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

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([TopicTableViewCell class]) cacheByIndexPath:indexPath configuration:^(TopicTableViewCell * cell) {
        
        [self setupModelWithCell:cell atIndexPath:indexPath];
    }];
}


@end
