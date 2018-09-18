//
//  GJMineEvaluateTopCell.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/18.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineEvaluateTopCell.h"

@interface GJMineEvaluateTopCell ()

@end

@implementation GJMineEvaluateTopCell

- (void)commonInit {
    [self showBottomLine];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
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
