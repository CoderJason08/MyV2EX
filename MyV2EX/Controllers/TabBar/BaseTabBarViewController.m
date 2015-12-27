//
//  BaseTabBarViewController.m
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/26.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "EssenrialListViewController.h"
#import "ClassifyListViewController.h"
#import "MeViewController.h"

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    [self initializeSubViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeSubViewController {
    
    EssenrialListViewController *essenrialListVC = [[EssenrialListViewController alloc] init];
    [self setUpTabBarItemWithViewController:essenrialListVC title:@"最热"];
    
    ClassifyListViewController *classifyListVC = [[ClassifyListViewController alloc] init];
    [self setUpTabBarItemWithViewController:classifyListVC title:@"分类"];
    
    MeViewController *meVC = [[MeViewController alloc] init];
    [self setUpTabBarItemWithViewController:meVC title:@"我的"];
}

- (void)setUpTabBarItemWithViewController:(UIViewController *)viewController title:(NSString *)title {
    
    viewController.title = title;
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    [self addChildViewController:navigationVC];
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 0.25f;
    [self.view.layer addAnimation:transition forKey:@"fadeTransition"];
    
    return YES;
}

- (void)pushToViewController:(UIViewController *)viewController animation:(BOOL)animation {
    
    if ([self.selectedViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationVC = (UINavigationController *)self.selectedViewController;
        [navigationVC pushViewController:viewController animated:animation];
    }
}

- (void)presentToViewController:(UIViewController *)viewController animation:(BOOL)animation completion:(void (^)())completion {
    
    if ([self.selectedViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationVC = (UINavigationController *)self.selectedViewController;
        [navigationVC presentViewController:viewController animated:animation completion:completion];
    }
}


@end
