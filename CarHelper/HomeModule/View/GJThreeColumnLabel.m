//
//  GJThreeColumnLabel.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJThreeColumnLabel.h"

@interface GJThreeColumnLabel ()
@property (nonatomic, strong) UIView *leftBackV;
@property (nonatomic, strong) UIView *centerBackV;
@property (nonatomic, strong) UIView *rightBackV;

@property (nonatomic, strong) UILabel *leftTopLB;
@property (nonatomic, strong) UILabel *leftBtmLB;
@property (nonatomic, strong) UILabel *centerTopLB;
@property (nonatomic, strong) UILabel *centerBtmLB;
@property (nonatomic, strong) UILabel *rightTopLB;
@property (nonatomic, strong) UILabel *rightBtmLB;
@end

@implementation GJThreeColumnLabel

+ (GJThreeColumnLabel *)installLeft:(NSString *)left center:(NSString *)center right:(NSString *)right {
    GJThreeColumnLabel *label = [[GJThreeColumnLabel alloc] init];
    label.leftBtmLB.text = left;
    label.centerBtmLB.text = center;
    label.rightBtmLB.text = right;
    return label;
}

- (void)setLeft:(NSString *)left center:(NSString *)center right:(NSString *)right {
    _leftTopLB.text = [NSString stringWithFormat:@"%.2f", [left doubleValue]];
    _centerTopLB.text = [NSString stringWithFormat:@"¥%.2f", [center doubleValue]];
    _rightTopLB.text = [NSString stringWithFormat:@"%.2f", [right doubleValue]];
}

- (void)setTopLBColorLeft:(UIColor *)left center:(UIColor *)center right:(UIColor *)right {
    if (left) _leftTopLB.textColor = left;
    if (center) _centerTopLB.textColor = center;
    if (right) _rightTopLB.textColor = right;
}

- (void)setBtmLBColorLeft:(UIColor *)left center:(UIColor *)center right:(UIColor *)right {
    if (left) _leftBtmLB.textColor = left;
    if (center) _centerBtmLB.textColor = center;
    if (right) _rightBtmLB.textColor = right;
}

- (void)setNumLabelFontBold {
    _leftTopLB.font = AdapFont([APP_CONFIG appBahnschriftSemiFontOfSize:24]);
    _centerTopLB.font = AdapFont([APP_CONFIG appBahnschriftSemiFontOfSize:24]);
    _rightTopLB.font = AdapFont([APP_CONFIG appBahnschriftSemiFontOfSize:24]);
}

- (void)commonInit {
    _leftBackV = [[UIView alloc] init];
    _centerBackV = [[UIView alloc] init];
    _rightBackV = [[UIView alloc] init];
    
    _leftTopLB = [self createLabelFont:24 color:[UIColor whiteColor] isNum:1];
    _leftBtmLB = [self createLabelFont:14 color:[UIColor whiteColor] isNum:0];
    _centerTopLB = [self createLabelFont:24 color:[UIColor whiteColor] isNum:1];
    _centerBtmLB = [self createLabelFont:14 color:[UIColor whiteColor] isNum:0];
    _rightTopLB = [self createLabelFont:24 color:[UIColor whiteColor] isNum:1];
    _rightBtmLB = [self createLabelFont:14 color:[UIColor whiteColor] isNum:0];
    
    [self addSubview:_leftBackV];
    [self addSubview:_centerBackV];
    [self addSubview:_rightBackV];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateFrames];
}

- (void)updateFrames {
    [_centerBackV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.top.bottom.equalTo(self);
        make.width.mas_equalTo(self.width/3);
    }];
    [_leftBackV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(self.width/3);
    }];
    [_rightBackV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self);
        make.width.mas_equalTo(self.width/3);
    }];
    [_leftTopLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_leftBackV);
        make.bottom.equalTo(self.mas_centerY).with.offset(-5);
    }];
    [_leftBtmLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_leftBackV);
        make.top.equalTo(self.mas_centerY).with.offset(5);
    }];
    [_centerTopLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_centerBackV);
        make.bottom.equalTo(self.mas_centerY).with.offset(-5);
    }];
    [_centerBtmLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_centerBackV);
        make.top.equalTo(self.mas_centerY).with.offset(5);
    }];
    [_rightTopLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_rightBackV);
        make.bottom.equalTo(self.mas_centerY).with.offset(-5);
    }];
    [_rightBtmLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_rightBackV);
        make.top.equalTo(self.mas_centerY).with.offset(5);
    }];
}

- (UILabel *)createLabelFont:(CGFloat)font color:(UIColor *)color isNum:(BOOL)isNum {
    UILabel *lb = [[UILabel alloc] init];
    lb.textColor = color;
    if (isNum) {
        lb.font = AdapFont([APP_CONFIG appBahnschriftSemiBoldFontOfSize:font]);
    }else {
        lb.font = AdapFont([APP_CONFIG appFontOfSize:font]);
    }
    [lb sizeToFit];
    [self addSubview:lb];
    return lb;
}

@end
