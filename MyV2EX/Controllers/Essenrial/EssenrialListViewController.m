//
//  EssenrialListViewController.m
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/27.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import "EssenrialListViewController.h"
#import "TopicTableView.h"

@interface EssenrialListViewController ()

@property (strong, nonatomic) TopicTableView *topicTableView;

@end

@implementation EssenrialListViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topicTableView = [[TopicTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.topicTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
}

@end
