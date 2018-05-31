//
//  GJPartnerBenifitHeader.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/17.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJPartnerBenifitHeader.h"
#import "GJThreeColumnLabel.h"

@interface GJPartnerBenifitHeader ()
@property (nonatomic, strong) GJThreeColumnLabel *labelsLB;
@property (nonatomic, strong) UIView *leftLine;
@property (nonatomic, strong) UIView *rightLine;
@end

@implementation GJPartnerBenifitHeader

- (void)setLeft:(NSString *)left center:(NSString *)center right:(NSString *)right {
    [_labelsLB setLeft:left center:center right:right];
}

- (void)setIsFromShop:(BOOL)isFromShop {
    if (isFromShop) {
        _labelsLB = [GJThreeColumnLabel installLeft:@"营收入账" center:@"店铺余额" right:@"异店分润"];
        [_labelsLB setTopLBColorLeft:nil center:APP_CONFIG.appMainColor right:nil];
    }else {
        _labelsLB = [GJThreeColumnLabel installLeft:@"店铺收益" center:@"合伙余额" right:@"推荐收益"];
        [_labelsLB setTopLBColorLeft:nil center:APP_CONFIG.partnerMainColor right:nil];
    }
    
    [_labelsLB setBtmLBColorLeft:[UIColor lightGrayColor] center:[UIColor lightGrayColor] right:[UIColor lightGrayColor]];
    [_labelsLB setNumLabelFontBold];
    [self addSubview:_labelsLB];
    
    [self updateFrames];
}

- (void)commonInit {
    self.backgroundColor = [UIColor colorWithRGB:51 g:51 b:51];
    
    _leftLine = [[UIView alloc] init];
    _rightLine = [[UIView alloc] init];
    _leftLine.backgroundColor = _rightLine.backgroundColor = [UIColor lightGrayColor];
    
    [self addSubview:_leftLine];
    [self addSubview:_rightLine];
    
}

- (void)updateFrames {
    [_labelsLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [_leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(AdaptatSize(30));
        make.bottom.equalTo(self).with.offset(-AdaptatSize(30));
        make.left.equalTo(self).with.offset(SCREEN_W/3);
        make.width.mas_equalTo(1);
    }];
    [_rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.width.equalTo(_leftLine);
        make.right.equalTo(self).with.offset(-SCREEN_W/3);
    }];
}

- (CGFloat)height {
    return AdaptatSize(100);
}

@end
