//
//  TopicListContainerViewController.m
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/29.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import "TopicListContainerViewController.h"
#import "TopicListViewController.h"
#import "TitlePagerView.h"
#define DidTapStatusBar @"DidTapStatusBar"

@interface TopicListContainerViewController () <ViewPagerDataSource, ViewPagerDelegate,TitlePagerViewDelegate>
@property (nonatomic, strong) TopicListViewController *newestTopicListVC;
@property (nonatomic, strong) TopicListViewController *skillTopicListVC;
@property (nonatomic, strong) TopicListViewController *originalityTopicListVC;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) TitlePagerView *pagingTitleView;
@end

@implementation TopicListContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = self;
    self.delegate = self;
    self.manualLoadData = YES;
    self.currentIndex = 0;
    
    self.navigationItem.titleView = self.pagingTitleView;
    
    [self reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DidTapStatusBar object:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarTappedAction:) name:DidTapStatusBar object:nil];
}

- (void)statusBarTappedAction:(NSNotification*)notification {
    if (self.currentIndex == 0 && self.newestTopicListVC) {
        [self.newestTopicListVC.tableView setContentOffset:CGPointZero animated:YES];
    } else if (self.currentIndex == 1 && self.skillTopicListVC) {
        [self.skillTopicListVC.tableView setContentOffset:CGPointZero animated:YES];
    } else if (self.currentIndex == 2 && self.originalityTopicListVC) {
        [self.originalityTopicListVC.tableView setContentOffset:CGPointZero animated:YES];
    }
}

#pragma mark - ViewPagerDataSource


- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
    return 3;
}

- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    if (index == 0) {
        return [self createNewestVC];
    } else if (index == 1) {
        return [self createSkillVC];
    } else {
        return [self createOriginalityVC];
    }
}

- (UIViewController *)createNewestVC {
    self.newestTopicListVC = [[TopicListViewController alloc] init];
    self.newestTopicListVC.topicListType = TopicListTypeNewest;
    self.newestTopicListVC.view.backgroundColor = [UIColor blueColor];
    self.newestTopicListVC.isFromTopicContainer = YES;
    return self.newestTopicListVC;
}

- (UIViewController *)createSkillVC {
    self.skillTopicListVC = [[TopicListViewController alloc] init];
    self.skillTopicListVC.topicListType = TopicListTypeSkill;
    self.skillTopicListVC.view.backgroundColor = [UIColor yellowColor];
    self.skillTopicListVC.isFromTopicContainer = YES;
    return self.skillTopicListVC;
}

- (UIViewController *)createOriginalityVC {
    self.originalityTopicListVC = [[TopicListViewController alloc] init];
    self.originalityTopicListVC.topicListType = TopicListTypeOriginality;
    self.originalityTopicListVC.view.backgroundColor = [UIColor redColor];
    self.originalityTopicListVC.isFromTopicContainer = YES;
    return self.originalityTopicListVC;
}

- (void)viewPager:(ViewPagerController *)viewPager didChangeTabToIndex:(NSUInteger)index {
    self.currentIndex = index;
}

- (TitlePagerView *)pagingTitleView {
    if (!_pagingTitleView) {
        self.pagingTitleView = [[TitlePagerView alloc] init];
        self.pagingTitleView.frame = CGRectMake(0, 0, 0, 40);
        self.pagingTitleView.font = [UIFont systemFontOfSize:14];
        NSArray *titleArray = @[@"最新", @"技术", @"创意"];
        self.pagingTitleView.width = [TitlePagerView calculateTitleWidth:titleArray withFont:self.pagingTitleView.font];
        [self.pagingTitleView addObjects:titleArray];
        self.pagingTitleView.delegate = self;
    }
    return _pagingTitleView;
}


- (void)didTouchBWTitle:(NSUInteger)index {
    //    NSInteger index;
    UIPageViewControllerNavigationDirection direction;
    
    if (self.currentIndex == index) {
        return;
    }
    
    if (index > self.currentIndex) {
        direction = UIPageViewControllerNavigationDirectionForward;
    } else {
        direction = UIPageViewControllerNavigationDirectionReverse;
    }
    
    UIViewController *viewController = [self viewControllerAtIndex:index];
    
    if (viewController) {
        __weak typeof(self) weakself = self;
        [self.pageViewController setViewControllers:@[viewController] direction:direction animated:YES completion:^(BOOL finished) {
            weakself.currentIndex = index;
        }];
    }
}

- (void)setCurrentIndex:(NSInteger)index {
    _currentIndex = index;
    [self.pagingTitleView adjustTitleViewByIndex:index];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    
    if (self.currentIndex != 0 && contentOffsetX <= SCREEN_WIDTH * 2) {
        contentOffsetX += SCREEN_WIDTH * self.currentIndex;
    }
    
    [self.pagingTitleView updatePageIndicatorPosition:contentOffsetX];
}

- (void)scrollEnabled:(BOOL)enabled {
    self.scrollingLocked = !enabled;
    
    for (UIScrollView *view in self.pageViewController.view.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            view.scrollEnabled = enabled;
            view.bounces = enabled;
        }
    }
}

@end
