//
//  GJMineOrderCell.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/17.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineOrderCell.h"

@interface GJMineOrderCell ()
@property (nonatomic, strong) UIImageView *logoImgV;
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *priceLB;
@property (nonatomic, strong) UILabel *detailLB;
@property (nonatomic, strong) UILabel *timeLB;
@property (nonatomic, strong) UILabel *statusLB;
@property (nonatomic, strong) UIButton *statusBtn;
@end

@implementation GJMineOrderCell

- (void)statusBtnClick {
    BLOCK_SAFE(_blockEvaluateClick)();
}

- (void)commonInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self showBottomLine];
    
    _logoImgV = [[UIImageView alloc] init];
    _logoImgV.contentMode = UIViewContentModeScaleAspectFit;
    _logoImgV.backgroundColor = APP_CONFIG.appBackgroundColor;
    [_logoImgV sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:CreatImageWithColor(APP_CONFIG.appBackgroundColor)];
    
    _titleLB = [self createLabelFont:15 color:APP_CONFIG.blackTextColor];
    _priceLB = [self createLabelFont:13 color:APP_CONFIG.appMainColor];
    _timeLB = [self createLabelFont:13 color:APP_CONFIG.grayTextColor];
    _statusLB = [self createLabelFont:14 color:APP_CONFIG.blackTextColor];
    _detailLB = [self createLabelFont:13 color:APP_CONFIG.grayTextColor];
    
    _titleLB.text = @"爱妃洗车服务中心";
    _detailLB.text = @"普通洗车  精致洗车 抛光";
    _priceLB.text = @"¥215.00";
    _timeLB.text = @"2018-09-17 13:24";
    _statusLB.text = @"待评价";
    
    _statusBtn = [[UIButton alloc] init];
    _statusBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:13];
    _statusBtn.layer.cornerRadius = 3;
    _statusBtn.layer.borderColor = APP_CONFIG.appMainColor.CGColor;
    _statusBtn.layer.borderWidth = 1;
    [_statusBtn setTitle:@"评价" forState:UIControlStateNormal];
    [_statusBtn setTitleColor:APP_CONFIG.appMainColor forState:UIControlStateNormal];
    [_statusBtn addTarget:self action:@selector(statusBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:_logoImgV];
    [self.contentView addSubview:_statusBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_logoImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(12);
        make.top.equalTo(self).with.offset(AdaptatSize(15));
        make.bottom.equalTo(self).with.offset(AdaptatSize(-15));
        make.width.mas_equalTo(AdaptatSize(90));
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.logoImgV);
        make.left.equalTo(self.logoImgV.mas_right).with.offset(12);
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.logoImgV);
        make.left.equalTo(self.titleLB);
    }];
    [_priceLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLB);
        make.bottom.equalTo(self.logoImgV);
    }];
    [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLB.mas_right).with.offset(10);
        make.bottom.equalTo(self.logoImgV);
    }];
    [_statusLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLB);
        make.right.equalTo(self).with.offset(-12);
    }];
    [_statusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.logoImgV);
        make.right.equalTo(self.statusLB);
        make.size.mas_equalTo((CGSize){AdaptatSize(50), 25});
    }];
}

- (UILabel *)createLabelFont:(CGFloat)font color:(UIColor *)color {
    UILabel *label = [[UILabel alloc] init];
    label.font = [APP_CONFIG appAdaptFontOfSize:font];
    label.textColor = color;
    [label sizeToFit];
    [self.contentView addSubview:label];
    return label;
}

- (void)showBottomLine {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = APP_CONFIG.separatorLineColor;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}

@end
