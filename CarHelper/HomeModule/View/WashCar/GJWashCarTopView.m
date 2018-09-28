//
//  GJWashCarTopView.m
//  CarHelper
//
//  Created by hsrd on 2018/9/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJWashCarTopView.h"

@interface GJWashCarTopView ()
@property (nonatomic, strong) UIButton *topBtn;
@property (nonatomic, strong) UIButton *topBtnImg;
@property (nonatomic, strong) UILabel *btmLabel;
@end

@implementation GJWashCarTopView

- (void)topBtnClick {
    BLOCK_SAFE(_blockClickTopBtn)();
}

- (void)topBtnImgClick {
    BLOCK_SAFE(_blockClickTopBtn)();
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *btmLine = [[UIView alloc] init];
        btmLine.backgroundColor = APP_CONFIG.separatorLineColor;
        [self addSubview:btmLine];
        [btmLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.mas_equalTo(2);
        }];
        
        _topBtn = [[UIButton alloc] init];
        _topBtn.titleLabel.font = [APP_CONFIG appAdaptBoldFontOfSize:13];
        [_topBtn setTitle:@"请输入目的地" forState:UIControlStateNormal];
        [_topBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _topBtn.layer.cornerRadius = AdaptatSize(30) / 2;
        _topBtn.clipsToBounds = YES;
        _topBtn.backgroundColor = APP_CONFIG.appBackgroundColor;
        [_topBtn addTarget:self action:@selector(topBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        _topBtnImg = [[UIButton alloc] init];
        [_topBtnImg setImage:[UIImage imageNamed:@"setup"] forState:UIControlStateNormal];
        [_topBtnImg addTarget:self action:@selector(topBtnImgClick) forControlEvents:UIControlEventTouchUpInside];
        
        _btmLabel = [[UILabel alloc] init];
        _btmLabel.font = [APP_CONFIG appAdaptFontOfSize:12];
        _btmLabel.text = @"花果园附近的洗车服务";
        _btmLabel.textColor = APP_CONFIG.darkTextColor;
        [_btmLabel sizeToFit];
        
        [self addSubview:_topBtn];
        [self addSubview:_topBtnImg];
        [self addSubview:_btmLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_topBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(AdaptatSize(12));
        make.left.equalTo(self).with.offset(AdaptatSize(20));
        make.right.equalTo(self).with.offset(-AdaptatSize(20));
        make.height.mas_equalTo(AdaptatSize(30));
    }];
    [_topBtnImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_topBtn);
        make.right.equalTo(_topBtn).with.offset(-10);
    }];
    [_btmLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_topBtn.mas_bottom).with.offset(AdaptatSize(10));
    }];
}

@end