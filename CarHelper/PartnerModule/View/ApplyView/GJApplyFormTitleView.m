//
//  GJApplyFormTitleView.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/15.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJApplyFormTitleView.h"

@interface GJApplyFormTitleView ()
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *detail;

@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *detailLB;
@end

@implementation GJApplyFormTitleView

+ (GJApplyFormTitleView *)installTitle:(NSString *)title detail:(NSString *)detail {
    GJApplyFormTitleView *v = [[GJApplyFormTitleView alloc] initWithFrame:CGRectMake(0, NavBar_H,  SCREEN_W, AdaptatSize(90))];
    v.title = title;
    v.detail = detail;
    return v;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _titleLB.text = title;
}

- (void)setDetail:(NSString *)detail {
    _detailLB.text = detail;
}

- (void)setupSubviews {
    _titleLB = [[UILabel alloc] init];
    _titleLB.font = AdapFont([APP_CONFIG appBoldFontOfSize:26]);
    _titleLB.textColor = APP_CONFIG.blackTextColor;
    [_titleLB sizeToFit];
    _detailLB = [[UILabel alloc] init];
    _detailLB.font = AdapFont([APP_CONFIG appFontOfSize:14]);
    _detailLB.textColor = APP_CONFIG.grayTextColor;
    [_detailLB sizeToFit];
    
    [self addSubview:_titleLB];
    [self addSubview:_detailLB];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(20);
        make.top.equalTo(self).with.offset(10);
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLB);
        make.top.equalTo(_titleLB.mas_bottom).with.offset(10);
    }];
}

@end
