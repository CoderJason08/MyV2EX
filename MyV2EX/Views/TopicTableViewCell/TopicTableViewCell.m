//
//  TopicTableViewCell.m
//  MyV2EX
//
//  Created by 格式化油条 on 15/12/27.
//  Copyright © 2015年 XQBoy. All rights reserved.
//

#import "TopicTableViewCell.h"
#import "BaseView.h"
#import "TopicEntity.h"
#import "UserEntity.h"

static CGFloat topicListCellAvatarHeight = 38;

@interface TopicTableViewCell ()

@property (strong, nonatomic) BaseView *baseView;
@property (strong, nonatomic) UIImageView *avatarImageView;
@property (nonatomic, strong) UIImageView *circleImageView;
@property (strong, nonatomic) UILabel *topicTitleLabel;
@property (strong, nonatomic) UILabel *topicPublishTimeLabel;
@property (nonatomic, strong) UILabel *topicRepliesCountLabel;
@property (strong, nonatomic) UILabel *topicAvatarNameLabel;

@end

@implementation TopicTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
        [self.contentView addSubview:self.baseView];
        [self addAutoLayoutToCell];
    }
    return self;
}

- (void)addAutoLayoutToCell {
    
    CGFloat baseViewMargin = 8;
    CGFloat topicTitleMargin = 10;
    CGFloat topicTitleOffset = CGRectGetWidth(self.avatarImageView.frame) + topicTitleMargin * 2;
    
    [self.baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(baseViewMargin);
        make.left.offset(baseViewMargin);
        make.right.offset(-baseViewMargin);
        make.bottom.offset(-baseViewMargin);
    }];
    
    [self.topicTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(topicTitleMargin);
        make.left.offset(topicTitleOffset);
        make.right.equalTo(self.topicRepliesCountLabel.mas_left).offset(-topicTitleMargin);
    }];
    
    [self.topicAvatarNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.topicTitleLabel.mas_bottom).offset(topicTitleMargin);
        make.left.offset(topicTitleOffset);
        make.bottom.offset(-topicTitleMargin);
    }];
    
    [self.topicPublishTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topicAvatarNameLabel);
        make.left.mas_equalTo(self.topicAvatarNameLabel.mas_right).offset(topicTitleMargin);
    }];
    
    [self.topicRepliesCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        CGFloat topicRepliesCountHeight = 20;
        _topicRepliesCountLabel.layer.cornerRadius = topicRepliesCountHeight/2;
        _topicRepliesCountLabel.layer.shouldRasterize = YES;
        make.size.mas_equalTo(CGSizeMake(topicRepliesCountHeight, topicRepliesCountHeight));
        make.centerY.mas_equalTo(self.baseView.mas_centerY);
        make.right.equalTo(self.baseView).offset(-10);
    }];
}

- (void)setTopicEntity:(TopicEntity *)topicEntity {
    
    _topicEntity = topicEntity;
    
    self.topicTitleLabel.text = topicEntity.title;
    self.topicRepliesCountLabel.text = topicEntity.replies;
    self.topicPublishTimeLabel.text = [NSString stringWithTimestamp:topicEntity.created];
    self.topicAvatarNameLabel.text = topicEntity.member.username;
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@",[topicEntity.member.avatar_large substringFromIndex:2]]]];
}


- (BaseView *)baseView {
    if (!_baseView) {
        _baseView = [[BaseView alloc] init];
        
        [_baseView addSubview:self.avatarImageView];
        [_baseView addSubview:self.circleImageView];
        [_baseView addSubview:self.topicPublishTimeLabel];
        [_baseView addSubview:self.topicAvatarNameLabel];
        [_baseView addSubview:self.topicTitleLabel];
        [_baseView addSubview:self.topicRepliesCountLabel];
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
        _topicTitleLabel.font = [UIFont systemFontOfSize:13];
        _topicTitleLabel.numberOfLines = 2;
    }
    return _topicTitleLabel;
}

- (UILabel *)topicPublishTimeLabel {
    if (!_topicPublishTimeLabel) {
        _topicPublishTimeLabel = [[UILabel alloc] init];
        _topicPublishTimeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _topicPublishTimeLabel;
}

- (UILabel *)topicAvatarNameLabel {
    if (!_topicAvatarNameLabel) {
        _topicAvatarNameLabel = [[UILabel alloc] init];
        _topicAvatarNameLabel.font = [UIFont systemFontOfSize:12];
    }
    return _topicAvatarNameLabel;
}

- (UILabel *)topicRepliesCountLabel {
    if (!_topicRepliesCountLabel) {
        _topicRepliesCountLabel = [[UILabel alloc] init];
        _topicRepliesCountLabel.font = [UIFont systemFontOfSize:11];
        _topicRepliesCountLabel.numberOfLines = 1;
        _topicRepliesCountLabel.textColor = [UIColor whiteColor];
        _topicRepliesCountLabel.textAlignment = NSTextAlignmentCenter;
        _topicRepliesCountLabel.backgroundColor = [UIColor clearColor];
        _topicRepliesCountLabel.layer.backgroundColor = [UIColor colorWithRed:0.392 green:0.702 blue:0.945 alpha:1.000].CGColor;
    }
    return _topicRepliesCountLabel;
}

@end
