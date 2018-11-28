//
//  GJStopCarMapTBVCell.m
//  CarHelper
//
//  Created by hsrd on 2018/9/27.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJStopCarMapTBVCell.h"

@interface GJStopCarMapTBVCell ()
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UILabel *rightBtnLB;
@property (nonatomic, strong) UIImageView *rightBtnImg;
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *detailLB;
@property (nonatomic, strong) UILabel *canBookLB;
@property (nonatomic, strong) UILabel *carInfoLB;
@property (nonatomic, strong) UILabel *markLB1;
@property (nonatomic, strong) UILabel *markLB2;
@end

@implementation GJStopCarMapTBVCell

- (void)commonInit {
    [self showBottomLine];
    self.selectionStyle = UITableViewCellSeparatorStyleNone;
    
    _titleLB = [self createLabelFont:14 color:APP_CONFIG.darkTextColor];
    _detailLB = [self createLabelFont:11 color:APP_CONFIG.grayTextColor];
    _canBookLB = [self createLabelFont:12 color:[UIColor colorWithRGB:124 g:243 b:210]];
    _carInfoLB = [self createLabelFont:11 color:APP_CONFIG.grayTextColor];
    _markLB1 = [self createLabelFont:10 color:[UIColor colorWithRGB:255 g:224 b:173]];
    _markLB1.layer.cornerRadius = 2;
    _markLB1.layer.borderColor = _markLB1.textColor.CGColor;
    _markLB1.layer.borderWidth = 1;
    _markLB1.clipsToBounds = YES;
    _markLB2 = [self createLabelFont:10 color:APP_CONFIG.grayTextColor];
    _markLB2.layer.cornerRadius = 2;
    _markLB2.layer.borderColor = _markLB2.textColor.CGColor;
    _markLB2.layer.borderWidth = 1;
    _markLB2.clipsToBounds = YES;
    
    _titleLB.text = @"花果园购物中心停车场";
    _detailLB.text = @"花果园大街";
    _canBookLB.text = @"可预约";
    _carInfoLB.text = @"剩余车位 222  4元/小时";
    _markLB1.text = @"  线上支付  ";
    _markLB2.text = @"  室内停车场  ";
    
    _rightBtn = [[UIButton alloc] init];
    _rightBtnImg = [[UIImageView alloc] init];
    _rightBtnLB = [self createLabelFont:13 color:APP_CONFIG.appMainColor];
    
    _rightBtnImg.image = [UIImage imageNamed:@"setup"];
    _rightBtnLB.text = @"550m";
    
    [self.contentView addSubview:_rightBtn];
    [self.contentView addSubview:_rightBtnImg];
    [self.contentView addSubview:_rightBtnLB];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self).with.offset(AdaptatSize(5));
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLB);
        make.top.equalTo(self.titleLB.mas_bottom);
    }];
    [_canBookLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLB);
        make.top.equalTo(self.detailLB.mas_bottom).with.offset(AdaptatSize(5));
    }];
    [_carInfoLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.canBookLB.mas_right).with.offset(10);
        make.centerY.equalTo(self.canBookLB);
    }];
    [_markLB1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLB); make.top.equalTo(self.canBookLB.mas_bottom).with.offset(AdaptatSize(5));
    }];
    [_markLB2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.markLB1.mas_right).with.offset(10);
        make.centerY.equalTo(self.markLB1);
    }];
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-AdaptatSize(10));
        make.top.equalTo(self).with.offset(AdaptatSize(10));
        make.right.equalTo(self);
        make.width.mas_equalTo(AdaptatSize(50));
    }];
    [_rightBtnImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.rightBtn);
        make.bottom.equalTo(self.rightBtn.mas_centerY).with.offset(-3);
    }];
    [_rightBtnLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.rightBtn);
        make.top.equalTo(self.rightBtn.mas_centerY).with.offset(3);
    }];
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

- (UILabel *)createLabelFont:(CGFloat)font color:(UIColor *)color {
    UILabel *label = [[UILabel alloc] init];
    label.font = [APP_CONFIG appAdaptFontOfSize:font];
    label.textColor = color;
    [label sizeToFit];
    [self.contentView addSubview:label];
    return label;
}

@end
