//
//  GJScheduleCellView.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/11.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJScheduleCellView.h"

@interface GJScheduleCellView ()
@property (nonatomic, strong) UIView *pointV;
@property (nonatomic, strong) UILabel *timeLB;
@property (nonatomic, strong) UILabel *rightLB;
@property (nonatomic, strong) UILabel *contentLB;
@property (nonatomic, strong) UIImageView *imageV;
@end

@implementation GJScheduleCellView

+ (GJScheduleCellView *)installColor:(UIColor *)color {
    GJScheduleCellView *v = [[GJScheduleCellView alloc] init];
    v.backgroundColor = color;
    return v;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setModel:(NSString *)model {
    _model = model;
    
    _contentLB = [[UILabel alloc] init];
    _contentLB.font = [APP_CONFIG appAdaptBoldFontOfSize:12];
    _contentLB.textColor = APP_CONFIG.darkTextColor;
    _contentLB.text = @"额确认后确认天河区曲儿和去年同期人不亲热去不去而突然儿和去年同期人不亲热去不去而突然";
    _contentLB.numberOfLines = 0;
    [_contentLB sizeToFit];
    
    _imageV = [[UIImageView alloc] init];
    _imageV.contentMode = UIViewContentModeScaleAspectFit;
    _imageV.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    [self addSubview:_contentLB];
    [self addSubview:_imageV];
}

- (void)setupSubViews {
    _pointV = [[UIView alloc] init];
    _pointV.backgroundColor = [UIColor colorWithRGB:247 g:98 b:0];
    _pointV.layer.cornerRadius = 2;
    _pointV.clipsToBounds = YES;
    
    _timeLB = [[UILabel alloc] init];
    _timeLB.font = [APP_CONFIG appAdaptBoldFontOfSize:12];
    _timeLB.textColor = APP_CONFIG.darkTextColor;
    _timeLB.text = @"2018-7-6前";
    [_timeLB sizeToFit];
    
    _rightLB = [[UILabel alloc] init];
    _rightLB.font = [APP_CONFIG appAdaptBoldFontOfSize:12];
    _rightLB.textColor = APP_CONFIG.darkTextColor;
    _rightLB.text = @"审车、保险费";
    [_rightLB sizeToFit];
    
    [self addSubview:_pointV];
    [self addSubview:_timeLB];
    [self addSubview:_rightLB];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_pointV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(5);
        make.width.height.mas_equalTo(4);
        if (!_model) make.centerY.equalTo(self);
        else make.top.equalTo(self).with.offset(AdaptatSize(12));
    }];
    [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_pointV.mas_right).with.offset(5);
        make.centerY.equalTo(_pointV);
        make.height.mas_equalTo(AdaptatSize(16));
    }];
    [_rightLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-10);
        make.centerY.equalTo(_pointV);
    }];
    
    if (_model) {
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_timeLB);
            make.top.equalTo(_timeLB.mas_bottom).with.offset(AdaptatSize(10));
            make.bottom.equalTo(self).with.offset(-AdaptatSize(12));
            make.width.equalTo(_imageV.mas_height);
        }];
        [_contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_imageV);
            make.left.equalTo(_imageV.mas_right).with.offset(10);
            make.right.equalTo(self).with.offset(-10);
        }];
    }
}

@end
