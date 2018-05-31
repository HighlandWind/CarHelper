//
//  GJHomeNaviView.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/17.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJHomeNaviView.h"
#import "GJHomeShopData.h"

@interface GJHomeNaviView ()
@property (nonatomic, strong) UIButton *nearbyShop;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIImageView *rightBtnImgV;
@end

@implementation GJHomeNaviView

+ (GJHomeNaviView *)install {
    GJHomeNaviView *navBar = [[GJHomeNaviView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, NavBar_H)];
    return navBar;
}

- (void)setShopData:(GJHomeShopData *)shopData {
    [_nearbyShop setTitle:shopData.supplier_name forState:UIControlStateNormal];
    if ([APP_USER.userInfo.isShop boolValue]) {
        if ([shopData.status integerValue] == 1) {
            [_rightBtn setTitle:@"营业中" forState:UIControlStateNormal];
        }
        if ([shopData.status integerValue] == 2) {
            [_rightBtn setTitle:@"暂停营业" forState:UIControlStateNormal];
        }
    }else {
        [_rightBtn setTitle:@"审核中" forState:UIControlStateNormal];
    }
    
}

- (void)clickShopName {
    
}

- (void)rightBtnClick {
    BLOCK_SAFE(_blockShopStatusClick)();
}

- (void)commonInit {
    _nearbyShop = [[UIButton alloc] init];
    _nearbyShop.adjustsImageWhenHighlighted = NO;
    _nearbyShop.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_nearbyShop setTitleColor:APP_CONFIG.whiteGrayColor forState:UIControlStateNormal];
    _nearbyShop.titleLabel.font = AdapFont([APP_CONFIG appBoldFontOfSize:17]);
    [_nearbyShop addTarget:self action:@selector(clickShopName) forControlEvents:UIControlEventTouchUpInside];
    
    _rightBtn = [[UIButton alloc] init];
    _rightBtn.adjustsImageWhenHighlighted = NO;
    [_rightBtn setTitleColor:APP_CONFIG.whiteGrayColor forState:UIControlStateNormal];
    
    _rightBtn.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:15]);
    [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _rightBtnImgV = [[UIImageView alloc] init];
    _rightBtnImgV.contentMode = UIViewContentModeScaleAspectFill;
    _rightBtnImgV.image = [UIImage imageNamed:@"nextStepWhite"];
    
    [self addSubview:_nearbyShop];
    [self addSubview:_rightBtn];
    [self addSubview:_rightBtnImgV];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _nearbyShop.size = (CGSize){self.width/2, 40};
    _nearbyShop.x = 10;
    _nearbyShop.y =  NavBar_H-40;
    
    _rightBtn.centerY = _rightBtnImgV.centerY = _nearbyShop.centerY;
    _rightBtn.size = (CGSize){AdaptatSize(80), 35};
    _rightBtn.x = SCREEN_W-AdaptatSize(90);
    _rightBtnImgV.size = (CGSize){20, 20};
    _rightBtnImgV.x = SCREEN_W-30;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    [self.layer insertSublayer:gradient atIndex:0];
    gradient.colors = @[
                        (__bridge id)[UIColor colorWithHexRGB:@"#ff7840"].CGColor,(__bridge id)[UIColor colorWithHexRGB:@"#ff3936"].CGColor];
    gradient.locations = @[@0,@1];
    gradient.startPoint = CGPointMake(0, 0.5);
    gradient.endPoint = CGPointMake(1.0, 0.5);
    gradient.frame = CGRectMake(0, 0, self.width, self.height);
}

@end
