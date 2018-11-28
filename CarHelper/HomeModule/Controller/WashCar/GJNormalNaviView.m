//
//  GJNormalNaviView.m
//  CarHelper
//
//  Created by hsrd on 2018/9/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJNormalNaviView.h"

@interface GJNormalNaviView ()
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIView *btmLine;
@end

@implementation GJNormalNaviView

+ (GJNormalNaviView *)installTitle:(NSString *)title {
    GJNormalNaviView *v = [[GJNormalNaviView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, NavBar_H)];
    v.titleLB.text = title;
    return v;
}

- (void)backBtnClick {
    BLOCK_SAFE(_blockBackClick)();
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [APP_CONFIG appAdaptBoldFontOfSize:16];
        _titleLB.textColor = [UIColor blackColor];
        [_titleLB sizeToFit];
        
        _backBtn = [[UIButton alloc] init];
        [_backBtn setImage:[UIImage imageNamed:@"arrow_left_back"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        _btmLine = [[UIView alloc] init];
        _btmLine.backgroundColor = APP_CONFIG.appBackgroundColor;
        
        [self addSubview:_titleLB];
        [self addSubview:_backBtn];
        [self addSubview:_btmLine];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset([UIApplication sharedApplication].statusBarFrame.size.height);
        make.bottom.equalTo(self);
        make.left.equalTo(self).with.offset(7);
        make.width.mas_equalTo(44);
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.backBtn);
        make.centerX.equalTo(self);
    }];
    [_btmLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}

@end
