//
//  GJMineEvaluateTopCell.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/18.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineEvaluateTopCell.h"

@interface GJMineEvaluateTopCell ()
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UIView *midLine;
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
    
    [self.contentView addSubview:_titleLB];
    [self.contentView addSubview:_midLine];
}

- (void)buttonClick:(UIButton *)btn {
    
}

- (void)addFiveBtns {
    NSArray *btnTexts = @[@"差", @"一般", @"不错", @"很满意", @"推荐"];
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
