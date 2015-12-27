//
//  UIViewController+Custom.m
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/27.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import "UIViewController+Custom.h"
#import <objc/runtime.h>
@implementation UIViewController (Custom)

+ (void)load {
    
    Method systemViewWillAppear = class_getInstanceMethod(self, @selector(viewWillAppear:));
    Method customViewWillAppaer = class_getInstanceMethod(self, @selector(xq_customViewWillAppear:));
    method_exchangeImplementations(systemViewWillAppear, customViewWillAppaer);
}

- (void)xq_customViewWillAppear:(BOOL)animation {
    
    [self xq_customViewWillAppear:animation];
  
    BOOL modelPresent = (BOOL)self.presentedViewController;
    if (modelPresent) {
        [self xq_createCancelButton];
    }
    
    if ([self.navigationController.viewControllers indexOfObject:self] != 0  && !self.navigationItem.hidesBackButton) {
        [self xq_createBackButton];
    }
}

/** 返回按钮 */
- (void)xq_createBackButton {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(xq_closeView)];
}

/** 取消按钮 */
- (void)xq_createCancelButton {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"cancel"] style:UIBarButtonItemStylePlain target:self action:@selector(xq_closeView)];
}

- (void)xq_closeView {
    
    BOOL modelPresent = (BOOL)self.presentedViewController;
    
    if (modelPresent) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
