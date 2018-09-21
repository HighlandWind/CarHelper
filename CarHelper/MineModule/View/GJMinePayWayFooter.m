//
//  GJMinePayWayFooter.m
//  CarHelper
//
//  Created by hsrd on 2018/9/21.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMinePayWayFooter.h"

@interface GJMinePayWayFooter ()
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong) UILabel *titleLB;
@end

@implementation GJMinePayWayFooter

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)moreBtnAction {
    
}

- (void)setupSubviews {
    _moreBtn = [[UIButton alloc] init];
    _moreBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:14];
    [_moreBtn setTitle:@"更多支付方式" forState:UIControlStateNormal];
    [_moreBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_moreBtn addTarget:self action:@selector(moreBtnAction) forControlEvents:UIControlEventTouchUpInside];
    _moreBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _moreBtn.layer.borderWidth = 1;
    _moreBtn.layer.cornerRadius = 5;
    _moreBtn.clipsToBounds = YES;
    
    _titleLB = [[UILabel alloc] init];
    _titleLB.font = [APP_CONFIG appAdaptFontOfSize:12];
    _titleLB.textColor = [UIColor grayColor];
    _titleLB.text = @"您可以拖动支付方式图标调整支付顺序，也可以添加更多支付方式！";
    [_titleLB sizeToFit];
    _titleLB.numberOfLines = 2;
    
    [self addSubview:_moreBtn];
    [self addSubview:_titleLB];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self);
        make.width.mas_equalTo(self.width / 2);
        make.height.mas_equalTo(AdaptatSize(22));
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_moreBtn.mas_bottom).with.offset(AdaptatSize(10));
        make.left.equalTo(self).with.offset(AdaptatSize(45));
        make.right.equalTo(self).with.offset(-AdaptatSize(45));
    }];
}

- (CGFloat)height {
    return AdaptatSize(100);
}

@end
