//
//  GJMineEvaluateTopCell.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/18.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineEvaluateTopCell.h"
#import "XHStarRateView.h"

@interface GJMineEvaluateTopCell () <XHStarRateViewDelegate>
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UIView *midLine;
@property (nonatomic, strong) XHStarRateView *starView;
@end

@implementation GJMineEvaluateTopCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    [self showBottomLine];
    
    _titleLB = [[UILabel alloc] initWithFrame:CGRectMake(5, 8, self.width, 30)];
    _titleLB.font = [APP_CONFIG appAdaptFontOfSize:16];
    _titleLB.text = @"爱妃洗车服务中心";
    _titleLB.textColor = APP_CONFIG.blackTextColor;
    _titleLB.numberOfLines = 0;
    [_titleLB sizeToFit];
    
    _midLine = [[UIView alloc] init];
    _midLine.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    CGFloat w = AdaptatSize(120);
    CGFloat x = SCREEN_W / 2 - w / 2;
    _starView = [[XHStarRateView alloc] initWithFrame:CGRectMake(x, 0, w, AdaptatSize(30))];
    _starView.delegate = self;
    
    [self.contentView addSubview:_titleLB];
    [self.contentView addSubview:_midLine];
    [self.contentView addSubview:_starView];
    [self addFiveBtns];
}

- (void)buttonClick:(UIButton *)btn {
    
}

- (void)starRateView:(XHStarRateView *)starRateView currentScore:(CGFloat)currentScore {
    NSLog(@"%f", currentScore);
}

- (void)addFiveBtns {
    NSArray *btnTexts = @[@"差", @"一般", @"不错", @"很满意", @"推荐"];
    CGFloat w = (SCREEN_W - 10 * (btnTexts.count + 2)) / btnTexts.count;
    [btnTexts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [[UIButton alloc] init];
        btn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:14];
        [btn setTitle:obj forState:UIControlStateNormal];
        [btn setTitleColor:APP_CONFIG.appMainColor forState:UIControlStateNormal];
        btn.layer.cornerRadius = 3;
        btn.layer.borderColor = APP_CONFIG.appMainColor.CGColor;
        btn.layer.borderWidth = 1;
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_midLine).with.offset(11);
            make.height.mas_equalTo(AdaptatSize(35));
            make.width.mas_equalTo(w);
            make.left.equalTo(self).with.offset(10 + idx * (w + 10));
        }];
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).with.offset(AdaptatSize(15));
    }];
    [_midLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(1);
        make.top.equalTo(_titleLB.mas_bottom).with.offset(AdaptatSize(15));
    }];
    [_starView setY:self.height - AdaptatSize(65)];
}

- (CGFloat)height {
    return AdaptatSize(170);
}

- (void)showBottomLine {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = APP_CONFIG.separatorLineColor;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.height.mas_equalTo(AdaptatSize(20));
    }];
}

@end
