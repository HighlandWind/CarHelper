//
//  GJMineTopCell.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/14.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineTopCell.h"

@interface GJMineTopCell ()
@property (nonatomic, strong) UIImageView *portraitImgV;
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *detailLB;
@property (nonatomic, strong) UIImageView *arrowImg;
@property (nonatomic, strong) UIButton *scoreBtn;
@property (nonatomic, strong) UIButton *couponBtn;
@end

@implementation GJMineTopCell

- (CGFloat)height {
    return AdaptatSize(130);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self showBottomLine];
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    _portraitImgV = [[UIImageView alloc] init];
    _portraitImgV.contentMode = UIViewContentModeScaleAspectFit;
    _portraitImgV.layer.cornerRadius = AdaptatSize(46) / 2;
    _portraitImgV.clipsToBounds = YES;
    _portraitImgV.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    _titleLB = [[UILabel alloc] init];
    _titleLB.font = [APP_CONFIG appAdaptFontOfSize:14];
    _titleLB.text = @"用户昵称";
    _titleLB.textColor = APP_CONFIG.blackTextColor;
    [_titleLB sizeToFit];
    
    _detailLB = [[UILabel alloc] init];
    _detailLB.font = [APP_CONFIG appAdaptFontOfSize:12];
    _detailLB.text = @"182****3245";
    _detailLB.textColor = APP_CONFIG.blackTextColor;
    [_detailLB sizeToFit];
    
    [self.contentView addSubview:_portraitImgV];
    [self.contentView addSubview:_titleLB];
    [self.contentView addSubview:_detailLB];
    [self.contentView addSubview:_arrowImg];
    [self.contentView addSubview:_scoreBtn];
    [self.contentView addSubview:_couponBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_portraitImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).with.offset(10);
        make.width.height.mas_equalTo(AdaptatSize(46));
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_portraitImgV);
        make.left.equalTo(_portraitImgV.mas_right).with.offset(10);
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_portraitImgV);
        make.left.equalTo(_titleLB);
    }];
    [_arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    [_scoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    [_couponBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}

- (void)showBottomLine {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = APP_CONFIG.separatorLineColor;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.height.mas_equalTo(10);
    }];
    UIView *lineMid = [[UIView alloc] init];
    lineMid.backgroundColor = APP_CONFIG.separatorLineColor;
    [self.contentView addSubview:lineMid];
    [lineMid mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.centerY.equalTo(self).with.offset(AdaptatSize(6));
        make.height.mas_equalTo(1.2);
    }];
}

@end
