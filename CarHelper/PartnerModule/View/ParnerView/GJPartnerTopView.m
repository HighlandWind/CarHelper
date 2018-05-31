//
//  GJPartnerTopView.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/15.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJPartnerTopView.h"

@interface GJPartnerTopView ()
@property (nonatomic, strong) UIButton *nearbyShop;
@property (nonatomic, strong) UIImageView *rightArrow;
@end

@implementation GJPartnerTopView

+ (GJPartnerTopView *)install {
    GJPartnerTopView *navBar = [[GJPartnerTopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, NavBar_H)];
    return navBar;
}

- (CGFloat)height {
    return NavBar_H+AdaptatSize(140);
}

- (void)setIdentifierCounts:(NSUInteger)identifierCounts {
    NSString *count = [NSString stringWithFormat:@"尊敬的 %lu 重合伙人", (unsigned long)identifierCounts];
    
    NSMutableAttributedString *muStr = [[NSMutableAttributedString alloc] initWithString:count];
    [muStr addAttribute:NSForegroundColorAttributeName value:APP_CONFIG.whiteGrayColor range:[count rangeOfString:@"尊敬的"]];
    [muStr addAttribute:NSForegroundColorAttributeName value:APP_CONFIG.whiteGrayColor range:[count rangeOfString:@"重合伙人"]];
    [muStr addAttribute:NSForegroundColorAttributeName value:APP_CONFIG.partnerMainColor range:[count rangeOfString:[NSString stringWithFormat:@"%lu", (unsigned long)identifierCounts]]];
    [_nearbyShop setAttributedTitle:muStr forState:UIControlStateNormal];
}

- (void)commonInit {
    _nearbyShop = [[UIButton alloc] init];
    _nearbyShop.adjustsImageWhenHighlighted = NO;
    [_nearbyShop sizeToFit];
    _nearbyShop.titleLabel.font = AdapFont([APP_CONFIG appBoldFontOfSize:17]);
    [_nearbyShop addTarget:self action:@selector(clickNearbyShop) forControlEvents:UIControlEventTouchUpInside];
    self.identifierCounts = 0;
    
    _rightArrow = [[UIImageView alloc] init];
    _rightArrow.contentMode = UIViewContentModeScaleAspectFit;
    _rightArrow.image = [UIImage imageNamed:@"nextStepWhite"];
    
    [self addSubview:_nearbyShop];
    [self addSubview:_rightArrow];
}

- (void)clickNearbyShop {
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_nearbyShop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.top.equalTo(self).with.offset(30);
    }];
    [_rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(20);
        make.left.equalTo(_nearbyShop.mas_right);
        make.centerY.equalTo(_nearbyShop);
    }];
}

@end
