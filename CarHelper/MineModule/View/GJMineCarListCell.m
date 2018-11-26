
//
//  GJMineCarListCell.m
//  CarHelper
//
//  Created by hsrd on 2018/9/18.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineCarListCell.h"

@interface GJMineCarListCell ()
@property (nonatomic, strong) UIImageView *backView;
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
    
    _backView = [[UIImageView alloc] init];
    _backView.image = [UIImage imageNamed:@"mine_car_list_bg"];
    [self.contentView addSubview:_backView];
    
    _carMarkImgV = [[UIImageView alloc] init];
    _carMarkImgV.contentMode = UIViewContentModeScaleAspectFit;
    _carMarkImgV.backgroundColor = APP_CONFIG.appBackgroundColor;
    _carMarkImgV.layer.cornerRadius = AdaptatSize(40) / 2;
    _carMarkImgV.clipsToBounds = YES;
    _carMarkImgV.image = [UIImage imageNamed:@"mine_car_dazhong"];
    
    _titleLB = [[UILabel alloc] init];
    _titleLB.font = [APP_CONFIG appAdaptBoldFontOfSize:17];
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
    [_closeBtn setImage:[UIImage imageNamed:@"mine_white_close"] forState:UIControlStateNormal];
    [_closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _editBtn = [[UIButton alloc] init];
    [_editBtn setImage:[UIImage imageNamed:@"mine_white_edit"] forState:UIControlStateNormal];
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
        make.top.equalTo(self).with.offset(AdaptatSize(15));
        make.left.equalTo(self).with.offset(AdaptatSize(5));
        make.right.equalTo(self).with.offset(AdaptatSize(-5));
        make.bottom.equalTo(self).with.offset(AdaptatSize(-10));
    }];
    [_carMarkImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).with.offset(AdaptatSize(20));
        make.top.equalTo(self.backView).with.offset(AdaptatSize(15));
        make.width.height.mas_equalTo(AdaptatSize(40));
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.carMarkImgV);
        make.left.equalTo(self.carMarkImgV.mas_right).with.offset(AdaptatSize(15));
    }];
    [_markLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLB);
        make.top.equalTo(self.titleLB.mas_bottom);
    }];
    [_applyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView);
        make.bottom.equalTo(self.backView).with.offset(-AdaptatSize(22));
        make.width.mas_equalTo(AdaptatSize(110));
        make.height.mas_equalTo(AdaptatSize(30));
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.applyBtn);
        make.bottom.equalTo(self.applyBtn.mas_top).with.offset(-AdaptatSize(10));
    }];
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backView).with.offset(-AdaptatSize(15));
        make.top.equalTo(self.backView).with.offset(AdaptatSize(15));
        make.width.height.mas_equalTo(AdaptatSize(22));
    }];
    [_editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLB);
        make.left.equalTo(self.titleLB.mas_right).with.offset(0);
        make.width.height.mas_equalTo(AdaptatSize(35));
    }];
}

@end
