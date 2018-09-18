
//
//  GJMineCarListCell.m
//  CarHelper
//
//  Created by hsrd on 2018/9/18.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineCarListCell.h"

@interface GJMineCarListCell ()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIImageView *carMarkImgV;
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *markLB;
@property (nonatomic, strong) UILabel *detailLB;
@property (nonatomic, strong) UIButton *applyBtn;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIButton *editBtn;
@end

@implementation GJMineCarListCell

- (void)applyBtnClick {
    BLOCK_SAFE(_blockClickApply)();
}

- (void)closeBtnClick {
    BLOCK_SAFE(_blockClickClose)();
}

- (void)editBtnClick {
    BLOCK_SAFE(_blockClickEdit)();
}

- (void)commonInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    _backView = [[UIView alloc] init];
    [self.contentView addSubview:_backView];
    
    _carMarkImgV = [[UIImageView alloc] init];
    _carMarkImgV.contentMode = UIViewContentModeScaleAspectFit;
    _carMarkImgV.backgroundColor = APP_CONFIG.appBackgroundColor;
    _carMarkImgV.layer.cornerRadius = AdaptatSize(40) / 2;
    _carMarkImgV.clipsToBounds = YES;
    
    _titleLB = [[UILabel alloc] init];
    _titleLB.font = [APP_CONFIG appAdaptBoldFontOfSize:16];
    _titleLB.text = @"贵A-12345";
    _titleLB.textColor = APP_CONFIG.whiteGrayColor;
    [_titleLB sizeToFit];
    
    _markLB = [[UILabel alloc] init];
    _markLB.font = [APP_CONFIG appAdaptFontOfSize:10];
    _markLB.text = @" 新能源汽车 ";
    _markLB.textColor = APP_CONFIG.whiteGrayColor;
    _markLB.layer.cornerRadius = 2;
    _markLB.layer.borderColor = [UIColor whiteColor].CGColor;
    _markLB.layer.borderWidth = 1;
    [_markLB sizeToFit];
    
    _detailLB = [[UILabel alloc] init];
    _detailLB.font = [APP_CONFIG appAdaptBoldFontOfSize:13];
    _detailLB.text = @"您可以申请车辆，避免他人绑定冒用您的车牌号码";
    _detailLB.textColor = APP_CONFIG.whiteGrayColor;
    [_detailLB sizeToFit];
    
    _applyBtn = [[UIButton alloc] init];
    _applyBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:13];
    [_applyBtn setTitleColor:APP_CONFIG.whiteGrayColor forState:UIControlStateNormal];
    [_applyBtn setTitle:@"申请认证" forState:UIControlStateNormal];
    [_applyBtn addTarget:self action:@selector(applyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _applyBtn.backgroundColor = [UIColor colorWithRGB:35 g:183 b:236];
    _applyBtn.layer.cornerRadius = 4;
    _applyBtn.clipsToBounds = YES;
    
    _closeBtn = [[UIButton alloc] init];
    [_closeBtn setImage:[UIImage imageNamed:@"Doubt"] forState:UIControlStateNormal];
    [_closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _editBtn = [[UIButton alloc] init];
    [_editBtn setImage:[UIImage imageNamed:@"Doubt"] forState:UIControlStateNormal];
    [_editBtn addTarget:self action:@selector(editBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:_carMarkImgV];
    [self.contentView addSubview:_titleLB];
    [self.contentView addSubview:_markLB];
    [self.contentView addSubview:_detailLB];
    [self.contentView addSubview:_applyBtn];
    [self.contentView addSubview:_closeBtn];
    [self.contentView addSubview:_editBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).with.offset(AdaptatSize(20));
        make.right.bottom.equalTo(self).with.offset(AdaptatSize(-10));
    }];
    [_carMarkImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backView).with.offset(AdaptatSize(20));
        make.top.equalTo(_backView).with.offset(AdaptatSize(15));
        make.width.height.mas_equalTo(AdaptatSize(40));
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_carMarkImgV);
        make.left.equalTo(_carMarkImgV.mas_right).with.offset(AdaptatSize(15));
    }];
    [_markLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLB);
        make.top.equalTo(_titleLB.mas_bottom);
    }];
    [_applyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_backView);
        make.bottom.equalTo(_backView).with.offset(-AdaptatSize(15));
        make.width.mas_equalTo(AdaptatSize(110));
        make.height.mas_equalTo(AdaptatSize(30));
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_applyBtn);
        make.bottom.equalTo(_applyBtn.mas_top).with.offset(-AdaptatSize(10));
    }];
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_backView);
        make.top.equalTo(_backView);
        make.width.height.mas_equalTo(AdaptatSize(35));
    }];
    [_editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_titleLB);
        make.left.equalTo(_titleLB.mas_right).with.offset(0);
        make.width.height.mas_equalTo(AdaptatSize(35));
    }];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGFloat w = _backView.width;
    CAGradientLayer *gradient = [CAGradientLayer layer];
    [_backView.layer insertSublayer:gradient atIndex:0];
    gradient.colors = @[(__bridge id)[UIColor colorWithRGB:159 g:184 b:223].CGColor,(__bridge id)[UIColor colorWithRGB:44 g:39 b:136].CGColor];
    gradient.locations = @[@0,@1];
    gradient.startPoint = CGPointMake(0, 0.5);
    gradient.endPoint = CGPointMake(1.0, 0.5);
    gradient.frame = CGRectMake(0, 0, w, _backView.height);
    _backView.clipsToBounds = YES;
    _backView.layer.cornerRadius = 10;
}

@end
