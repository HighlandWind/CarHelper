//
//  GJShopScoreHeader.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/31.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJShopScoreHeader.h"

@interface GJShopScoreHeader ()
@property (nonatomic, strong) UILabel *contentLB;
@end

@implementation GJShopScoreHeader

- (void)setScore:(NSString *)score {
    NSString *s = score;
    if (JudgeContainerCountIsNull(score)) {
        s = @"0";
    }
    NSString *str = [NSString stringWithFormat:@"店铺可用积分：%@", s];
    NSMutableAttributedString *muStr = [[NSMutableAttributedString alloc] initWithString:str];
    [muStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:[str rangeOfString:@"店铺可用积分："]];
    [muStr addAttribute:NSFontAttributeName value:AdapFont([APP_CONFIG appFontOfSize:13]) range:[str rangeOfString:@"店铺可用积分："]];
    _contentLB.attributedText = muStr;
}

- (void)commonInit {
    [self showBottomLine];
    self.backgroundColor = [UIColor whiteColor];
    _contentLB  =[[UILabel alloc] init];
    _contentLB.font = AdapFont([APP_CONFIG appBoldFontOfSize:16]);
    _contentLB.textColor = [UIColor blackColor];
    [_contentLB sizeToFit];
    [self addSubview:_contentLB];
    [_contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

- (void)showBottomLine {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithRGB:247 g:248 b:250];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(10);
    }];
}

@end
