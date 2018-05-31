//
//  GJApplyUserBtmBtn.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/14.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJApplyUserBtmBtn.h"

@interface GJApplyUserBtmBtn ()
@property (nonatomic, strong) UIButton *bottomBtn;
@end

@implementation GJApplyUserBtmBtn

+ (GJApplyUserBtmBtn *)install {
    GJApplyUserBtmBtn *bottom = [[GJApplyUserBtmBtn alloc] initWithFrame:CGRectMake(0, SCREEN_H-AdaptatSize(95), SCREEN_W, AdaptatSize(95))];
    bottom.backgroundColor = [UIColor colorWithRGB:242 g:242 b:242];
    return bottom;
}

- (void)commonInit {
    _bottomBtn = [[UIButton alloc] init];
    _bottomBtn.backgroundColor = [UIColor blackColor];
    _bottomBtn.layer.cornerRadius = 8;
    _bottomBtn.clipsToBounds = YES;
    _bottomBtn.titleLabel.font = AdapFont([APP_CONFIG appBoldFontOfSize:18]);
    [_bottomBtn setTitle:@"立即登录" forState:UIControlStateNormal];
    [_bottomBtn setTitleColor:APP_CONFIG.whiteGrayColor forState:UIControlStateNormal];
    [_bottomBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
    [_bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_bottomBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo((CGSize){SCREEN_W-30, AdaptatSize(59)});
    }];
}

- (void)bottomBtnClick {
    BLOCK_SAFE(_bottomScanBtnBlock)();
}

@end
