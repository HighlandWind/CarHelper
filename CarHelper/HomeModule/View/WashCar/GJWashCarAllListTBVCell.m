//
//  GJWashCarAllListTBVCell.m
//  CarHelper
//
//  Created by hsrd on 2018/9/29.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJWashCarAllListTBVCell.h"

@interface GJWashCarAllListTBVCell ()
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *detailLB;
@property (nonatomic, strong) UILabel *rightLB;
@end

@implementation GJWashCarAllListTBVCell

- (void)commonInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self showBottomLine];
    
    _imageV = [[UIImageView alloc] init];
    _imageV.clipsToBounds = YES;
    _imageV.layer.cornerRadius = 5;
    _imageV.contentMode = UIViewContentModeScaleAspectFit;
    _imageV.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    _titleLB = [self createLabelFont:15 color:APP_CONFIG.blackTextColor];
    _detailLB = [self createLabelFont:15 color:APP_CONFIG.grayTextColor];
    _rightLB = [self createLabelFont:15 color:APP_CONFIG.grayTextColor];
    
    _titleLB.text = @"波波汽车服务";
    _detailLB.text = @"5.0分";
    _rightLB.text = @"中华中路 3.5km";
    
    [self.contentView addSubview:_imageV];
    [self.contentView addSubview:_titleLB];
    [self.contentView addSubview:_detailLB];
    [self.contentView addSubview:_rightLB];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(AdaptatSize(12));
        make.top.equalTo(self).with.offset(AdaptatSize(10));
        make.bottom.equalTo(self).with.offset(-AdaptatSize(10));
        make.width.equalTo(self.imageV.mas_height);
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(AdaptatSize(12));
        make.left.equalTo(self.imageV.mas_right).with.offset(AdaptatSize(10));
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLB);
        make.top.equalTo(self.titleLB.mas_bottom).with.offset(5);
    }];
    [_rightLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLB);
        make.right.equalTo(self).with.offset(-AdaptatSize(12));
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
