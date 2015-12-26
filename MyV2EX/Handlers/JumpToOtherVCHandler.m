//
//  JumpToOtherVCHandler.m
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/26.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import "JumpToOtherVCHandler.h"
#import "AppDelegate.h"
#import "BaseTabBarViewController.h"
@implementation JumpToOtherVCHandler

+ (UIViewController *)getBaseTabBarViewController {
    
    BaseTabBarViewController *tabBarVC = [(AppDelegate *)[UIApplication sharedApplication].delegate tabBarViewController];
    return tabBarVC;
}

+ (void)pushToOtherViewController:(UIViewController *)otherViewController animation:(BOOL)animation {
    
   BaseTabBarViewController *tabBarVC = (BaseTabBarViewController *) [self getBaseTabBarViewController];
    [tabBarVC pushToViewController:otherViewController animation:animation];
}

+ (void)presentToOtherViewController:(UIViewController *)otherViewController animation:(BOOL)animation completion:(void(^)())completion {
       BaseTabBarViewController *tabBarVC = (BaseTabBarViewController *) [self getBaseTabBarViewController];
    [tabBarVC presentToViewController:[[UINavigationController alloc] initWithRootViewController:otherViewController] animation:animation completion:completion];
}

@end
