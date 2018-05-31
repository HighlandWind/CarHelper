//
//  GJApplyUserFormBottomCell.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/15.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJApplyUserFormBottomCell.h"

@interface GJApplyUserFormBottomCell ()

@end

@implementation GJApplyUserFormBottomCell

- (void)bottomBtnClick {
    BLOCK_SAFE(_blockBtmBtnClick)();
}

- (void)btmrightBtnClick {
    BLOCK_SAFE(_blockProtocolBtnClick)();
}

- (void)commonInit {
    UIColor *tuColor = [UIColor colorWithRGB:205 g:156 b:102];
    
    UIButton *bottomBtn = [[UIButton alloc] init];
    bottomBtn.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:15]);
    bottomBtn.backgroundColor = tuColor;
    [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bottomBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.contentView addSubview:bottomBtn];
    [bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(AdaptatSize(45));
    }];
    
    UILabel *btmLeftLB = [[UILabel alloc] init];
    btmLeftLB.textColor = [UIColor grayColor];
    btmLeftLB.font = AdapFont([APP_CONFIG appFontOfSize:12]);
    btmLeftLB.text = @"点击下一步，即表示已阅读并同意";
    [btmLeftLB sizeToFit];
    [self.contentView addSubview:btmLeftLB];
    [btmLeftLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottomBtn.mas_bottom).with.offset(8);
        make.right.equalTo(self.mas_centerX).with.offset(AdaptatSize(30));
    }];
    
    UIButton *btmrightBtn = [[UIButton alloc] init];
    [btmrightBtn setTitleColor:tuColor forState:UIControlStateNormal];
    btmrightBtn.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:12]);
    [btmrightBtn setTitle:@"《全智易联用户协议》" forState:UIControlStateNormal];
    [btmrightBtn addTarget:self action:@selector(btmrightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btmrightBtn];
    [btmrightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(btmLeftLB);
        make.left.equalTo(btmLeftLB.mas_right);
    }];
}

- (CGFloat)height {
    return AdaptatSize(100);
}

@end
