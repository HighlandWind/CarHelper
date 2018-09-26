//
//  GJStopCarNaviView.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/26.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJStopCarNaviView.h"

@interface GJStopCarNaviView ()
@property (nonatomic, strong) UIView *backView;
@end

@implementation GJStopCarNaviView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.layer.cornerRadius = 5;
        _backView.layer.cornerRadius = 5;
        _backView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        _backView.layer.shadowOpacity = 0.2;
        _backView.layer.shadowRadius = 4.f;
        _backView.layer.shadowOffset = CGSizeMake(0,0);
        
        [self addSubview:_backView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
        make.bottom.equalTo(self);
        make.left.equalTo(self).with.offset(20);
        make.right.equalTo(self).with.offset(-20);
    }];
}

@end
