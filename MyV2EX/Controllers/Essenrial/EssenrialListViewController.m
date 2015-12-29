//
//  EssenrialListViewController.m
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/27.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import "EssenrialListViewController.h"
#import "TopicTableView.h"
#import "TopicEntity+request.h"
@interface EssenrialListViewController () <TopicListTableViewDelegate>

@property (strong, nonatomic) TopicTableView *topicTableView;

@end

@implementation EssenrialListViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topicTableView = [[TopicTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.topicTableView.topicListTableViewDelegate = self;
    [self.view addSubview:self.topicTableView];
    [self.topicTableView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TopicListTableViewDelegate

- (void)headerRefreshing {
    
    __weak typeof(self) weakself = self;
    [TopicEntity requestTopicListWithSuccessBlock:^(NSArray *topicArray) {
        
        weakself.topicTableView.topicListArray = topicArray;
        [weakself.topicTableView reloadData];
        
    } failureBlock:^(NSError *errorMessage) {
        
    }];
    
    [weakself.topicTableView.mj_header endRefreshing];
}

- (void)footerRereshing {
    
}
@end
