//
//  TopicTableViewCell.m
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/27.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import "TopicTableViewCell.h"
#import "BaseView.h"

static CGFloat topicListCellAvatarHeight = 38;

@interface TopicTableViewCell ()

@property (strong, nonatomic) BaseView *baseView;
@property (strong, nonatomic) UIImageView *avatarImageView;
@property (nonatomic, strong) UIImageView *circleImageView;
@property (strong, nonatomic) UILabel *topicTitleLabel;
@property (strong, nonatomic) UILabel *topicPublishTimeLabel;
@property (strong, nonatomic) UILabel *topicAvatarNameLabel;

@end

@implementation TopicTableViewCell


- (void)addAutoLayoutToCell {
    
    CGFloat baseViewMargin = 8;
    CGFloat topicTitleMargin = 10;
    CGFloat topicTitleOffset = CGRectGetWidth(self.avatarImageView.frame) + topicTitleMargin * 2;
    
    [self.baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(0);
        make.left.equalTo(self.contentView.mas_left).offset(baseViewMargin);
        make.right.equalTo(self.contentView.mas_right).offset(-baseViewMargin);
        make.bottom.equalTo(self.contentView).offset(-baseViewMargin);
    }];
    
    [self.topicTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseView.mas_top).offset(topicTitleMargin);
        make.left.equalTo(self.baseView.mas_left).offset(topicTitleOffset);
        make.right.offset(-topicTitleMargin);
    }];
}

- (BaseView *)baseView {
    if (!_baseView) {
        _baseView = [[BaseView alloc] init];
        
        [_baseView addSubview:self.avatarImageView];
        [_baseView addSubview:self.circleImageView];
        [_baseView addSubview:self.topicPublishTimeLabel];
        [_baseView addSubview:self.topicAvatarNameLabel];
        [_baseView addSubview:self.topicTitleLabel];
    }
    return _baseView;
}

- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, topicListCellAvatarHeight, topicListCellAvatarHeight)];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
        _avatarImageView.userInteractionEnabled = YES;
        //        UITapGestureRecognizer *tapAvatar = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAvatarImageView)];
        //        [_avatarImageView addGestureRecognizer:tapAvatar];
    }
    return _avatarImageView;
}

- (UIImageView *)circleImageView {
    if (!_circleImageView) {
        _circleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, topicListCellAvatarHeight, topicListCellAvatarHeight)];
        _circleImageView.image = [UIImage imageNamed:@"corner_circle"];
    }
    return _circleImageView;
}

- (UILabel *)topicTitleLabel {
    if (!_topicTitleLabel) {
        _topicTitleLabel = [[UILabel alloc] init];
        _topicTitleLabel.font = [UIFont systemFontOfSize:14];
        _topicTitleLabel.numberOfLines = 2;
    }
    return _topicTitleLabel;
}

- (UILabel *)topicPublishTimeLabel {
    if (!_topicPublishTimeLabel) {
        _topicPublishTimeLabel = [[UILabel alloc] init];
        _topicPublishTimeLabel.font = [UIFont systemFontOfSize:13];
    }
    return _topicPublishTimeLabel;
}

- (UILabel *)topicAvatarNameLabel {
    if (!_topicAvatarNameLabel) {
        _topicAvatarNameLabel = [[UILabel alloc] init];
        _topicAvatarNameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _topicAvatarNameLabel;
}
@end
