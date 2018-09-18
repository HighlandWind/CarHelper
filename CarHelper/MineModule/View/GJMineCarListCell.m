
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
@end

@implementation GJMineCarListCell

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
    
    [self.contentView addSubview:_carMarkImgV];
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
