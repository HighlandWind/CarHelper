//
//  GJMineTopCell.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJMineTopCell.h"

@interface GJMineTopCell ()
@property (nonatomic, strong) UIView *backGradulyV;
@property (nonatomic, strong) UIButton *gotoBindingBtn;
@property (nonatomic, strong) UIImageView *leftLogoImg;
@property (nonatomic, strong) UIImageView *rightLogoImg;
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) UIImageView *yinhaoLeft;
@property (nonatomic, strong) UIImageView *yinhaoRight;

@property (nonatomic, strong) UIImageView *portraitImgV;
@property (nonatomic, strong) UILabel *nickNameLB;
@property (nonatomic, strong) UILabel *introLB;
@end

@implementation GJMineTopCell

- (void)buttonClick:(UIButton *)button {
    if (button == _gotoBindingBtn) {
        BLOCK_SAFE(_blockBindingPayClick)();
    }
}

- (void)updatePortrait {
    NSString *nickName = JudgeContainerCountIsNull(APP_USER.userInfo.nickname) ? @"生活达人 来个昵称吧~" : APP_USER.userInfo.nickname;
    _nickNameLB.text = nickName;
    _introLB.text = APP_USER.userInfo.phone;
    
    if (APP_USER.userInfo.avatarImage) {
        _portraitImgV.image = APP_USER.userInfo.avatarImage;
        return;
    }
    [_portraitImgV sd_setImageWithURL:[NSURL URLWithString:APP_USER.userInfo.avatar] placeholderImage:[UIImage imageNamed:@"portrait"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        APP_USER.userInfo.avatarImage = image;
        [APP_USER saveLoginUserInfo:APP_USER.userInfo];
    }];
}

- (void)setMineAccountStatus:(BOOL)isBinding {
    if (isBinding) {
        _rightLabel.text  =@"已绑定完善";
        [_gotoBindingBtn setTitle:@"前往查看" forState:UIControlStateNormal];
    }else {
        _rightLabel.text  =@"提现需要哦";
        [_gotoBindingBtn setTitle:@"立即绑定" forState:UIControlStateNormal];
    }
}

- (void)commonInit {
    _backGradulyV = [[UIView alloc] init];
    _backGradulyV.clipsToBounds = YES;
    _backGradulyV.layer.cornerRadius = 12;
    
    _gotoBindingBtn = [self createButtonTitle:@"立即绑定" image:nil color:nil font:14];
    _gotoBindingBtn.layer.borderWidth = 1.2;
    _gotoBindingBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    
    _leftLogoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo1"]];
    _rightLogoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo2"]];
    
    _leftLabel = [self createLabel:14 color:[UIColor whiteColor] text:@"支付宝&微信"];
    _rightLabel = [self createLabel:23 color:[UIColor whiteColor] text:@"提现需要哦"];
    
    _yinhaoLeft = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brackets1"]];
    _yinhaoRight = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brackets2"]];
    
    _nickNameLB = [self createLabel:16 color:[UIColor grayColor] text:@""];
    _introLB = [self createLabel:14 color:[UIColor lightGrayColor] text:@""];
    _portraitImgV = [[UIImageView alloc] init];
    _portraitImgV.clipsToBounds = YES;
    _portraitImgV.layer.cornerRadius = AdaptatSize(60)/2;
    
    
    [self.contentView addSubview:_backGradulyV];
    [self.contentView addSubview:_gotoBindingBtn];
    [self.contentView addSubview:_leftLogoImg];
    [self.contentView addSubview:_rightLogoImg];
    [self.contentView addSubview:_leftLabel];
    [self.contentView addSubview:_rightLabel];
    [self.contentView addSubview:_yinhaoLeft];
    [self.contentView addSubview:_yinhaoRight];
    [self.contentView addSubview:_nickNameLB];
    [self.contentView addSubview:_introLB];
    [self.contentView addSubview:_portraitImgV];
    
    [self updateFrames];
}

- (void)updateFrames {
    [_backGradulyV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.right.equalTo(self).with.offset(-15);
        make.bottom.equalTo(self).with.offset(-5);
        make.height.mas_equalTo(AdaptatSize(145));
    }];
    [_gotoBindingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_backGradulyV);
        make.bottom.equalTo(_backGradulyV).with.offset(-15);
        make.size.mas_equalTo((CGSize){85, 30});
    }];
    [_leftLogoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(_backGradulyV).with.offset(12);
    }];
    [_rightLogoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(_backGradulyV);
    }];
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftLogoImg.mas_right).with.offset(5);
        make.centerY.equalTo(_leftLogoImg);
    }];
    [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_backGradulyV);
    }];
    [_yinhaoLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rightLabel);
        make.right.equalTo(_rightLabel.mas_left).with.offset(-5);
    }];
    [_yinhaoRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rightLabel);
        make.left.equalTo(_rightLabel.mas_right).with.offset(5);
    }];
    [_portraitImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(AdaptatSize(60));
        make.centerX.equalTo(self);
        make.top.equalTo(self).with.offset(10);
    }];
    [_nickNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_portraitImgV.mas_bottom).with.offset(10);
    }];
    [_introLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_nickNameLB.mas_bottom).with.offset(10);
    }];
}

- (UIButton *)createButtonTitle:(NSString *)title image:(NSString *)image color:(UIColor *)color font:(CGFloat)font {
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:font]);
    [button setTitle:title forState:UIControlStateNormal];
    if (color) {
        [button setTitleColor:color forState:UIControlStateNormal];
    }else {
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    if (!JudgeContainerCountIsNull(image)) {
        [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    }
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (UILabel *)createLabel:(CGFloat)font color:(UIColor *)color text:(NSString *)text {
    UILabel *lb = [[UILabel alloc] init];
    lb.font = AdapFont([APP_CONFIG appBoldFontOfSize:font]);
    lb.textColor = color;
    lb.text = text;
    [lb sizeToFit];
    return lb;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    [_backGradulyV.layer insertSublayer:gradient atIndex:0];
    gradient.colors = @[
                        (__bridge id)[UIColor colorWithHexRGB:@"#ff7840"].CGColor,(__bridge id)[UIColor colorWithHexRGB:@"#ff3936"].CGColor];
    gradient.locations = @[@0,@1];
    gradient.startPoint = CGPointMake(0, 0.5);
    gradient.endPoint = CGPointMake(1.0, 0.5);
    gradient.frame = CGRectMake(0, 0, _backGradulyV.width, _backGradulyV.height);
}

@end
