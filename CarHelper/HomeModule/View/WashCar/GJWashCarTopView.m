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
    BLOCK_SAFE(_blockClickYuYinBtn)();
}

- (void)setAddress:(NSString *)address {
    _address = address;
    NSString *str = [NSString stringWithFormat:@"%@附近的洗车服务", address];
    NSMutableAttributedString *muStr = [[NSMutableAttributedString alloc] initWithString:str];
    [muStr addAttribute:NSForegroundColorAttributeName value:APP_CONFIG.appMainRedColor range:[str rangeOfString:address]];
    _btmLabel.attributedText = muStr;
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
        [_topBtnImg setImage:[UIImage imageNamed:@"wash_car_yuyin"] forState:UIControlStateNormal];
        [_topBtnImg addTarget:self action:@selector(topBtnImgClick) forControlEvents:UIControlEventTouchUpInside];
        
        _btmLabel = [[UILabel alloc] init];
        _btmLabel.font = [APP_CONFIG appAdaptFontOfSize:12];
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
        make.height.mas_equalTo(AdaptatSize(35));
    }];
    [_topBtnImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.topBtn);
        make.right.equalTo(self.topBtn);
        make.width.mas_equalTo(AdaptatSize(50));
        make.height.mas_equalTo(AdaptatSize(30));
    }];
    [_btmLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.topBtn.mas_bottom).with.offset(AdaptatSize(6));
    }];
}

@end
