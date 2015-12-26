//
//  BaseTabBarViewController.h
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/26.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBarViewController : UITabBarController <UITabBarControllerDelegate>

- (void)pushToViewController:(UIViewController *)viewController animation:(BOOL)animation;
- (void)presentToViewController:(UIViewController *)viewController animation:(BOOL)animation completion:(void(^)())completion;

@end
