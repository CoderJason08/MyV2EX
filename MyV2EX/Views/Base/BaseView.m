//
//  BaseView.m
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/27.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5;
        self.layer.borderWidth = 0.5;
        self.backgroundColor = [UIColor clearColor];
        self.layer.backgroundColor = [UIColor whiteColor].CGColor;
        self.layer.borderColor = [UIColor colorWithRed:0.871 green:0.875 blue:0.878 alpha:1.000].CGColor;   
    }
    return self;
}

@end
