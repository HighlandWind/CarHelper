//
//  GJNearbyCell.m
//  CarHelper
//
//  Created by hsrd on 2018/7/21.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJNearbyCell.h"

@interface GJNearbyCell ()
@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UILabel *topLB;
@end

@implementation GJNearbyCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor whiteColor];
    
    _topLine = [[UIView alloc] init];
    _topLine.backgroundColor = APP_CONFIG.appMainColor;
    
    _topLB = [[UILabel alloc] init];
    _topLB.font = [APP_CONFIG appAdaptBoldFontOfSize:14];
    _topLB.textColor = APP_CONFIG.blackTextColor;
    _topLB.text = @"附近的停车场";
    [_topLB sizeToFit];
    
    [self.contentView addSubview:_topLine];
    [self.contentView addSubview:_topLB];
}

- (void)layoutSubviews {
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self).with.offset(10);
        make.height.mas_equalTo(AdaptatSize(16));
        make.width.mas_equalTo(3);
    }];
    [_topLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topLine.mas_right).with.offset(7);
        make.centerY.equalTo(_topLine);
    }];
}

- (CGFloat)height {
    return AdaptatSize(220);
}


@end
