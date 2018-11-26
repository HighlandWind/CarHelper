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
@property (nonatomic, strong) UIButton *messageBtn;
@property (nonatomic, strong) UIButton *setupBtn;
@property (nonatomic, strong) UIButton *scoreBtn;
@property (nonatomic, strong) UIButton *couponBtn;
@property (nonatomic, strong) UIButton *infoBtn;
@property (nonatomic, strong) UILabel *score;
@property (nonatomic, strong) UILabel *scoreLB;
@property (nonatomic, strong) UILabel *coupon;
@property (nonatomic, strong) UILabel *couponLB;
@end

@implementation GJMineTopCell

- (CGFloat)height {
    return AdaptatSize(135) + NavBar_H;
}

- (void)scoreBtnClick {
    BLOCK_SAFE(_blockClickScore)();
}

- (void)couponBtnClick {
    BLOCK_SAFE(_blockClickCoupon)();
}

- (void)infoBtnClick {
    BLOCK_SAFE(_blockClickInfo)();
}

- (void)messageBtnClick {
    BLOCK_SAFE(_blockClickMessage)();
}

- (void)setupBtnClick {
    BLOCK_SAFE(_blockClickSetup)();
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
    _portraitImgV.image = [UIImage imageNamed:@"mine_default_portrait"];
    
    _titleLB = [[UILabel alloc] init];
    _titleLB.font = [APP_CONFIG appAdaptFontOfSize:15];
    _titleLB.text = @"用户昵称";
    _titleLB.textColor = APP_CONFIG.blackTextColor;
    [_titleLB sizeToFit];
    
    _detailLB = [[UILabel alloc] init];
    _detailLB.font = [APP_CONFIG appAdaptFontOfSize:13];
    _detailLB.text = @"182****3245";
    _detailLB.textColor = APP_CONFIG.blackTextColor;
    [_detailLB sizeToFit];
    
    _messageBtn = [[UIButton alloc] init];
    [_messageBtn setImage:[UIImage imageNamed:@"mine_message"] forState:UIControlStateNormal];
    [_messageBtn addTarget:self action:@selector(messageBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _setupBtn = [[UIButton alloc] init];
    [_setupBtn setImage:[UIImage imageNamed:@"mine_setup"] forState:UIControlStateNormal];
    [_setupBtn addTarget:self action:@selector(setupBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _scoreBtn = [[UIButton alloc] init];
    [_scoreBtn addTarget:self action:@selector(scoreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _score = [[UILabel alloc] init];
    _score.font = [APP_CONFIG appAdaptFontOfSize:13];
    _score.text = @"100";
    _score.textColor = APP_CONFIG.blackTextColor;
    [_score sizeToFit];
    _scoreLB = [[UILabel alloc] init];
    _scoreLB.font = [APP_CONFIG appAdaptFontOfSize:13];
    _scoreLB.text = @"积分";
    _scoreLB.textColor = APP_CONFIG.blackTextColor;
    [_scoreLB sizeToFit];
    
    _couponBtn = [[UIButton alloc] init];
    [_couponBtn addTarget:self action:@selector(couponBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _coupon = [[UILabel alloc] init];
    _coupon.font = [APP_CONFIG appAdaptFontOfSize:13];
    _coupon.text = @"3张";
    _coupon.textColor = APP_CONFIG.blackTextColor;
    [_coupon sizeToFit];
    _couponLB = [[UILabel alloc] init];
    _couponLB.font = [APP_CONFIG appAdaptFontOfSize:13];
    _couponLB.text = @"优惠券";
    _couponLB.textColor = APP_CONFIG.blackTextColor;
    [_couponLB sizeToFit];
    
    _infoBtn = [[UIButton alloc] init];
    [_infoBtn addTarget:self action:@selector(infoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:_infoBtn];
    [self.contentView addSubview:_portraitImgV];
    [self.contentView addSubview:_titleLB];
    [self.contentView addSubview:_detailLB];
    [self.contentView addSubview:_messageBtn];
    [self.contentView addSubview:_setupBtn];
    [self.contentView addSubview:_scoreBtn];
    [self.contentView addSubview:_score];
    [self.contentView addSubview:_scoreLB];
    [self.contentView addSubview:_couponBtn];
    [self.contentView addSubview:_coupon];
    [self.contentView addSubview:_couponLB];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_scoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self.mas_centerX);
        make.bottom.equalTo(self).with.offset(-AdaptatSize(15));
    }];
    [_score mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scoreBtn);
        make.bottom.equalTo(self.scoreBtn.mas_centerY);
    }];
    [_scoreLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scoreBtn);
        make.top.equalTo(self.scoreBtn.mas_centerY);
    }];
    [_couponBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.bottom.equalTo(self).with.offset(-10);
        make.left.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.scoreBtn);
    }];
    [_coupon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.couponBtn);
        make.bottom.equalTo(self.couponBtn.mas_centerY);
    }];
    [_couponLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.couponBtn);
        make.top.equalTo(self.couponBtn.mas_centerY);
    }];
    [_portraitImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(AdaptatSize(12));
        make.bottom.equalTo(self.scoreBtn.mas_top).with.offset(-AdaptatSize(52));
        make.width.height.mas_equalTo(AdaptatSize(46));
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.portraitImgV);
        make.left.equalTo(self.portraitImgV.mas_right).with.offset(10);
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.portraitImgV);
        make.left.equalTo(self.titleLB);
    }];
    [_messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.portraitImgV).with.offset(-4);
        make.right.equalTo(self).with.offset(-AdaptatSize(10));
        make.width.height.mas_equalTo(AdaptatSize(30));
    }];
    [_setupBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.messageBtn);
        make.right.equalTo(self.messageBtn.mas_left).with.offset(-5);
        make.width.height.equalTo(self.messageBtn);
    }];
    [_infoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.top.equalTo(self.portraitImgV);
        make.right.equalTo(self.detailLB);
    }];
}

- (void)showBottomLine {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = APP_CONFIG.separatorLineColor;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(6);
    }];
}

@end
