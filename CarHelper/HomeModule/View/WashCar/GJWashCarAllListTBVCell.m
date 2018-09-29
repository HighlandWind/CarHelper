//
//  GJWashCarAllListTBVCell.m
//  CarHelper
//
//  Created by hsrd on 2018/9/29.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJWashCarAllListTBVCell.h"

@interface GJWashCarAllListTBVCell ()

@end

@implementation GJWashCarAllListTBVCell

- (void)commonInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self showBottomLine];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (void)showBottomLine {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = APP_CONFIG.separatorLineColor;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}

@end
