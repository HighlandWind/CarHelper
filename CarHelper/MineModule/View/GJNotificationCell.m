//
//  GJNotificationCell.m
//  CarHelper
//
//  Created by hsrd on 2018/9/17.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJNotificationCell.h"

@interface GJNotificationCell ()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIImageView *logoImgV;
@property (nonatomic, strong) UILabel *timeLB;
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *detailLB;
@end

@implementation GJNotificationCell

- (void)commonInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    _backView = [[UIView alloc] init];
    _backView.backgroundColor = [UIColor whiteColor];
    _backView.layer.cornerRadius = (self.height - AdaptatSize(30)) / 2;
    _backView.clipsToBounds = YES;
    
    _timeLB = [[UILabel alloc] init];
    _timeLB.font = [APP_CONFIG appAdaptFontOfSize:12];
    _timeLB.text = @"2018-09-17 12:12:12";
    _timeLB.textColor = APP_CONFIG.grayTextColor;
    [_timeLB sizeToFit];
    
    _titleLB = [[UILabel alloc] init];
    _titleLB.font = [APP_CONFIG appAdaptFontOfSize:15];
    _titleLB.text = @"通知消息";
    _titleLB.textColor = APP_CONFIG.blackTextColor;
    [_titleLB sizeToFit];
    
    _detailLB = [[UILabel alloc] init];
    _detailLB.font = [APP_CONFIG appAdaptFontOfSize:12];
    _detailLB.text = @"而且那天去过哺乳期确认那天帮我不能太热闹那个别发表情你把钱耳背墙你提前被瞧不起呢亲别人不去而年轻";
    _detailLB.textColor = APP_CONFIG.grayTextColor;
    _detailLB.numberOfLines = 0;
    [_detailLB sizeToFit];
    
    _logoImgV = [[UIImageView alloc] init];
    _logoImgV.contentMode = UIViewContentModeScaleAspectFit;
    _logoImgV.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    [self.contentView addSubview:_backView];
    [self.contentView addSubview:_timeLB];
    [self.contentView addSubview:_titleLB];
    [self.contentView addSubview:_detailLB];
    [self.contentView addSubview:_logoImgV];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(AdaptatSize(15));
        make.right.equalTo(self).with.offset(-AdaptatSize(15));
        make.bottom.equalTo(self).with.offset(-AdaptatSize(10));
        make.top.equalTo(self).with.offset(AdaptatSize(30));
    }];
    [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.backView.mas_top).with.offset(-5);
        make.centerX.equalTo(self.backView);
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).with.offset(AdaptatSize(25));
        make.top.equalTo(self.backView).with.offset(AdaptatSize(10));
    }];
    if (_hasImg) {
        [_logoImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLB.mas_bottom).with.offset(5);
            make.left.equalTo(self.backView).with.offset(AdaptatSize(25));
            make.right.equalTo(self.backView).with.offset(-AdaptatSize(20));
            make.height.mas_equalTo(AdaptatSize(50));
        }];
        [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.logoImgV.mas_bottom).with.offset(5);
            make.left.equalTo(self.titleLB);
            make.right.equalTo(self.backView).with.offset(-AdaptatSize(20));
        }];
    }else {
        [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLB.mas_bottom).with.offset(5);
            make.left.equalTo(self.titleLB);
            make.right.equalTo(self.backView).with.offset(-AdaptatSize(20));
        }];
    }
}

@end
