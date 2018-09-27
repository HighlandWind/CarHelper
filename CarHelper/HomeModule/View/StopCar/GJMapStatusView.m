//
//  GJMapStatusView.m
//  CarHelper
//
//  Created by hsrd on 2018/9/27.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMapStatusView.h"

@interface GJMapStatusView ()
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;
@end

@implementation GJMapStatusView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.2;
        self.layer.shadowRadius = 5.f;
        self.layer.shadowOffset = CGSizeMake(0,0);
        
        _button1 = [[UIButton alloc] init];
        [_button1 setImage:[UIImage imageNamed:@"setup"] forState:UIControlStateNormal];
        _button2 = [[UIButton alloc] init];
        [_button2 setImage:[UIImage imageNamed:@"setup"] forState:UIControlStateNormal];
        _button3 = [[UIButton alloc] init];
        [_button3 setImage:[UIImage imageNamed:@"setup"] forState:UIControlStateNormal];
        
        [self addSubview:_button1];
        [self addSubview:_button2];
        [self addSubview:_button3];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.top.equalTo(self);
        make.height.mas_equalTo(AdaptatSize(26));
    }];
    [_button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.centerY.equalTo(self);
        make.height.mas_equalTo(AdaptatSize(26));
    }];
    [_button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.bottom.equalTo(self);
        make.height.mas_equalTo(AdaptatSize(26));
    }];
}

@end
