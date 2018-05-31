//
//  GJRecommandFiveBtn.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/18.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJRecommandFiveBtn.h"

@interface GJRecommandFiveBtn ()
@property (nonatomic, strong) UILabel *topLB;
@property (nonatomic, strong) UILabel *btmLB;
@property (nonatomic, strong) UIView *btmLine;
@end

@implementation GJRecommandFiveBtn

+ (GJRecommandFiveBtn *)install {
    GJRecommandFiveBtn *btn = [[GJRecommandFiveBtn alloc] init];
    return btn;
}

- (void)setTitle:(NSString *)title {
    _topLB.text = title;
}

- (void)setDetail:(NSString *)detail {
    _btmLB.text = detail;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _topLB = [[UILabel alloc] init];
        _topLB.font = AdapFont([APP_CONFIG appBahnschriftSemiFontOfSize:18]);
        _topLB.textColor = [UIColor lightGrayColor];
        [_topLB sizeToFit];
        _btmLB = [[UILabel alloc] init];
        _btmLB.font = AdapFont([APP_CONFIG appFontOfSize:12]);
        _btmLB.textColor = [UIColor lightGrayColor];
        [_btmLB sizeToFit];
        _btmLine = [[UIView alloc] init];
        _btmLine.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        _btmLine.backgroundColor = APP_CONFIG.partnerMainColor;
        _btmLB.textColor = APP_CONFIG.partnerMainColor;
        _topLB.textColor = APP_CONFIG.partnerMainColor;
    }else {
        _btmLine.backgroundColor = [UIColor clearColor];
        _btmLB.textColor = [UIColor lightGrayColor];
        _topLB.textColor = [UIColor lightGrayColor];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self addSubview:_topLB];
    [self addSubview:_btmLB];
    [self addSubview:_btmLine];
    
    [_topLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mas_centerY);
    }];
    [_btmLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.mas_centerY).with.offset(4);
    }];
    _btmLine.frame = CGRectMake(0, self.height-3, self.width, 3);
}

@end
