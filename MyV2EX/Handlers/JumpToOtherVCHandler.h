//
//  JumpToOtherVCHandler.h
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/26.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JumpToOtherVCHandler : NSObject

+ (UIViewController *)getBaseTabBarViewController;
+ (void)pushToOtherViewController:(UIViewController *)otherViewController animation:(BOOL)animation;
+ (void)presentToOtherViewController:(UIViewController *)otherViewController animation:(BOOL)animation completion:(void(^)())completion;

@end
