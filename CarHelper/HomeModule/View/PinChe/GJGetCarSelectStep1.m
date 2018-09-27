//
//  GJGetCarSelectStep1.m
//  CarHelper
//
//  Created by hsrd on 2018/9/27.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJGetCarSelectStep1.h"

@interface GJGetCarSelectStep1 ()
@property (nonatomic, strong) UIViewController *context;
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UIButton *button;
@end

@implementation GJGetCarSelectStep1

+ (GJGetCarSelectStep1 *)installContext:(UIViewController *)context {
    GJGetCarSelectStep1 *v = [[GJGetCarSelectStep1 alloc] initWithFrame:CGRectMake(0, 0, AdaptatSize(200), AdaptatSize(175))];
    v.center = context.view.center;
    v.context = context;
    return v;
}

- (void)buttonClick {
    BLOCK_SAFE(_blockClickStartPoint)();
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [APP_CONFIG appAdaptBoldFontOfSize:17];
        _titleLB.text = @"请标注地点";
        _titleLB.textColor = [UIColor colorWithRGB:104 g:135 b:249];
        [_titleLB sizeToFit];
        
        _button = [[UIButton alloc] init];
        _button.titleLabel.font = [APP_CONFIG appAdaptBoldFontOfSize:19];
        [_button setTitle:@"出发地" forState:UIControlStateNormal];
        [_button setTitleColor:APP_CONFIG.grayTextColor forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        _button.layer.cornerRadius = 10;
        _button.layer.borderColor = _button.titleLabel.textColor.CGColor;
        _button.layer.borderWidth = 1;
        _button.clipsToBounds = YES;
        
        [self addSubview:_titleLB];
        [self addSubview:_button];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerX.equalTo(self);
    }];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.height.mas_equalTo(self.height - AdaptatSize(45));
    }];
}

@end
