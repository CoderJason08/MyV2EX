//
//  AppDelegate.h
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/26.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseTabBarViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BaseTabBarViewController *tabBarViewController;
@end

